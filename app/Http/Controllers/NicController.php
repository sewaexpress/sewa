<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Order;
use Session;

class NicController extends Controller
{
    public function nic()
    {
      $order_id = Session::get('order_id');
    
      $ordercode = Order::where('id', $order_id)->first();
      
   
      return view('frontend.payment.nic',compact('ordercode'));
     
      
    }
}
