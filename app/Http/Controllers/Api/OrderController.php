<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\PurchaseHistoryCollection;
use App\Location;
use App\Mail\EmailManager;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Cart;
use App\Models\Product;
use App\Models\OrderDetail;
use App\Models\Coupon;
use App\Models\CouponUsage;
use App\Models\BusinessSetting;
use App\User;
use Carbon\Carbon;
use DB;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
use Mail;
use PDF;
use Session;
use App\Mail\InvoiceEmailManager;
use Auth;

class OrderController extends Controller
{
    public function processOrder(Request $request)
    {       
        $coupon_discount = 0;
        if ($request->coupon_code != '') {
            $coupon  = Coupon::where('code', $request->coupon_code)
                                ->first();
            if(strtotime(date('d-m-Y')) <= $coupon->end_date){
                $coupon_discount = $coupon->discount;
            }else{
                return response()->json([
                    'success' => false,
                    'message' => 'Coupon Code Expired'
                ]);
            }
        }
        $shippingAddress = json_decode($request->shipping_address,true);

        $cartItems = Cart::where('user_id', $request->user_id)->get();
        // save order details
        $delivery_location_id = isset($shippingAddress['delivery_location'])?$shippingAddress['delivery_location']:0;
        if($delivery_location_id > 0){
            $delivery_location = Location::where('id',$delivery_location_id)->count();
            if($delivery_location > 0){
                $delivery_location = Location::where('id',$delivery_location_id)->first();
                $delivery_charge = $delivery_location->delivery_charge;   
            }else{
                $delivery_charge = 0;
            }
        }else{
            $delivery_charge = 0;
        }
        // create an order
        $order = Order::create([
            'user_id' => $request->user_id,
            'shipping_address' => json_encode($shippingAddress),
            'payment_type' => $request->payment_type,
            'payment_status' => $request->payment_status,
            'grand_total' => $request->grand_total - $request->coupon_discount,
            'coupon_discount' => $coupon_discount,
            'code' => date('Ymd-his'),
            'date' => strtotime('now'),
            'location_charge' => $delivery_charge
        ]);
        $shipping = 0;
        $admin_products = array();
        $seller_products = array();
        //

        if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'flat_rate') {
            $shipping = \App\BusinessSetting::where('type', 'flat_rate_shipping_cost')->first()->value;
        }
        elseif (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'seller_wise_shipping') {
            foreach ($cartItems as $cartItem) {
                $product = \App\Product::find($cartItem->product_id);
                if($product->added_by == 'admin'){
                    array_push($admin_products, $cartItem->product_id);
                }
                else{
                    $product_ids = array();
                    if(array_key_exists($product->user_id, $seller_products)){
                        $product_ids = $seller_products[$product->user_id];
                    }
                    array_push($product_ids, $cartItem->product_id);
                    $seller_products[$product->user_id] = $product_ids;
                }
            }
                if(!empty($admin_products)){
                    $shipping = \App\BusinessSetting::where('type', 'shipping_cost_admin')->first()->value;
                }
                if(!empty($seller_products)){
                    foreach ($seller_products as $key => $seller_product) {
                        $shipping += \App\Shop::where('user_id', $key)->first()->shipping_cost;
                    }
                }
        }
        else{
            foreach ($cartItems as $key => $cartItem) {
                $product = \App\Product::find($cartItem->product_id);
                $shipping += $product->shipping_cost;
            }
        }
        $shipping += $delivery_charge;

        foreach ($cartItems as $cartItem) {
            $product = Product::findOrFail($cartItem->product_id);
            if ($cartItem->variation) {
                $cartItemVariation = $cartItem->variation;
                $product_stocks = $product->stocks->where('variant', $cartItem->variation)->first();
                $product_stocks->qty -= $cartItem->quantity;
                $product_stocks->save();
            } else {
                $product->update([
                    'current_stock' => DB::raw('current_stock - ' . $cartItem->quantity)
                ]);
            }

            $order_detail_shipping_cost= 0;

            if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'flat_rate') {
                $order_detail_shipping_cost = $shipping/count($cartItems);
            }
            elseif (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'seller_wise_shipping') {
                if($product->added_by == 'admin'){
                    $order_detail_shipping_cost = \App\BusinessSetting::where('type', 'shipping_cost_admin')->first()->value/count($admin_products);
                }
                else {
                    $order_detail_shipping_cost = \App\Shop::where('user_id', $product->user_id)->first()->shipping_cost/count($seller_products[$product->user_id]);
                }
            }
            else{
                $order_detail_shipping_cost = \App\Product::find($cartItem['product_id'])->shipping_cost;
            }


