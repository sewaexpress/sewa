@extends('frontend.layouts.app')

@section('content')
<section id="order_list_top">
    <div class="container">
       <div class="row delivery_row_block">

          <div class="offset-md-1 offset-0 col-md-2 col-4  text-center ">
             <div class="img_order_list ">
                <div class="img_block_icon">
                   <img src="{{asset('frontend/assets/images/logo/cart.svg')}}" class="img-fluid" alt="">
                </div>
                <div class="content_img ">
                   <h6 class="active-item"> 1.My Cart</h6>
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
                   <h6 class=""> 5.Confirmation</h6>
                </div>
             </div>
          </div>
       </div>
    </div>
</section>

<section id="cart-summary" class="py-5" style="background-color: whitesmoke">
    <div class="container">
        @if(Session::has('cart'))
        <div class="row cols-xs-space cols-sm-space cols-md-space">
            <div class="col-xl-8 col-md-12 bg-white p-3">
                <!-- <form class="form-default bg-white p-4" data-toggle="validator" role="form"> -->
                <div class="form-default bg-white p-4">
                    <div class="">
                        <div class="">
                            <table class="table-cart border-bottom">
                                <thead>
                                    {{-- {{dd('hERE')}} --}}
                                    <tr>
                                        <th class="product-image"></th>
                                        <th class="product-name">{{__('Product')}}</th>
                                        <th class="product-price d-none d-lg-table-cell">{{__('Price')}}</th>
                                        <th class="product-quanity d-none d-md-table-cell">{{__('Quantity')}}</th>
                                        <th class="product-total">{{__('Total')}}</th>
                                        <th class="product-remove"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                    $total = 0;
                                    @endphp
                                    @foreach (Session::get('cart') as $key => $cartItem)
                                        @php
                                            $product = \App\Product::where('id',$cartItem['id'])->count();
                                        @endphp
                                        @if ($product > 0)
                                        @php
                                        $product = \App\Product::find($cartItem['id']);
                                        $total = $total + $cartItem['price']*$cartItem['quantity'];
                                        $product_name_with_choice = isset($product->name)?$product->name:'Empty';
                                        if ($cartItem['variant'] != null) {
                                            $product_name_with_choice = (isset($product->name)?$product->name:'Empty').' - '.$cartItem['variant'];
                                        }
                                        @endphp
                                        <tr class="cart-item">
                                            <td class="product-image">
                                                <a href="{{ route('product', isset($product->slug)?$product->slug:'Empty') }}" class="mr-3">                                                   
                                                    @if(file_exists($product->featured_img))
                                                        <img loading="lazy" src="{{ asset($product->featured_img) }}" class="img-fluid">
                                                    @else
                                                        <img loading="lazy" src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid">
                                                    @endif
                                                </a>
                                            </td>
    
                                            <td class="product-name">
                                                <span class="pr-4 d-block">{{ $product_name_with_choice }}</span>
                                            </td>
    
                                            <td class="product-price d-none d-lg-table-cell">
                                                <span class="pr-3 d-block">{{ single_price($cartItem['price']) }}</span>
                                            </td>
    
                                            <td class="product-quantity d-none d-md-table-cell">
                                                <div class="input-group input-group--style-2 pr-4" style="width: 130px;">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-number" type="button" data-type="minus" data-field="quantity[{{ $key }}]">
                                                            <i class="la la-minus"></i>
                                                        </button>
                                                    </span>
                                                    <input type="text" name="quantity[{{ $key }}]" class="form-control input-number" placeholder="1" value="{{ $cartItem['quantity'] }}" min="1" max="10" onchange="updateQuantity({{ $key }}, this)">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-number" type="button" data-type="plus" data-field="quantity[{{ $key }}]">
                                                            <i class="la la-plus"></i>
                                                        </button>
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="product-total">
                                                <span>{{ single_price($cartItem['price']*$cartItem['quantity']) }}</span>
                                            </td>
                                            <td class="product-remove">
                                                <a href="#" onclick="removeFromCartView(event, {{ $key }})" class="text-right pl-4">
                                                    <i class="la la-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                            
                                        @endif
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
    
                    <div class="row align-items-center pt-4">
                        <div class="col-6">
                            <a href="{{ route('home') }}">
                                <i class="fa fa-reply-all"></i>
                                {{__('Return to shop')}}
                            </a>
                        </div>
                        <div class="col-6 text-right">
                            @if(Auth::check())
                                <a href="{{ route('checkout.shipping_info') }}" class="btn btn-styled btn-base-1">{{__('Continue to Shipping')}}</a>
                            @else
                                <button class="btn btn-styled btn-base-1" onclick="showCheckoutModal()" style="background: var(--theme_color)">{{__('Continue to Shipping')}}</button>
                            @endif
                        </div>
                    </div>
                </div>
                <!-- </form> -->
            </div>
    
            <div class="col-xl-4 col-md-7 m-auto m-xl-0">
                @include('frontend.partials.cart_summary')
            </div>
        </div>
        @else
            <div class="text-center font-weight-bold"> Your cart is empty.</div>
        @endif
    </div>
