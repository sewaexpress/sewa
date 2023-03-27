<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\PurchaseHistoryCollection;
use App\Models\Order;
use Illuminate\Http\Request;

class PurchaseHistoryController extends Controller
{
    public function index($id)
    {
        return new PurchaseHistoryCollection(Order::where('user_id', $id)->latest()->get());
    }
    public function updateTransaction(Request $request){
        $order_code = $request->code;
        if($request->details == null || $request->code == null){
            return response()->json([
                'success' => false,
                'message' => "We couldn't process your payment, payment failed!",
            ]); 
        }
        $order = Order::where('code',$order_code)->count();
        if($order > 0){
            $data = Order::where('code',$order_code)->first();
            $data->payment_details = isset($request->details)?$request->details:null;
            $payment_details = json_decode($request->details,true);
            $khalti_secret=\App\BusinessSetting::where('type','khalti_secret')->first();
            
            if(!empty($payment_details) && $data->payment_type == 'khalti'){
                $args = http_build_query(array(
                    'token' => "'".trim($request->token)."'",
                    'amount'  => $request->amount,
                ));
                
                $url = "https://khalti.com/api/v2/payment/verify/";
                
                # Make the call using API.
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $args);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                
                $headers = ['Authorization: Key '.$khalti_secret->value];
                curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
                
                // Response
                $response = curl_exec($ch);
                $status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                
                // Close the handle
                curl_close($ch);
                
                // Process the response
                if ($status_code == 200) {
                    $data->payment_status = 'paid';
                } else{
                    $data->payment_status = json_encode([
                        'arugements_to_khalti' => $args,
                        'response_from_khalti' => $response,
                        'token_trimmed' => trim($request->token),
                        'token_untrimmed' => $request->token,
                        'amount' => $request->amount,
                    ]);
                    // $data->payment_status = 'unpaid';
                }
            }
            elseif($data->payment_type == 'esewa'){
                $data->payment_status = 'paid';
            }
            // $data->payment_status = 'paid';
            if($data->save()){
                return response()->json([
                    'success' => true,
                    'message' => 'Your payment is Successful,Thank you for your payment.',
                    'order_code' => $order_code,
                    'payment_type' => $order->payment_type
                ]);
            }else{
                return response()->json([
                    'success' => false,
                    'message' => "We couldn't process your payment, payment failed!!",
                    'payment_type' => $order->payment_type
                ]);
            }
        }else{
            return response()->json([
                'success' => false,
                'message' => "We couldn't process your payment, payment failed!!",
                'payment_type' => $order->payment_type
            ]);
        }
    }
    public function cancel(Request $request){
        $order_code = $request->code;
        $order = Order::where('code',$order_code)->count();
        if($order > 0){
            $data = Order::where('code',$order_code)->first();

            foreach ($data->orderDetails as $key => $orderDetail) {
                $orderDetail->delivery_status = $request->status;
                $orderDetail->save();
            }
            // try{

            // }catch(\Exception $e){

            // }
            if($data->save()){
                return response()->json([
                    'success' => true,
                    'message' => 'Order cancelled successfully',
                    'order_code' => (string) $order_code
                ]);
            }else{
                return response()->json([
                    'success' => false,
                    'message' => 'Order not saved',
                    'order_code' => ''
                ]);
            }
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Order not found',
                'order_code' => ''
            ]);
        }
    }
}