            OrderDetail::create([
                'order_id' => $order->id,
                'seller_id' => $product->user_id,
                'product_id' => $product->id,
                'variation' => $cartItem->variation,
                'price' => $cartItem->price * $cartItem->quantity,
                'tax' => $cartItem->tax * $cartItem->quantity,
                'shipping_cost' => $order_detail_shipping_cost,
                'quantity' => $cartItem->quantity,
                'payment_status' => $request->payment_status
            ]);
            $product->update([
                'num_of_sale' => DB::raw('num_of_sale + ' . $cartItem->quantity)
            ]);
        }
        // apply coupon usage
        if ($request->coupon_code != '') {
            CouponUsage::create([
                'user_id' => $request->user_id,
                'coupon_id' => Coupon::where('code', $request->coupon_code)->first()->id
            ]);
        }
        // calculate commission
        $commission_percentage = BusinessSetting::where('type', 'vendor_commission')->first()->value;
        foreach ($order->orderDetails as $orderDetail) {
            if ($orderDetail->product->user->user_type == 'seller') {
                $seller = $orderDetail->product->user->seller;
                $price = $orderDetail->price + $orderDetail->tax + $orderDetail->shipping_cost;
                $seller->update([
                    'admin_to_pay' => ($request->payment_type == 'cash_on_delivery') ? $seller->admin_to_pay - ($price * $commission_percentage) / 100 : $seller->admin_to_pay + ($price * (100 - $commission_percentage)) / 100
                ]);
            }
        }
        // clear user's cart
        $user = User::findOrFail($request->user_id);
        $user->carts()->delete();

        set_time_limit(1500);

        // $order = Order::where('id',161)->first();
        // $shipping_address = json_decode($request->shipping_address,true);
        // return $shipping_address;
        $user = [
            'id' => Auth::user()->id,
            'email' => Auth::user()->email,
            'name' => Auth::user()->name
        ];
        $user = User::where('id',($user['id']))->first();


        // $order = Order::where('id',213)->first();
        $products = '';
        if(!empty($order->orderDetails)){
            foreach($order->orderDetails as $a => $b){
                $product_name = Product::where('id',$b['product_id'])->first();
                $products .= '<br>'.$product_name->name.'</n>';
            }
        }
        $total_amount = $order->grand_total;
        
        // $array['view'] = 'emails.newsletter';
        // $array['subject'] = 'New Order Placed';
        // $array['from'] = 'nextnepal271@gmail.com';
        // $array['content'] = 'Thank you for ordering from Sewa Digital Express. An order of total amount Rs. '.$total_amount.' has been placed for following items.';
        // $array['content'] .= $products;
        // $array['content'] .= '.</br>You can download the invoice to this order from https://www.sewaexpress.com/purchase_history';
        // Mail::to(Auth::user()->email)->queue(new EmailManager($array));
        
        set_time_limit(1500);
        //stores the pdf for invoice
        // $pdf = PDF::setOptions([
        //     'isHtml5ParserEnabled' => true, 
        //     'isRemoteEnabled' => true,
        //     "isPhpEnabled"=>true,
        //     'logOutputFile' => storage_path('logs/log.htm'),
        //     'tempDir' => storage_path('logs/'),
        // ])->loadView('invoices.customer_invoice', compact('order','user'));
        // $output = $pdf->output();
        // file_put_contents(public_path('/invoices/Order#' . $order->code . '.pdf'), $output);

        // $pdf->download('Order-'.$order->code.'.pdf');
        $data['view'] = 'emails.invoice';
        $data['subject'] = 'Sewa Express - Order Placed - ' . $order->code;
        $data['from'] = Config::get('mail.username');
        $data['content'] = 'Hi. Thank you for ordering from Sewa Express. Your order code is '.$order->code;
        // $data['file'] = public_path('invoices/' . 'Order#' . $order->code . '.pdf');
        // $data['file_name'] = 'Order#' . $order->code . '.pdf';

        if (Config::get('mail.username') != null) {
            try {
                // Mail::to($request->session()->get('shipping_info')['email'])->send(new InvoiceEmailManager($data));
                Mail::to(Auth::user()->email)->queue(new InvoiceEmailManager($data));
                // Mail::to(User::where('user_type', 'admin')->first()->email)->queue(new InvoiceEmailManager($data));
                Log::info('Mail Sent');
            } catch (\Exception $e) {
                Log::info($e->getMessage());
            }
        }
        unlink($data['file']);

        return response()->json([
            'success' => true,
            'message' => 'Your order has been placed successfully',
            'order_code' => $order->code
        ]);
    }

    public function store(Request $request)
    {
        return $this->processOrder($request);
    }
    public function getOrder($code)
    {
        $order = Order::where('code',$code)->count();
        if($order > 0){
            $data = Order::where('code',$code)->first();
        // return $order;
                $placeholder_img='frontend/images/placeholder.jpg';
                $a =  [
                    'order_id' => $data->id,
                    'code' => $data->code,
                    'user' => [
                        'name' => $data->user->name,
                        'email' => $data->user->email,
                        'avatar' =>file_exists($data->user->avatar) ? $data->user->avatar : $placeholder_img,
                        'avatar_original' => file_exists($data->user->avatar_original) ? $data->user->avatar_original : $placeholder_img
                    ],
                    'shipping_address' => json_decode($data->shipping_address),
                    'payment_type' => str_replace('_', ' ', $data->payment_type),
                    'payment_status' => $data->payment_status,
                    'grand_total' => (double) $data->grand_total,
                    'coupon_discount' => (double) $data->coupon_discount,
                    'shipping_cost' => (double) $data->orderDetails->sum('shipping_cost'),
                    'subtotal' => (double) $data->orderDetails->sum('price'),
                    'tax' => (double) $data->orderDetails->sum('tax'),
                    'date' => Carbon::createFromTimestamp($data->date)->format('d-m-Y'),
                    'links' => [
                        'details' => route('purchaseHistory.details', $data->id)
                    ]
                ];
            return response()->json([
                'success' => true,
                'message' => 'Order get successfully',
                'order_code' => $a
            ]);
        }
        return response()->json([
            'success' => false,
            'message' => 'Order not found',
            'order_code' => ''
        ]);
    }
}
