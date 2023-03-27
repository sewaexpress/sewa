<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Order;
use App\Http\Controllers\CustomerPackageController;
use App\Http\Controllers\CommissionController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\WalletController;
use App\BusinessSetting;
use App\CustomerPackage;
use App\SellerPackage;
use App\OrderDetail;
use App\Checkout;
use App\Seller;
use Session;
use Stripe;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Log;
use App\Mail\InvoiceEmailManager;
use App\User;
use Mail;
use PDF;
use SimpleXMLElement;

class EsewaController extends Controller
{
    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */
    public function esewa()
    {
      $order_id = Session::get('order_id');
    
      $ordercode = Order::where('id', $order_id)->first();
      
      return view('frontend.payment.esewa',compact('ordercode'));
     
      
    }
  
    public function success(Request $request)
    {
     
  	    $oid = $_GET['oid'];
        $amt = $_GET['amt'];
        $refId=$_GET['refId'];
        $order = Order::where('code',$oid)->first();
        // dd($order);
        if($amt == $order->grand_total ){
            $order_details = OrderDetail::where('order_id',$order->id)->update(['payment_status'=>'paid']);
          
            $json =json_encode([
                'refid id' =>$refId,
                'order id' =>$oid,
                'amt' =>$amt,
            ]);
            $order->payment_details =$json;
            $payment_status = 0;
            $esewa=json_decode(\App\BusinessSetting::where('type','esewa_payment')->first()->value);

           
            
            if($_SERVER['HTTP_HOST'] == 'localhost:8000'){
                $url = "https://uat.esewa.com.np/epay/transrec";
                $data =[
                    'amt'=>$amt,
                    'rid'=> $refId,
                    'pid'=> $oid,
                    'scd'=> 'EPAYTEST'
                ];
            }else{
                $url = "https://esewa.com.np/epay/transrec";
                $data =[
                    'amt'=>$amt,
                    'rid'=> $refId,
                    'pid'=> $oid,
                    'scd'=> $esewa->esewa_key
                ];
            }
            
            $curl = curl_init($url);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            $response = curl_exec($curl);
    
            $status_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
            
            // Process the response
            if ($status_code == 200) {
                $response = new SimpleXMLElement($response);
                if(trim($response->response_code) == 'failure'){
                    $payment_status = 'unpaid';
                }elseif(trim($response->response_code) == 'Success'){
                    $payment_status = 'paid';
                }else{
                    $payment_status = 'unpaid';
                }
            } else {
                $payment_status = 'unpaid';
            }
            $order->payment_status = $payment_status;
        	$order->save();
            $payment=$json;

           
            $order = Order::findOrFail($order->id);
            $order->payment_status = $payment_status;
            $order->payment_details = $payment;
            $order->save();

            Session::put('cart', collect([]));
            // Session::forget('order_id');
            Session::forget('payment_type');
            Session::forget('delivery_info');
            Session::forget('coupon_id');
            Session::forget('coupon_discount');
            if($payment_status == 'paid'){
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
                                $commission_percentage = $orderDetail->product->category->commision_rate;
                                $seller = $orderDetail->product->user->seller;
                                $seller->admin_to_pay = $seller->admin_to_pay + ($orderDetail->price*(100-$commission_percentage))/100  + $orderDetail->tax + $orderDetail->shipping_cost;
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
                flash(__('Payment completed'))->success();
            }else{
                flash(__('Error : Sorry we could not complete the payment.'))->error(); 
            }
        
            return redirect()->route('order_confirmed');


        }
      
    }
  
    public function fail()
    {
   
        abort(404);
       
    }


}