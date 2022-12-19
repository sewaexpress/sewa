<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Category;
use App\Http\Controllers\PaypalController;
use App\Http\Controllers\InstamojoController;
use App\Http\Controllers\ClubPointController;
use App\Http\Controllers\StripePaymentController;
use App\Http\Controllers\PublicSslCommerzPaymentController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\AffiliateController;
use App\Http\Controllers\PaytmController;
use App\Order;
use App\BusinessSetting;
use App\Coupon;
use App\CouponUsage;
use App\User;
use App\Address;
use App\Mail\InvoiceEmailManager;
use App\Models\Cart;
use App\Models\OrderDetail;
use App\Product;
use Session;
use PDF;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
use Mail;

class CheckoutController extends Controller
{

    public function __construct()
    {
        //
    }
    public function test(){
        $order_id = Session::get('order_id');    
        $ordercode = Order::where('id', $order_id)->first();
        return view('frontend.payment.esewa',compact('ordercode'));
    }
    public function nicCallback(Request $request){
        // payment_details
        $order_code = $request->req_transaction_uuid;
        $order = Order::where('code',$order_code)->first();
        // return $this->checkout_done($order->id,$request->all());


        $order_details = OrderDetail::where('order_id',$order->id)->update(['payment_status'=>'paid']);
        $order->payment_status = 'paid';
        $json =json_encode([$request->all()]);
        $order->payment_details =$json;
        // $order->save();

        // if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated) {
        //     $affiliateController = new AffiliateController;
        //     $affiliateController->processAffiliatePoints($order);
        // }

        // if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated) {
        //     $clubpointController = new ClubPointController;
        //     $clubpointController->processClubPoints($order);
        // }

        if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() == null || !\App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
            if (BusinessSetting::where('type', 'category_wise_commission')->first()->value != 1) {
                $commission_percentage = BusinessSetting::where('type', 'vendor_commission')->first()->value;
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = 'paid';
                    $orderDetail->save();
                    if($orderDetail->product->user->user_type == 'seller'){
                        $seller = $orderDetail->product->user->seller;
                        $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100 + $orderDetail->tax;
                        $seller->save();
                    }
                }
            }
            else{
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = 'paid';
                    $orderDetail->save();
                    if($orderDetail->product->user->user_type == 'seller'){
                        $commission_percentage = $orderDetail->product->category->commision_rate;
                        $seller = $orderDetail->product->user->seller;
                        // + $orderDetail->shipping_cost
                        $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100  + $orderDetail->tax;
                        $seller->save();
                    }
                }
            }
        }
        else {
            foreach ($order->orderDetails as $key => $orderDetail) {
                $orderDetail->payment_status = 'paid';
                $orderDetail->save();
                if($orderDetail->product->user->user_type == 'seller'){
                    $seller = $orderDetail->product->user->seller;
                    $seller->admin_to_pay = $seller->admin_to_pay + $orderDetail->price + $orderDetail->tax + $orderDetail->shipping_cost;
                    $seller->save();
                }
            }
        }

        $order->commission_calculated = 1;
        $order->save();

        set_time_limit(1500);
        //stores the pdf for invoice
        $pdf = PDF::setOptions([
            'isHtml5ParserEnabled' => true, 
            'isRemoteEnabled' => true,
            "isPhpEnabled"=>true,
            'logOutputFile' => storage_path('logs/log.htm'),
            'tempDir' => storage_path('logs/'),
        ])->loadView('invoices.customer_invoice', compact('order'));
        $output = $pdf->output();
        file_put_contents(public_path('/invoices/Order#' . $order->code . '.pdf'), $output);

        // $pdf->download('Order-'.$order->code.'.pdf');
        $data['view'] = 'emails.invoice';
        $data['subject'] = 'Sewa Digital Express - Order Placed - ' . $order->code;
        $data['from'] = Config::get('mail.username');
        $data['content'] = 'Hi. Thank you for ordering from Sewa Digital Express. Here is the pdf of the invoice.';
        $data['file'] = public_path('invoices/' . 'Order#' . $order->code . '.pdf');
        $data['file_name'] = 'Order#' . $order->code . '.pdf';

        if (Config::get('mail.username') != null) {
            try {
                // Mail::to($request->session()->get('shipping_info')['email'])->send(new InvoiceEmailManager($data));
                Mail::to($request->session()->get('shipping_info')['email'])->queue(new InvoiceEmailManager($data));
                Mail::to(User::where('user_type', 'admin')->first()->email)->queue(new InvoiceEmailManager($data));
                Log::info('Mail Sent');
            } catch (\Exception $e) {
                Log::info($e->getMessage());
            }
        }
        unlink($data['file']);
        Session::put('cart', collect([]));
        // Session::forget('order_id');
        Session::forget('payment_type');
        Session::forget('delivery_info');
        Session::forget('coupon_id');
        Session::forget('coupon_discount');

        flash(__('Payment completed'))->success();

        return redirect()->route('order_confirmed');
        // $order_id = Session::get('order_id');
        // dd($order_code,$request->all());
    }
    public function niccancel(){
        return redirect()->route('home');
    }
    //check the selected payment gateway and redirect to that controller accordingly
    public function checkout(Request $request)
    {
            // dd($request->all());
        if ($request->payment_option != null) {

            $orderController = new OrderController;
            $orderController->store($request);

            $request->session()->put('payment_type', 'cart_payment');

            if($request->session()->get('order_id') != null){
                if($request->payment_option == 'paypal'){
                    $paypal = new PaypalController;
                    return $paypal->getCheckout();
                }
                elseif ($request->payment_option == 'cash_on_delivery') {
                    $request->session()->put('cart', collect([]));
                    // $request->session()->forget('order_id');
                    $request->session()->forget('delivery_info');
                    $request->session()->forget('coupon_id');
                    $request->session()->forget('coupon_discount');

                    flash("Your order has been placed successfully")->success();
                	return redirect()->route('order_confirmed');
                }
                elseif ($request->payment_option == 'wallet') {
                    $user = Auth::user();
                    $user->balance -= Order::findOrFail($request->session()->get('order_id'))->grand_total;
                    $user->save();
                    return $this->checkout_done($request->session()->get('order_id'), null);
                }
                elseif($request->payment_option == 'nic'){
                    $nic = new NicController;
                    return $nic->nic();
                }
                elseif($request->payment_option == 'esewa'){
                    $esewa = new EsewaController;
                    return $esewa->esewa();
                }
                else{
                    $order = Order::findOrFail($request->session()->get('order_id'));
                    $order->manual_payment = 1;
                    $order->save();

                    $request->session()->put('cart', collect([]));
                    // $request->session()->forget('order_id');
                    $request->session()->forget('delivery_info');
                    $request->session()->forget('coupon_id');
                    $request->session()->forget('coupon_discount');

                    flash(__('Your order has been placed successfully. Please submit payment information from purchase history'))->success();
                	return redirect()->route('order_confirmed');
                }
            }
        }else {
            flash(__('Select Payment Option.'))->success();
            return back();
        }
    }

    //redirects to this method after a successfull checkout
    public function checkout_done($order_id, $payment)
    {
        $order = Order::findOrFail($order_id);
        $order->payment_status = 'paid';
        $order->payment_details = $payment;
        $order->save();

        if (\App\Addon::where('unique_identifier', 'affiliate_system')->first() != null && \App\Addon::where('unique_identifier', 'affiliate_system')->first()->activated) {
            $affiliateController = new AffiliateController;
            $affiliateController->processAffiliatePoints($order);
        }

        if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated) {
            $clubpointController = new ClubPointController;
            $clubpointController->processClubPoints($order);
        }

        if(\App\Addon::where('unique_identifier', 'seller_subscription')->first() == null || !\App\Addon::where('unique_identifier', 'seller_subscription')->first()->activated){
            if (BusinessSetting::where('type', 'category_wise_commission')->first()->value != 1) {
                $commission_percentage = BusinessSetting::where('type', 'vendor_commission')->first()->value;
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = 'paid';
                    $orderDetail->save();
                    if($orderDetail->product->user->user_type == 'seller'){
                        $seller = $orderDetail->product->user->seller;
                        $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100 + $orderDetail->tax + $orderDetail->shipping_cost;
                        $seller->save();
                    }
                }
            }
            else{
                foreach ($order->orderDetails as $key => $orderDetail) {
                    $orderDetail->payment_status = 'paid';
                    $orderDetail->save();
                    if($orderDetail->product->user->user_type == 'seller'){
                        $seller_id=$orderDetail->product->user->seller->id;
                        // dd($seller_id);
                        $category_id = $orderDetail->product->category->id;
                        // dd($category_id);
                        $commission=Commission::where('seller_id',$seller_id)->where('category_id',$category_id)->first();
                        // dd($commission);
                        
                        $commission_percentage =$commission->commission_rate;

                        // $commission_percentage =$orderDetail->product->category->commision_rate;
                        $seller = $orderDetail->product->user->seller;
                        // $seller->admin_to_pay = $seller->admin_to_pay - ($orderDetail->price * $commission_percentage) / 100;
                        $afterCommissionPrice = $orderDetail->price - ($orderDetail->price * $commission_percentage) / 100;
                        // dd($afterCommissionPrice);
                        $seller->admin_to_pay = $seller->admin_to_pay + $afterCommissionPrice;
                        $seller->save();
                    }
                }
            }
        }
        else {
            foreach ($order->orderDetails as $key => $orderDetail) {
                $orderDetail->payment_status = 'paid';
                $orderDetail->save();
                if($orderDetail->product->user->user_type == 'seller'){
                    $seller = $orderDetail->product->user->seller;
                    $seller->admin_to_pay = $seller->admin_to_pay + $orderDetail->price + $orderDetail->tax + $orderDetail->shipping_cost;
                    $seller->save();
                }
            }
        }

        $order->commission_calculated = 1;
        $order->save();

        Session::put('cart', collect([]));
        // Session::forget('order_id');
        Session::forget('payment_type');
        Session::forget('delivery_info');
        Session::forget('coupon_id');
        Session::forget('coupon_discount');

        flash(__('Payment completed'))->success();
        return redirect()->route('order_confirmed');
    }

    public function get_shipping_info(Request $request)
    {
        $cart = $request->session()->get('cart', collect([]));
        foreach ($cart as $key => $cartItem){
            $product = Product::where('id',$cartItem['id'])->count();
            if($product <=0 ){
                unset($cart[$key]);
                if(Auth::check()){
                    $removeFromDb = Cart::where('user_id',Auth::user()->id)->where('product_id',$cartItem['id'])->delete();
                }  
            }  
        }
        $request->session()->forget('cart');
        $request->session()->put('cart', $cart);
        
        if (Auth::check()) {
            if(Auth::user()->user_type == 'admin'){
                flash(__('Not Allowed for Admin'))->error();
                return redirect()->back()->withInput()->with('error', 'Not Allowed for Admin');
            }
        }
        if(Session::has('selectedLocation')){
            Session::forget('selectedLocation');
        }
        if(Session::has('cart') && count(Session::get('cart')) > 0){
            $categories = Category::all();
            return view('frontend.shipping_info', compact('categories'));
        }
        flash(__('Your cart is empty'))->success();
        return back();
    }

    public function getShippingInfo(Request $request)
    {
        if(Session::has('cart') && count(Session::get('cart')) > 0){
            $categories = Category::all();
            return view('frontend.get_shipping_info', compact('categories'));
        }
        flash(__('Your cart is empty'))->success();
        return back();
    }

    public function store_shipping_info(Request $request)
    {
        if (Auth::check()) {
            if($request->address_id == null){
                flash("Please add shipping address")->warning();
                return back();
            }
            $address = Address::findOrFail($request->address_id);
            $data['name'] = Auth::user()->name;
            $data['email'] = Auth::user()->email;
            $data['address'] = $address->address;
            $data['delivery_location'] = $address->delivery_location;
            $data['country'] = $address->country;
            $data['city'] = $address->city;
            $data['postal_code'] = $address->postal_code;
            $data['phone'] = $address->phone;
            $data['checkout_type'] = $request->checkout_type;
        }
        else {
            $data['name'] = $request->name;
            $data['email'] = $request->email;
            $data['address'] = $request->address;
            $data['country'] = $request->country;
            $data['city'] = $request->city;
            $data['postal_code'] = $request->postal_code;
            $data['phone'] = $request->phone;
            $data['checkout_type'] = $request->checkout_type;
        }

        // dd($address->delivery_location);
        $shipping_info = $data;
        $request->session()->put('shipping_info', $shipping_info);

        $subtotal = 0;
        $tax = 0;
        $shipping = 0;
        foreach (Session::get('cart') as $key => $cartItem){
            $subtotal += $cartItem['price']*$cartItem['quantity'];
            $tax += $cartItem['tax']*$cartItem['quantity'];
            $shipping += $cartItem['shipping']*$cartItem['quantity'];
        }
        // foreach (Auth::user()->addresses as $key => $address){
            // if ($address->set_default){
                // $default_location = $address;
                $location = \App\Location::where('id',$address->delivery_location)->count();
                if($location > 0){
                    $location = \App\Location::where('id',$address->delivery_location)->first();
                    $delivery_charge = $location->delivery_charge;
                    $shipping += $delivery_charge;
                }
            // }
        // }
        $locationSelected = $address->delivery_location;
        $total = $subtotal + $tax + $shipping;
        if(Session::has('selectedLocation')){
            Session::forget('selectedLocation');
        }
        Session::put('selectedLocation',$locationSelected);
        
        if(Session::has('coupon_discount')){
                $total -= Session::get('coupon_discount');
        }

        return view('frontend.delivery_info',compact('locationSelected'));
        // return view('frontend.payment_select', compact('total'));
    }

    public function store_delivery_info(Request $request)
    {
        if(Session::has('cart') && count(Session::get('cart')) > 0){
            // $cart = $request->session()->get('cart', collect([]));
            $cart =collect(Session::get('cart'));
            // dd($cart);
            $cart = $cart->map(function ($object, $key) use ($request) {
                if(\App\Product::find($object['id'])->added_by == 'admin'){
                    if($request['shipping_type_admin'] == 'home_delivery'){
                        $object['shipping_type'] = 'home_delivery';
                        $object['shipping'] = \App\Product::find($object['id'])->shipping_cost;
                    }
                    else{
                        $object['shipping_type'] = 'pickup_point';
                        $object['pickup_point'] = $request->pickup_point_id_admin;
                        $object['shipping'] = 0;
                    }
                }
                else{
                    if($request['shipping_type_'.\App\Product::find($object['id'])->user_id] == 'home_delivery'){
                        $object['shipping_type'] = 'home_delivery';
                        $object['shipping'] = \App\Product::find($object['id'])->shipping_cost;
                    }
                    else{
                        $object['shipping_type'] = 'pickup_point';
                        $object['pickup_point'] = $request['pickup_point_id_'.\App\Product::find($object['id'])->user_id];
                        $object['shipping'] = 0;
                    }
                }
                $object['note'] = $request->note;
                return $object;
            });

            $request->session()->put('cart', $cart);

            // dd($request->session()->get('cart', $cart));
            $subtotal = 0;
            $tax = 0;
            $shipping = 0;
            foreach (Session::get('cart') as $key => $cartItem){
                $subtotal += $cartItem['price']*$cartItem['quantity'];
                $tax += $cartItem['tax']*$cartItem['quantity'];
                $shipping += $cartItem['shipping']*$cartItem['quantity'];
            }

            $total = $subtotal + $tax + $shipping;

            if(Session::has('coupon_discount')){
                    $total -= Session::get('coupon_discount');
            }

            //dd($total);

            return view('frontend.payment_select', compact('total'));
        }
        else {
            flash('Your Cart was empty')->warning();
            return redirect()->route('home');
        }
    }

    public function get_payment_info(Request $request)
    {
        $subtotal = 0;
        $tax = 0;
        $shipping = 0;
        foreach (Session::get('cart') as $key => $cartItem){
            $subtotal += $cartItem['price']*$cartItem['quantity'];
            $tax += $cartItem['tax']*$cartItem['quantity'];
            $shipping += $cartItem['shipping']*$cartItem['quantity'];
        }

        $total = $subtotal + $tax + $shipping;

        if(Session::has('coupon_discount')){
                $total -= Session::get('coupon_discount');
        }

        return view('frontend.payment_select', compact('total'));
    }

    public function apply_coupon_code(Request $request){
        //dd($request->all());
        $coupon = Coupon::where('code', $request->code)->first();

        
        if($coupon != null){
            if($coupon->new_customer == 0){
                if(strtotime(date('d-m-Y')) >= $coupon->start_date && strtotime(date('d-m-Y')) <= $coupon->end_date){
                    if(CouponUsage::where('user_id', Auth::user()->id)->where('coupon_id', $coupon->id)->first() == null){
                        $coupon_details = json_decode($coupon->details);

                        if ($coupon->type == 'cart_base')
                        {
                            $subtotal = 0;
                            $tax = 0;
                            $shipping = 0;
                            foreach (Session::get('cart') as $key => $cartItem)
                            {
                                $subtotal += $cartItem['price']*$cartItem['quantity'];
                                $tax += $cartItem['tax']*$cartItem['quantity'];
                                $shipping += $cartItem['shipping']*$cartItem['quantity'];
                            }
                            $sum = $subtotal+$tax+$shipping;

                            if ($sum > $coupon_details->min_buy) {
                                if ($coupon->discount_type == 'percent') {
                                    $coupon_discount =  ($sum * $coupon->discount)/100;
                                    if ($coupon_discount > $coupon_details->max_discount) {
                                        $coupon_discount = $coupon_details->max_discount;
                                    }
                                }
                                elseif ($coupon->discount_type == 'amount') {
                                    $coupon_discount = $coupon->discount;
                                }
                                $request->session()->put('coupon_id', $coupon->id);
                                $request->session()->put('coupon_discount', $coupon_discount);
                                flash('Coupon has been applied')->success();
                            }
                        }
                        elseif ($coupon->type == 'product_base')
                        {
                            $coupon_discount = 0;
                            foreach (Session::get('cart') as $key => $cartItem){
                                foreach ($coupon_details as $key => $coupon_detail) {
                                    if($coupon_detail->product_id == $cartItem['id']){
                                        if ($coupon->discount_type == 'percent') {
                                            $coupon_discount += $cartItem['price']*$coupon->discount/100;
                                        }
                                        elseif ($coupon->discount_type == 'amount') {
                                            $coupon_discount += $coupon->discount;
                                        }
                                    }
                                }
                            }
                            $request->session()->put('coupon_id', $coupon->id);
                            $request->session()->put('coupon_discount', $coupon_discount);
                            flash('Coupon has been applied')->success();
                        }
                    }
                    else{
                        flash('You already used this coupon!')->warning();
                    }
                }
                else{
                    flash('Coupon expired!')->warning();
                }
            }else{
                $isNewUser = count(Order::where('user_id', Auth::user()->id)->get()) < 0 ? true : false;
                if($isNewUser){
                    if(strtotime(date('d-m-Y')) >= $coupon->start_date && strtotime(date('d-m-Y')) <= $coupon->end_date){
                        if(CouponUsage::where('user_id', Auth::user()->id)->where('coupon_id', $coupon->id)->first() == null){
                            $coupon_details = json_decode($coupon->details);
    
                            if ($coupon->type == 'cart_base')
                            {
                                $subtotal = 0;
                                $tax = 0;
                                $shipping = 0;
                                foreach (Session::get('cart') as $key => $cartItem)
                                {
                                    $subtotal += $cartItem['price']*$cartItem['quantity'];
                                    $tax += $cartItem['tax']*$cartItem['quantity'];
                                    $shipping += $cartItem['shipping']*$cartItem['quantity'];
                                }
                                $sum = $subtotal+$tax+$shipping;
    
                                if ($sum > $coupon_details->min_buy) {
                                    if ($coupon->discount_type == 'percent') {
                                        $coupon_discount =  ($sum * $coupon->discount)/100;
                                        if ($coupon_discount > $coupon_details->max_discount) {
                                            $coupon_discount = $coupon_details->max_discount;
                                        }
                                    }
                                    elseif ($coupon->discount_type == 'amount') {
                                        $coupon_discount = $coupon->discount;
                                    }
                                    $request->session()->put('coupon_id', $coupon->id);
                                    $request->session()->put('coupon_discount', $coupon_discount);
                                    flash('Coupon has been applied')->success();
                                }
                            }
                            elseif ($coupon->type == 'product_base')
                            {
                                $coupon_discount = 0;
                                foreach (Session::get('cart') as $key => $cartItem){
                                    foreach ($coupon_details as $key => $coupon_detail) {
                                        if($coupon_detail->product_id == $cartItem['id']){
                                            if ($coupon->discount_type == 'percent') {
                                                $coupon_discount += $cartItem['price']*$coupon->discount/100;
                                            }
                                            elseif ($coupon->discount_type == 'amount') {
                                                $coupon_discount += $coupon->discount;
                                            }
                                        }
                                    }
                                }
                                $request->session()->put('coupon_id', $coupon->id);
                                $request->session()->put('coupon_discount', $coupon_discount);
                                flash('Coupon has been applied')->success();
                            }
                        }
                        else{
                            flash('You already used this coupon!')->warning();
                        }
                    }
                    else{
                        flash('Coupon expired!')->warning();
                    }
                }
                else{
                    flash('This Coupon Code is for new users!')->warning();
                }
            }

        }
        else {
            flash('Invalid coupon!')->warning();
        }
        return back();
    }

    public function remove_coupon_code(Request $request){
        $request->session()->forget('coupon_id');
        $request->session()->forget('coupon_discount');
        return back();
    }

    public function order_confirmed(){
        //removefrom table
        Cart::where('user_id',Auth::user()->id)->delete();
        $order = Order::findOrFail(Session::get('order_id'));
        return view('frontend.order_confirmed', compact('order'));
    }
}