</section>

    {{-- <section class="py-4 gry-bg" id="cart-summary">
        <div class="container">
            @if (Session::has('cart'))
                <div class="row cols-xs-space cols-sm-space cols-md-space">
                <div class="col-xl-8">
                    <!-- <form class="form-default bg-white p-4" data-toggle="validator" role="form"> -->
                    <div class="form-default bg-white p-4">
                        <div class="">
                            <div class="">
                                <table class="table-cart border-bottom">
                                    <thead>
                                        <tr>
                                            <th class="product-image"></th>
                                            <th class="product-name">{{__('Product')}}</th>
                                            <th class="product-price d-none d-lg-table-cell">{{__('Price')}}</th>
                                            <th class="product-quanity d-none d-md-table-cell">{{__('Quantity')}}</th>
                                            <th class="product-total">{{__('Total')}}</th>
                                            <th class="product-remove"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php
                                        $total = 0;
                                        @endphp
                                        @foreach (Session::get('cart') as $key => $cartItem)
                                            @php
                                            $product = \App\Product::find($cartItem['id']);
                                            $total = $total + $cartItem['price']*$cartItem['quantity'];
                                            $product_name_with_choice = $product->name;
                                            if ($cartItem['variant'] != null) {
                                                $product_name_with_choice = $product->name.' - '.$cartItem['variant'];
                                            }
                                            // if(isset($cartItem['color'])){
                                            //     $product_name_with_choice .= ' - '.\App\Color::where('code', $cartItem['color'])->first()->name;
                                            // }
                                            // foreach (json_decode($product->choice_options) as $choice){
                                            //     $str = $choice->name; // example $str =  choice_0
                                            //     $product_name_with_choice .= ' - '.$cartItem[$str];
                                            // }
                                            @endphp
                                            <tr class="cart-item">
                                                <td class="product-image">
                                                    <a href="#" class="mr-3">
                                                        <img loading="lazy"  src="{{ asset(json_decode($product->photos)[0]) }}">
                                                    </a>
                                                </td>

                                                <td class="product-name">
                                                    <span class="pr-4 d-block">{{ $product_name_with_choice }}</span>
                                                </td>

                                                <td class="product-price d-none d-lg-table-cell">
                                                    <span class="pr-3 d-block">{{ single_price($cartItem['price']) }}</span>
                                                </td>

                                                <td class="product-quantity d-none d-md-table-cell">
                                                    @if ($cartItem['digital'] != 1)
                                                        <div class="input-group input-group--style-2 pr-4" style="width: 130px;">
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-number" type="button" data-type="minus" data-field="quantity[{{ $key }}]">
                                                                    <i class="la la-minus"></i>
                                                                </button>
                                                            </span>
                                                                <input type="text" name="quantity[{{ $key }}]" class="form-control input-number" placeholder="1" value="{{ $cartItem['quantity'] }}" min="1" max="10" onchange="updateQuantity({{ $key }}, this)">
                                                                <span class="input-group-btn">
                                                                <button class="btn btn-number" type="button" data-type="plus" data-field="quantity[{{ $key }}]">
                                                                    <i class="la la-plus"></i>
                                                                </button>
                                                            </span>
                                                        </div>
                                                    @endif
                                                </td>
                                                <td class="product-total">
                                                    <span>{{ single_price(($cartItem['price']+$cartItem['tax'])*$cartItem['quantity']) }}</span>
                                                </td>
                                                <td class="product-remove">
                                                    <a href="#" onclick="removeFromCartView(event, {{ $key }})" class="text-right pl-4">
                                                        <i class="la la-trash"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="row align-items-center pt-4">
                            <div class="col-md-6">
                                <a href="{{ route('home') }}" class="link link--style-3">
                                    <i class="la la-mail-reply"></i>
                                    {{__('Return to shop')}}
                                </a>
                            </div>
                            <div class="col-md-6 text-right">
                                @if (Auth::check())
                                    <a href="{{ route('checkout.shipping_info') }}" class="btn btn-styled btn-base-1">{{__('Continue to Shipping')}}</a>
                                @else
                                    <button class="btn btn-styled btn-base-1" onclick="showCheckoutModal()">{{__('Continue to Shipping')}}</button>
                                @endif
                            </div>
                        </div>
                    </div>
                    <!-- </form> -->
                </div>

                <div class="col-xl-4 ml-lg-auto">
                    @include('frontend.partials.cart_summary')
                </div>
            </div>
            @else
                <div class="dc-header">
                    <h3 class="heading heading-6 strong-700">{{__('Your Cart is empty')}}</h3>
                </div>
            @endif
        </div>
    </section> --}}
    
 <!-- Cart -->
 {{-- <section id="cart-wrapper" class="py-3">
    <div class="container">
       <div class="row py-xl-5 py-md-3 py-0">
          <div class="col-xl-3 col-lg-4 col-12 mb-xl-0 mb-lg-0 mb-3">
             <div class="dashboard-list py-lg-5 px-lg-3">
               @include('frontend.inc.customer_side_nav')
             </div>
          </div>
          <div class="col-xl-9 col-lg-8 col-md-12 col-12">
             <div class="profile-side-detail-edit">
                <div class="dashboard-content d-flex align-items-center h-100">
                   <div class="shopping-cart">
                      <div class="shopping-cart-table">
                         <div class="table-responsive-lg">
                            @if(Session::has('cart'))
                            <table class="table">
                               <thead>
                                  <tr>
                                     <th class="th_size">Image</th>
                                     <th class="th_size">Product Name</th>
                                     <th class="th_size">Quantity</th>
                                     <th class="th_size">Total</th>
                                     <th class="remove_block_last">Remove</th>
                                  </tr>
                               </thead>
                               <!-- /thead -->
                               <tbody>
                                @php
                                $total = 0;
                                @endphp

                                @foreach (Session::get('cart') as $key => $cartItem)
                                    @php
                                    $product = \App\Product::find($cartItem['id']);
                                    $total = $total + $cartItem['price']*$cartItem['quantity'];
                                    $product_name_with_choice = $product->name;
                                    if ($cartItem['variant'] != null) {
                                        $product_name_with_choice = $product->name.' - '.$cartItem['variant'];
                                    }
                                    // if(isset($cartItem['color'])){
                                    //     $product_name_with_choice .= ' - '.\App\Color::where('code', $cartItem['color'])->first()->name;
                                    // }
                                    // foreach (json_decode($product->choice_options) as $choice){
                                    //     $str = $choice->name; // example $str =  choice_0
                                    //     $product_name_with_choice .= ' - '.$cartItem[$str];
                                    // }
                                    @endphp
                                  <tr>
                                     <td class="text-center">
                                        <a class="img_men_cart" href="#">
                                           <img
                                              src="{{ asset(json_decode($product->photos)[0]) }}"
                                              class="img-fluid">
                                        </a>
                                     </td>
                                     <td class="text-center">
                                        {{ $product_name_with_choice }}
                                     </td>
                                     <td class="text-center">
                                        <div class="input_b m-auto">
                                           <b onclick="decreaseValue()" value="Decrease Value" class="minus_b">-</b>
                                           <input type="number" id="numbers" value="0" class="count_b disabled="
                                              name=" qty">
                                           <b class="plus_b " onclick="increaseValue()" value="Increase Value">+</b>
                                        </div>
                                     </td>
                                     <td class="text-center">
                                        <span class="cart-grand-total-price">{{ single_price($cartItem['price']) }}</span>
                                     </td>
                                     <td class="text-center"><a href="#" title="cancel" class="icon"><i
                                              class="fa fa-trash-o"></i></a>
                                     </td>
                                  </tr>
                                @endforeach
                                
                               </tbody>
                               
                               <!-- /tbody -->
                            </table>
                            @else
                                <div class="text-center"> Your cart is empty</div>
                            @endif
                            <div class="d-flex justify-content-around align-items-center w-100 my-3 flex-wrap">
                               <!-- <form class="coupon-field d-flex flex-wrap align-items-center justify-content-center">
                                     <input type="text" placeholder="Apply Coupon Code" class="mr-2">
                                     <button type="button" class="btn-custom mt-xl-0 mt-md-0 mt-2 rounded-0">Apply Coupon</button>
                                     </form> -->
                               <div class="total-amount font-weight-bold mt-xl-0 mt-md-0 mt-2 text-dark">
                                  Total Amount : <span>$2000</span>
                               </div>
                            </div>
                         </div>
                      </div>
                      <div class="row  pl-2 mt-4">
                         <div class="col-xl-4 col-lg-7 col-md-6 col-12 my-3">
                            <div class="cart-summary sub_border_shadow p-xl-4 p-lg-4 p-md-3 p-3 text-left ">
                               <strong class="cart_text mb-3 d-block font-weight-bold">Cart Summary</strong>
                               <div class="cart-price d-flex justify-content-between mb-2">
                                  <h6 class="">Sub Total</h6>
                                  <span class="cart_text">NPR 200</span>
                               </div>
                               <div class="cart-price d-flex justify-content-between mb-2">
                                  <h6 class="">Shipping Cost</h6>
                                  <span class="cart_text">NPR 0</span>
                               </div>
                               <hr>
                               <div class="cart-price d-flex justify-content-between mb-2">
                                  <h6 class="">Grand Total</h6>
                                  <span class="cart_text">NPR 200</span>
                               </div>
                            </div>
                         </div>
                         <div class="col-xl-4 col-lg-4 col-md-6 col-12 my-3">
                            <div class="checkout_btn_cart d-flex align-items-center h-100">
                               <button type="button" class="btn-custom rounded-0">Proceed Checkout</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> --}}
    <!-- Cart Ends -->

    <!-- Modal -->
    <div class="modal fade" id="GuestCheckout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-zoom" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">{{ __('Login') }}</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="p-3">
                        <form class="form-default" role="form" action="{{ route('cart.login.submit') }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <div class="input-group input-group--style-1">
                                    <input type="email" name="email" class="form-control"
                                        placeholder="{{ __('Email') }}">
                                    <span class="input-group-addon">
                                        <i class="text-md la la-user" style="line-height: 0px"></i>
                                    </span>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group input-group--style-1">
                                    <input type="password" name="password" class="form-control"
                                        placeholder="{{ __('Password') }}">
                                    <span class="input-group-addon">
                                        <i class="text-md la la-lock" style="line-height: 0px"></i>
                                    </span>
                                </div>
                            </div>

                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <a href="{{ route('password.request') }}"
                                        class="link link-xs link--style-3">{{ __('Forgot password?') }}</a>
                                </div>
                                <div class="col-md-6 text-right">
                                    <button type="submit"
                                        class="btn btn-styled btn-base-1 px-4">{{ __('Sign in') }}</button>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="text-center pt-3">
                        <p class="text-md">
                            {{ __('Need an account?') }} <a href="{{ route('user.registration') }}"
                                class="strong-600">{{ __('Register Now') }}</a>
                        </p>
                    </div>
                    @if (\App\BusinessSetting::where('type', 'google_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                        <div class="or or--1 my-3 text-center">
                            <span>or</span>
                        </div>
                        <div class="p-3 pb-0">
                            @if (\App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1)
                                <a href="{{url('auth/facebook/redirect')}}"
                                    class="btn btn-styled btn-block btn-facebook btn-icon--2 btn-icon-left px-4 mb-3">
                                    <i class="icon fa fa-facebook"></i> {{ __('Login with Facebook') }}
                                </a>
                            @endif
                            @if (\App\BusinessSetting::where('type', 'google_login')->first()->value == 1)
                                <a href="{{url('auth/google/redirect')}}"
                                    class="btn btn-styled btn-block btn-google btn-icon--2 btn-icon-left px-4 mb-3">
                                    <i class="icon fa fa-google"></i> {{ __('Login with Google') }}
                                </a>
                            @endif
                            @if (\App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                <a href="{{ route('social.login', ['provider' => 'twitter']) }}"
                                    class="btn btn-styled btn-block btn-twitter btn-icon--2 btn-icon-left px-4 mb-3">
                                    <i class="icon fa fa-twitter"></i> {{ __('Login with Twitter') }}
                                </a>
                            @endif
                        </div>
                    @endif
                    {{-- @if (\App\BusinessSetting::where('type', 'guest_checkout_active')->first()->value == 1)
                        <div class="or or--1 mt-0 text-center">
                            <span>or</span>
                        </div>
                        <div class="text-center">
                            <a href="{{ route('checkout.shipping_info') }}"
                                class="btn btn-styled btn-base-1">{{ __('Guest Checkout') }}</a>
                        </div>
                    @endif --}}
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script type="text/javascript">
        function removeFromCartView(e, key) {
            e.preventDefault();
            removeFromCart(key);
        }

        function updateQuantity(key, element) {
            $.post('{{ route('cart.updateQuantity') }}', {
                _token: '{{ csrf_token() }}',
                key: key,
                quantity: element.value
            }, function(data) {
                updateNavCart();
                $('#cart-summary').html(data);
            });
        }

        function showCheckoutModal() {
            $('#GuestCheckout').modal();
        }
    </script>
@endsection
