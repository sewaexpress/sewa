@extends('frontend.layouts.app')

@section('content')
    @php
        $status = !empty($order->orderDetails->first())?$order->orderDetails->first()->delivery_status:0;
    @endphp
    <div id="page-content">
           <!--======================================================= ORDER TOP LIST START ==-->

    <section id="order_list_top">
    <div class="container">
       <div class="row delivery_row_block">

          <div class="offset-md-1 offset-0 col-md-2 col-4  text-center ">
             <div class="img_order_list ">
                <div class="img_block_icon">
                   <img src="{{asset('frontend/assets/images/logo/cart.svg')}}" class="img-fluid" alt="">
                </div>
                <div class="content_img ">
                   <h6 class=""> 1.My Cart</h6>
                </div>
             </div>
          </div>
          <div class="col-md-2 col-4  text-center">
             <div class="img_order_list">
                <div class="img_block_icon">
                   <img src="{{asset('frontend/assets/images/map.svg')}}" class="img-fluid" alt="">
                </div>
                <div class="content_img">
                   <h6 class=""> 2.Shipping Info</h6>
                </div>
             </div>
          </div>
          <div class="col-md-2 col-4  text-center">
             <div class="img_order_list">
                <div class="img_block_icon">
                   <img src="{{asset('frontend/assets/images/delivery_new.svg')}}" class="img-fluid" alt="">
                </div>
                <div class="content_img">
                   <h6 class=""> 3 Delivery Info</h6>
                </div>
             </div>
          </div>
          <div class="col-md-2 col-4  text-center">
             <div class="img_order_list">
                <div class="img_block_icon">
                   <img src="{{asset('frontend/assets/images/payment.svg')}}" class="img-fluid" alt="">
                </div>
                <div class="content_img">
                   <h6 class=""> 4. Payment</h6>
                </div>
             </div>
          </div>
          <div class="col-md-2 col-4  text-center  mr-xl-5 mr-0 pr-xl-5 pr-0">
             <div class="img_order_list">
                <div class="img_block_icon">
                   <img src="{{asset('frontend/assets/images/confirmation.svg')}}" class="img-fluid" alt="">
                </div>
                <div class="content_img">
                   <h6 class="active-item"> 5.Confirmation</h6>
                </div>
             </div>
          </div>
       </div>
    </div>
    </section>
 <!--======================================================= ORDER TOP LIST END ======-->
        <section id="cart_user" class="py-4">
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 mx-auto">          
                        <div class="card">
                            <div class="card-body">
                                <div class="checkout-man box_shado text-center padding">
                                    <div class="round-checkout px-5">
                                       <div class="round-block-checkout">
                                          <span><i class="fa fa-check text-white" aria-hidden="true"></i></span>
                                       </div>
                                       <h4 class="font-weight-bold text-dark mt-3">Congratulation! Your order has been processed</h4>
                                       <h6 class="font-weight-bold mb-4"> 
                                        {{__('Order Code:')}} {{ $order->code }}
                                          </h6>
                                          <p class="text-muted text-italic mb-4"> <small>
                                            {{ __('A copy or your order summary has been sent to') }} {{ json_decode($order->shipping_address)->email }}
                                              </small> </p>
                                    </div>
                                 </div>
                                {{-- <div class="text-center py-4 border-bottom mb-4">
                                    <i class="la la-check-circle la-3x text-success mb-3"></i>
                                    <h1 class="h3 mb-3">{{__('Thank You for Your Order!')}}</h1>
                                    <h2 class="h5 strong-700">{{__('Order Code:')}} {{ $order->code }}</h2>
                                    <p class="text-muted text-italic">{{ __('A copy or your order summary has been sent to') }} {{ json_decode($order->shipping_address)->email }}</p>
                                </div> --}}
                                <div class="mb-4">
                                    <h5 class="strong-600 mb-3 border-bottom pb-2">{{__('Order Summary')}}</h5>
                                    <div class="row">
                                        <div class="col-md-6 col-12">
                                            <table class="details-table table table-responsive">
                                                <tr>
                                                    <td class="w-50 strong-600">{{__('Order Code')}}:</td>
                                                    <td>{{ $order->code }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50 strong-600">{{__('Name')}}:</td>
                                                    <td>{{ json_decode($order->shipping_address)->name }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50 strong-600">{{__('Email')}}:</td>
                                                    <td>{{ json_decode($order->shipping_address)->email }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50 strong-600">{{__('Shipping address')}}:</td>
                                                    <td>{{ json_decode($order->shipping_address)->address }}, {{ json_decode($order->shipping_address)->city }}, {{ json_decode($order->shipping_address)->country }}</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <table class="details-table table table-responsive">
                                                <tr>
                                                    <td class="w-50 strong-600">{{__('Order date')}}:</td>
                                                    <td>{{ date('d-m-Y H:m A', $order->date) }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50 strong-600">{{__('Order status')}}:</td>
                                                    <td>{{ ucfirst(str_replace('_', ' ', $status)) }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50 strong-600">{{__('Total order amount')}}:</td>
                                                    <td>{{ single_price($order->orderDetails->sum('price') + $order->orderDetails->sum('tax')) }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50 strong-600">{{__('Shipping')}}:</td>
                                                    <td>{{__('Flat shipping rate')}}</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50 strong-600">{{__('Payment method')}}:</td>
                                                    <td>{{ ucfirst(str_replace('_', ' ', $order->payment_type)) }}</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <h5 class="strong-600 mb-3 border-bottom pb-2">{{__('Order Details')}}</h5>
                                    <div>
                                        <table class="table details-table table-responsive">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th width="30%">{{__('Product')}}</th>
                                                    <th>{{__('Variation')}}</th>
                                                    <th>{{__('Quantity')}}</th>
                                                    <th>{{__('Delivery Type')}}</th>
                                                    <th class="text-right">{{__('Price')}}</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($order->orderDetails as $key => $orderDetail)
                                                    <tr>
                                                        <td>{{ $key+1 }}</td>
                                                        <td>
                                                            @if ($orderDetail->product != null)
                                                                <a href="{{ route('product', $orderDetail->product->slug) }}" target="_blank">
                                                                    {{ $orderDetail->product->name }}
                                                                </a>
                                                            @else
                                                                <strong>{{ __('Product Unavailable') }}</strong>
                                                            @endif
                                                        </td>
                                                        <td>
                                                            {{ $orderDetail->variation }}
                                                        </td>
                                                        <td>
                                                            {{ $orderDetail->quantity }}
                                                        </td>
                                                        <td>
                                                            @if ($orderDetail->shipping_type != null && $orderDetail->shipping_type == 'home_delivery')
                                                                {{ __('Home Delivery') }}
                                                            @elseif ($orderDetail->shipping_type == 'pickup_point')
                                                                @if ($orderDetail->pickup_point != null)
                                                                    {{ $orderDetail->pickup_point->name }} ({{ __('Pickip Point') }})
                                                                @endif
                                                            @endif
                                                        </td>
                                                        <td class="text-right">{{ single_price($orderDetail->price) }}</td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-5 col-md-6 ml-auto">
                                            <table class="table table-responsive details-table">
                                                <tbody>
                                                    <tr>
                                                        <th>{{__('Subtotal')}}</th>
                                                        <td class="text-right">
                                                            <span class="strong-600">{{ single_price($order->orderDetails->sum('price')) }}</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>{{__('Tax')}}</th>
                                                        <td class="text-right">
                                                            <span class="text-italic">{{ single_price($order->orderDetails->sum('tax')) }}</span>
                                                        </td>
                                                    </tr>
                                                    {{-- <tr>
                                                        <th>{{__('Delivery Charge')}}</th>
                                                        <td class="text-right">
                                                            <span class="text-italic">
                                                                {{ single_price($order->location_charge) }}
                                                            </span>
                                                        </td>
                                                    </tr> --}}
                                                    <tr>
                                                        <th>{{__('Total Shipping')}}</th>
                                                        <td class="text-right">
                                                            @php
                                                                //shipping charges of either flat or product wise
                                                                $shipping = $order->orderDetails->sum('shipping_cost');
                                                                $shipping += $order->location_charge;
                                                            @endphp
                                                            <span class="text-italic">{{ single_price($shipping) }}</span>
                                                        </td>
                                                    </tr>
                                                    @if ($order->coupon_discount > 0)
                                                        <tr>
                                                            <th>{{__('Coupon Discount')}}</th>
                                                            <td class="text-right">
                                                                <span class="text-italic">{{ single_price($order->coupon_discount) }}</span>
                                                            </td>
                                                        </tr>                                                        
                                                    @endif
                                                    @if ($order->reward_amount_discount > 0)
                                                        <tr>
                                                            <th>{{__('Reward Discount')}}</th>
                                                            <td class="text-right">
                                                                <span class="text-italic">{{ single_price($order->reward_amount_discount) }}</span>
                                                            </td>
                                                        </tr>                                                        
                                                    @endif
                                                    <tr>
                                                        <th><span class="strong-600">{{__('Total')}}</span></th>
                                                        <td class="text-right">
                                                            <strong><span>{{ single_price($order->grand_total) }}</span></strong>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
