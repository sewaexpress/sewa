@extends('frontend.layouts.app')
@section('content')
  <!-- Cart -->
  <section id="order_status" class="py-3">
    <div class="container">
       <div class="row py-xl-5 py-md-3 py-0">
          <div class="col-xl-3 col-lg-4 col-12 mb-xl-0 mb-lg-0 mb-3">
             <div class="dashboard-list py-lg-5 px-lg-3">
              @include('frontend.inc.customer_side_nav')
             </div>
          </div>
          @if(isset($order))
          <div class="col-xl-9 col-lg-8 col-md-12 col-12 ">
             <div class="dashboard-content d-flex align-items-center">
                <div class="shopping-cart-table">
                   <div class="table-responsive-xl">
                       @if(!($order->isEmpty()))
                      <table class="table">
                         <thead>
                            <tr>
                               <th class="th_size">Order Id</th>
                               <th class="th_size">Date</th>
                               <th class="th_size">Image</th>
                               <th class="th_size">Product Name</th>
                               <th class="th_size">Quantity</th>
                               <th class="th_size">Total</th>
                               <th class="remove_block_last">Status</th>
                               <th class="th_size"></th>

                            </tr>
                         </thead>
                         <!-- /thead -->
                          @foreach ($order as $orders)
                                @php
                                    $order_detail = \App\OrderDetail::where('order_id', $orders->id)->get();
                                    foreach ($order_detail as $key => $oid) {
                                        $order_id = $oid->order_id;
                                    }
                                    $order_details = \App\OrderDetail::where('id', $order_id)->get();
                                @endphp
                         <tbody>
                          @include('frontend.inc.orderStatus')
                         </tbody>
                         @endforeach
                         <!-- /tbody -->
                      </table>
                      @else
                      <h6>No Orders Yet</h6>
                      @endif
                   </div>
                </div>
             </div>
          </div>
          @else
          <p>No Orders Yet</p>
          @endif
       </div>
    </div>

 </section>
 <!-- Cart Ends -->
@endsection