<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\CustomerResource;
use App\Http\Resources\SupportTicketCollection;
use App\Models\Customer;
use App\Models\OrderDetail;
use App\Product;
use App\Models\Review;
use App\Models\Ticket;
use App\RefundRequest;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CustomerController extends Controller
{
    public function show($id)
    {
        return new CustomerResource(Customer::find($id));
    }
    public function supportTicket()
    {
        $tickets = Ticket::where('user_id', Auth::user()->id)->orderBy('created_at', 'desc')->get();
        return new SupportTicketCollection($tickets);
        // return response()->json([
        //     'success' => true,
        //     'message' => 'Ticket List',
        //     'data' => new SupportTicketCollection($tickets)
        // ]);
    }
    public function sendSupportTicket(Request $request)
    {
        //dd();
        $ticket = new Ticket();
        $ticket->code = max(100000, (Ticket::latest()->first() != null ? Ticket::latest()->first()->code + 1 : 0)).date('s');
        $ticket->user_id = Auth::user()->id;
        $ticket->subject = $request->subject;
        $ticket->details = $request->details;

        $files = array();

        if($request->hasFile('attachments')){
            foreach ($request->attachments as $key => $attachment) {
                $item['name'] = $attachment->getClientOriginalName();
                $item['path'] = $attachment->store('uploads/support_tickets/');
                array_push($files, $item);
            }
            $ticket->files = json_encode($files);
        }

        if($ticket->save()){
            return response()->json([
                'success' => true,
                'message' => 'Ticket has been sent successfully',
            ]);
        }
        else{
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ]);
        }
    }
    public function request_store(Request $request, $id){
        $order_detail = OrderDetail::where('id', $id)->first();
        $refund = new RefundRequest();
        $refund->user_id = Auth::user()->id;
        $refund->order_id = $order_detail->order_id;
        $refund->order_detail_id = $order_detail->id;
        $refund->seller_id = $order_detail->seller_id;
        $refund->seller_approval = 0;
        $refund->reason = $request->reason;
        $refund->admin_approval = 0;
        $refund->admin_seen = 0;
        $refund->refund_amount = $order_detail->price + $order_detail->tax;
        $refund->refund_status = 0;
        if ($refund->save()) {
            return response()->json([
                'success' => true,
                'message' => 'Refund Request has been sent successfully'
            ]);
        }
        else {
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong'
            ]);
        }
    }
    public function rateProduct(Request $request){
        $product = Product::where('id',$request->product_id);   
        if($product->count() > 0){
            $product = $product->first();
            $review = new Review();
            $review->product_id = $request->product_id;
            $review->user_id = Auth::user()->id;
            $review->rating = $request->rating;
            $review->comment = $request->comment;
            $review->viewed = '0';
            if($review->save()){
                if(count(Review::where('product_id', $product->id)->where('status', 1)->get()) > 0){
                    $product->rating = Review::where('product_id', $product->id)->where('status', 1)->sum('rating')/count(Review::where('product_id', $product->id)->where('status', 1)->get());
                }
                else {
                    $product->rating = 0;
                }
                $product->save();
                return response()->json([
                    'success' => true,
                    'message' => 'Review has been submitted successfully',
                ]);
            }
            return response()->json([
                'success' => false,
                'message' => 'Something went wrong',
            ]);
                
        }
        return response()->json([
            'success' => false,
            'message' => 'Product Not Found',
        ]);
    }
}
