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
        $order = Order::where('code',$order_code)->count();
        if($order > 0){
            $data = Order::where('code',$order_code)->first();
            $data->payment_details = isset($request->details)?$request->details:null;
            $payment_details = json_decode($request->details,true);
            $khalti_secret=\App\BusinessSetting::where('type','khalti_secret')->first();
            
            if($order->payment_type == 'khalti'){
                $args = http_build_query(array(
                    'token' => $payment_details['token'],
                    'amount'  => $payment_details['amount'],
                ));
                
                $url = "https://khalti.com/api/v2/payment/verify/";
                
                # Make the call using API.
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $args);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                
                $headers = ['Authorization: Key '.$khalti_secret];
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
                    $data->payment_status = 'Unpaid';
                }
                // else {
                //     $response = json_decode($response,true);
                //     if(isset($response['error_key'])){

                //     // There was an error
                //     echo json_encode($response);
                //     }else{

                //     // There was an error
                //     echo json_encode($status_code);
                //     // There was an error
                //     echo json_encode($status_code);
                //     }
                // }
                // dd($ch);
            }
            // $data->payment_status = 'paid';
            if($data->save()){
                return response()->json([
                    'success' => true,
                    'message' => 'Order updated successfully',
                    'order_code' => $order_code
                ]);
            }else{
                return response()->json([
                    'success' => false,
                    'message' => 'Order not found',
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

