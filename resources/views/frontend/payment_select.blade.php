@extends('frontend.layouts.app')

@section('content')
<style>
    .image_payment>input
    {
        display: none;
    }
</style>
 {{-- <!--======================================================= ORDER TOP LIST START ==-->
 <section id="order_list_top">
    <div class="container">
        <div class="row delivery_row_block">
           
            <div class="offset-md-1 offset-0 col-md-2 col-4  text-center ">
                <div class="img_order_list ">
                   <div class="img_block_icon">
                    <img src="{{asset('frontend/assets/images/logo/cart.svg" class="img-fluid" alt="">
                   </div>
                   <div class="content_img ">
                    <h6 class=""> 1.My Cart</h6>
                   </div>
                </div>
            </div>
            <div class="col-md-2 col-4  text-center">
                <div class="img_order_list">
                   <div class="img_block_icon">
                    <img src="./frontend/assets/images/map.svg" class="img-fluid" alt="">
                   </div>
                   <div class="content_img">
                    <h6 class=""> 2.Shipping Info</h6>
                   </div>
                </div>
            </div>
            <div class="col-md-2 col-4  text-center">
                <div class="img_order_list">
                   <div class="img_block_icon">
                    <img src="./frontend/assets/images/delivery_new.svg" class="img-fluid" alt="">
                   </div>
                   <div class="content_img">
                    <h6 class="active-item"> 3 Delivery Info</h6>
                   </div>
                </div>
            </div>
            <div class="col-md-2 col-4  text-center">
                <div class="img_order_list">
                   <div class="img_block_icon">
                    <img src="./frontend/assets/images/payment.svg" class="img-fluid" alt="">
                   </div>
                   <div class="content_img">
                    <h6 class=""> 4. Payment</h6>
                   </div>
                </div>
            </div>
            <div class="col-md-2 col-4  text-center  mr-xl-5 mr-0 pr-xl-5 pr-0">
                <div class="img_order_list">
                   <div class="img_block_icon">
                    <img src="./frontend/assets/images/confirmation.svg" class="img-fluid" alt="">
                   </div>
                   <div class="content_img">
                    <h6 class=""> 5.Confirmation</h6>
                   </div>
                </div>
            </div>
        </div>
    </div>
 </section>
 <!--======================================================= ORDER TOP LIST END ======-->
 <!--======================================================= CART START ======-->
 <section id="cart_user" class="py-5">
    <div class="container">
       <div class="row">
        <form action="{{ route('payment.checkout') }}" class="form-default" data-toggle="validator" role="form" method="POST" id="checkout-form">
            @csrf
          <div class="col-xl-8 col-md-12 bg-white p-3">
             <div class="title_delivery mb-2">
                <h6>Select a payment option</h6>
             </div>
             <div class="col-md-12">
                <div class="row">
                    @if(\App\BusinessSetting::where('type', 'cash_payment')->first()->value == 1)
                                                    @php
                                                        $digital = 0;
                                                        foreach(Session::get('cart') as $cartItem){
                                                            if($cartItem['digital'] == 1){
                                                                $digital = 1;
                                                            }
                                                        }
                                                    @endphp
                                                    @if($digital != 1)
                   <div class="col-xl-6 col-md-6 m-auto">
                      <div class="image_payment text-center" data-toggle="tooltip" data-placement="top" title="Cash on Delivery">
                        <input type="radio" id="" name="payment_option" value="cash_on_delivery" checked>
                         <a href="#"> <img class="img_select img-fluid" src="{{ asset('frontend/images/icons/cards/cod.png')}}" 
                            ></a>
                      </div>
                   </div>
                   @endif 
                   @endif
                   <div class="col-xl-6 col-md-6 m-auto">
                      <div class="image_payment text-center" data-toggle="tooltip" data-placement="top" title="E-sewa">
                         <a href="#"> <img class="img_select img-fluid" src="https://img.favpng.com/7/14/6/esewa-fonepay-pvt-ltd-logo-portable-network-graphics-image-brand-png-favpng-aLLyxWtspEZQckmv19jDj2TWC.jpg" 
                            ></a>
                      </div>
                   </div>
                   
                </div>
             </div>
             <div class="col-md-12">
                <div class="button_block d-flex justify-content-between align-items-center">
                   <a href=""> <span><i class="fa fa-reply-all"></i></span> Return to shop</a>
                   <!-- <a href="" class="btn_custom">Continue to Shipping</a> -->
                    <button type="submit" class="btn_custom"> Complet Order</button>
                </div>
             </div>
            </form>
          </div>
       
           @include('frontend.partials.cart_summary')
         
       </div>
    </div>
 </section>
 <!--======================================================= CART END ======--> --}}
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
                        <h6 class="active-item"> 4. Payment</h6>
                       </div>
                    </div>
                </div>
                <div class="col-md-2 col-4  text-center  mr-xl-5 mr-0 pr-xl-5 pr-0">
                    <div class="img_order_list">
                       <div class="img_block_icon">
                        <img src="{{asset('frontend/assets/images/confirmation.svg')}}" class="img-fluid" alt="">
                       </div>
                       <div class="content_img">
                        <h6 class=""> 5.Confirmation</h6>
                       </div>
                    </div>
                </div>
            </div>
        </div>
     </section>
     <!--======================================================= ORDER TOP LIST END ======-->
     <!--======================================================= CART START ======-->
     <section id="cart_user" class="py-5">
        <div class="container">
           <div class="row">
              <div class="col-xl-8 col-md-12 bg-white p-3">
                <form action="{{ route('payment.checkout') }}" class="form-default" data-toggle="validator" role="form" method="POST" id="checkout-form">
                    @csrf
                 <div class="title_delivery mb-2">
                    <h6>Select a payment option</h6>
                 </div>
                 <div class="col-md-12">
                    <div class="row">
                        @if(\App\BusinessSetting::where('type', 'cash_payment')->first()->value == 1)
                            @php
                                $digital = 0;
                                foreach(Session::get('cart') as $cartItem){
                                    if(isset($cartItem['digital']) && $cartItem['digital'] == 1){
                                        $digital = 1;
                                    }
                                }
                            @endphp
                            @if($digital != 1)
                                <div class="col-xl-6 col-md-6 m-auto">
                                    <div class="image_payment text-center" data-toggle="tooltip" data-placement="top" title="Cash on Delivery">
                                        <label id="file-input">
                                        <img class="img_select img-fluid" src="{{ asset('frontend/images/icons/cards/cod.jpg')}}" 
                                            >
                                        <input class="hidden" type="radio" id="file-input" name="payment_option" value="cash_on_delivery">
                                        </label>

                                    </div>
                                </div>
                            @endif
                       @endif
                       <style>
                           /* .visa-master{
                                border: 1px solid #084592;
                           } */
                       </style>
                       <div class="col-xl-6 col-md-6 m-auto">
                           <div class="image_payment text-center" data-toggle="tooltip" data-placement="top" title="Visa / Master Card">
                               <label id="file-input">
                               <img alt="visa-master" class="visa-master img_select img-fluid" src="{{ asset('uploads/visa-master.jpg')}}" >
                               <input class="hidden" type="radio" id="file-input" name="payment_option" value="nic">
                               </label>

                           </div>
                       </div>
                       @php
                           $esewa=json_decode(\App\BusinessSetting::where('type', 'esewa_payment')->first()->value);
                       @endphp
                       @if((\App\BusinessSetting::where('type', 'esewa_payment')->count() > 0) && ($esewa->value == 1))
                            <div class="col-xl-6 col-md-6 m-auto">
                                <label class="payment_option mb-4" data-toggle="tooltip" data-title="esewa">
                                    {{-- <button id="payment-button">Pay with esewa</button> --}}
                                    <input type="radio" id="" name="payment_option" value="esewa">
                                    <span>
                                        <img loading="lazy" src="{{ asset('uploads/esewa.jpg')}}" class="img-fluid">
                                    </span>
                                </label>
                            </div>
                        @endif
                    </div>
                 </div>
                 <div class="col-md-12">
                    <div class="button_block d-flex justify-content-between align-items-center">
                       <a href=""> <span><i class="fa fa-reply-all"></i></span> Return to shop</a>
                       <!-- <a href="" class="btn_custom">Continue to Shipping</a> -->
                     <button type="button" onclick="submitOrder(this)" class="btn_custom"> Complete Order</button>
                    </div>
                 </div>
                </form>
              </div>
              <div class="col-xl-4 col-md-7 m-auto m-xl-0 ">
                @include('frontend.partials.cart_summary')
             </div>
           </div>
        </div>
     </section>
     <!--======================================================= CART END ======-->
</div>
@endsection

@section('script')
    <script type="text/javascript">
        // function use_wallet(){
        //     $('input[name=payment_option]').val('wallet');
        //     $('#checkout-form').submit();
        // }
        function submitOrder(el){
            $(el).prop('disabled', true);
            $('#checkout-form').submit();
        }
    </script>
@endsection
