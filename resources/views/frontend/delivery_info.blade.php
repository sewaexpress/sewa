@extends('frontend.layouts.app')

@section('content')
<div id="page-content">
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
                     <h6 class="active-item"> 3.Delivery Info</h6>
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
   <!--======================================================= CART START ======-->
   <section id="cart_user" class="py-5">
      <div class="container">
         <div class="row">
            <div class="col-xl-8 col-md-12 bg-white p-3">
               <form class="form-default" data-toggle="validator" action="{{ route('checkout.store_delivery_info') }}" role="form" method="POST">
                  @csrf
                  @php
                        $admin_products = array();
                        $seller_products = array();
                        foreach (Session::get('cart') as $key => $cartItem){
                           if(\App\Product::find($cartItem['id'])->added_by == 'admin'){
                              array_push($admin_products, $cartItem['id']);
                           }
                           else{
                              $product_ids = array();
                              if(array_key_exists(\App\Product::find($cartItem['id'])->user_id, $seller_products)){
                                 $product_ids = $seller_products[\App\Product::find($cartItem['id'])->user_id];
                              }
                              array_push($product_ids, $cartItem['id']);
                              $seller_products[\App\Product::find($cartItem['id'])->user_id] = $product_ids;
                           }
                        }
                        @endphp
                  <div class="title_delivery mb-4">
                  <h6>{{ \App\GeneralSetting::first()->site_name }} Products</h6>
               </div>
               @if (!empty($admin_products))
               {{-- <div class="row">
                  <div class="col-md-6">
                     <div class="row">
                        @foreach ($admin_products as $key => $id)
                        <div class="col-md-12">
                           <div class="delivery_info_block d-flex align-items-center mb-4">
                              <div class="delivery_info_img">
                                 <img
                                 src="{{ asset(\App\Product::find($id)->thumbnail_img) }}"
                                    class="img-fluid" loading="lazy" alt="{{ \App\Product::find($id)->name }}">
                              </div>
                              <div class="delivery_info_text ml-3">
                                 <h5>{{ \App\Product::find($id)->name }}</h5>
                              </div>
                           </div>
                        </div>
                        @endforeach
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="row">
                        <div class="col-xl-6 col-md-12">
                           <div class="shipping_radio custom-radio">
                              <input type="radio" class="shipping_radio-input" id="defaultUnchecked"
                              name="shipping_type_admin" value="home_delivery" checked class="d-none" onchange="show_pickup_point(this)" data-target=".pickup_point_id_admin">
                              <label class="shipping_radio-label" for="defaultUnchecked">Home Delivery</label>
                           </div>
                        </div>
                        @if (\App\BusinessSetting::where('type', 'pickup_point')->first()->value == 1)
                        <div class="col-xl-6 col-md-12">
                           <div class="shipping_radio custom-radio">
                              <input type="radio" class="shipping_radio-input" id="defaultUnchecke"
                              name="shipping_type_admin" value="pickup_point" class="d-none" onchange="show_pickup_point(this)" data-target=".pickup_point_id_admin">
                              <label class="shipping_radio-label" for="defaultUnchecke">Local Pickup </label>
                           </div>
                        </div>
                        @endif
                        <div class="col-md-12">
                           <div class="container_block">
                              @if (\App\BusinessSetting::where('type', 'pickup_point')->first()->value == 1)
                              <div class="main_delivery_info pickup_point_id_admin d-none">
                                 <select id="select_box" name="pickup_point_id_admin" data-placeholder="Select a pickup point">
                                    <option>{{__('Select your nearest pickup point')}}</option>
                                    @foreach (\App\PickupPoint::where('pick_up_status',1)->get() as $key => $pick_up_point)
                                    <option value="{{ $pick_up_point->id }}" data-address="{{ $pick_up_point->address }}" data-phone="{{ $pick_up_point->phone }}">
                                       {{ $pick_up_point->name }}
                                    </option>
                                    @endforeach
                                 </select>
                              </div>
                              @endif
                           </div>
                        </div>
                     </div>
                  </div>
               </div> --}}
               <div class="card mb-3">
                  <div class="card-header bg-white py-3">
                      <h5 class="heading-6 mb-0">{{ \App\GeneralSetting::first()->site_name }} Products</h5>
                  </div>
                  <div class="card-body">
                      <div class="row">
                          <div class="col-md-6">
                              <table class="table-cart">
                                  <tbody>
                                      @foreach ($admin_products as $key => $id)
                                      <tr class="cart-item">
                                          <td class="product-image" width="25%">
                                             {{-- @php
                                                 dd(\App\Product::find($id)->feature_img);
                                             @endphp  --}}
                                             @php
                                                $filepath = \App\Product::find($id)->featured_img;
                                             @endphp
                                             @if(isset($filepath))
                                                @if(file_exists($filepath))
                                                   <a href="{{ route('product', \App\Product::find($id)->slug) }}" target="_blank">
                                                      <img loading="lazy" src="{{ asset(\App\Product::find($id)->featured_img) }}" class="img-fluid">
                                                   </a>
                                                @else
                                                   <a href="{{ route('product', \App\Product::find($id)->slug) }}" target="_blank">
                                                      <img loading="lazy" src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid">
                                                   </a>
                                                @endif
                                             @else
                                                <a href="{{ route('product', \App\Product::find($id)->slug) }}" target="_blank">
                                                   <img loading="lazy"  src="{{ asset('frontend/images/placeholder.jpg') }}">
                                                </a>
                                             @endif
                                                  
                                          </td>
                                          <td class="product-name strong-600">
                                              <a href="{{ route('product', \App\Product::find($id)->slug) }}" target="_blank" class="d-block c-base-2">
                                                  {{ \App\Product::find($id)->name }}
                                              </a>
                                          </td>
                                      </tr>
                                      @endforeach
                                  </tbody>
                              </table>
                          </div>
                          <div class="col-md-6">
                              <div class="row">
                                  <div class="col-6">
                                      <label class="d-flex align-items-center p-3 border rounded gry-bg c-pointer">
                                          <input type="radio" name="shipping_type_admin" value="home_delivery" checked class="d-none" onchange="show_pickup_point(this)" data-target=".pickup_point_id_admin">
                                          <span class="radio-box"></span>
                                          <span class="d-block ml-2 strong-600">
                                              {{ __('Home Delivery') }}
                                          </span>
                                      </label>
                                  </div>
                                  @if (\App\BusinessSetting::where('type', 'pickup_point')->first()->value == 1)
                                      <div class="col-6">
                                          <label class="d-flex align-items-center p-3 border rounded gry-bg c-pointer">
                                              <input type="radio" name="shipping_type_admin" value="pickup_point" class="d-none" onchange="show_pickup_point(this)" data-target=".pickup_point_id_admin">
                                              <span class="radio-box"></span>
                                              <span class="d-block ml-2 strong-600">
                                                  {{ __('Local Pickup') }}
                                              </span>
                                          </label>
                                      </div>
                                  @endif
                              </div>

                              @if (\App\BusinessSetting::where('type', 'pickup_point')->first()->value == 1)
                                  <div class="mt-3 pickup_point_id_admin d-none">
                                      <select class="pickup-select form-control-lg w-100" name="pickup_point_id_admin" data-placeholder="Select a pickup point">
                                              <option>{{__('Select your nearest pickup point')}}</option>
                                          @foreach (\App\PickupPoint::where('pick_up_status',1)->get() as $key => $pick_up_point)
                                              <option value="{{ $pick_up_point->id }}" data-address="{{ $pick_up_point->address }}" data-phone="{{ $pick_up_point->phone }}">
                                                  {{ $pick_up_point->name }}
                                              </option>
                                          @endforeach
                                      </select>
                                  </div>
                              @endif

                          </div>
                      </div>
                  </div>
              </div>
               @endif
               
               @if (!empty($seller_products))
               {{-- {{dd($seller_products)}} --}}
               @foreach ($seller_products as $key => $seller_product)
                  <div class="card mb-3">
                        <div class="card-header bg-white py-3">
                           <h5 class="heading-6 mb-0">{{ \App\Shop::where('user_id', $key)->first()->name }} Products</h5>
                        </div>
                        <div class="card-body">
                           <div class="row no-gutters">
                              <div class="col-md-6">
                                    <table class="table-cart">
                                       <tbody>
                                          @foreach ($seller_product as $id)
                                          <tr class="cart-item">
                                                <td class="product-image" width="25%">
                                                   {{-- <a href="{{ route('product', \App\Product::find($id)->slug) }}" target="_blank"> --}}
                                                      
                                                      @php
                                                         $filepath = \App\Product::find($id)->featured_img;
                                                      @endphp
                                                      <a href="{{ route('product', \App\Product::find($id)->slug) }}" target="_blank">
                                                         @if(isset($filepath))
                                                            @if(file_exists($filepath))
                                                               <img loading="lazy" src="{{ asset(\App\Product::find($id)->featured_img) }}" class="img-fluid">
                                                            @else
                                                               <img loading="lazy" src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid">
                                                            @endif
                                                         @else
                                                               <img loading="lazy"  src="{{ asset('frontend/images/placeholder.jpg') }}">
                                                         @endif
                                                      {{-- <img loading="lazy"  src="{{ asset(\App\Product::find($id)->thumbnail_img) }}"> --}}
                                                      </a>
                                                </td>
                                                <td class="product-name strong-600">
                                                   <a href="{{ route('product', \App\Product::find($id)->slug) }}" target="_blank" class="d-block c-base-2">
                                                      {{ \App\Product::find($id)->name }}
                                                   </a>
                                                </td>
                                          </tr>
                                          @endforeach
                                       </tbody>
                                    </table>
                              </div>
                              <div class="col-md-6">
                                    <div class="row">
                                       <div class="col-6">
                                          <label class="d-flex align-items-center p-3 border rounded gry-bg c-pointer">
                                                <input type="radio" name="shipping_type_{{ $key }}" value="home_delivery" checked class="d-none" onchange="show_pickup_point(this)" data-target=".pickup_point_id_{{ $key }}">
                                                <span class="radio-box"></span>
                                                <span class="d-block ml-2 strong-600">
                                                   {{ __('Home Delivery') }}
                                                </span>
                                          </label>
                                       </div>
                                       @if (\App\BusinessSetting::where('type', 'pickup_point')->first()->value == 1)
                                          @if (is_array(json_decode(\App\Shop::where('user_id', $key)->first()->pick_up_point_id)))
                                                <div class="col-6">
                                                   <label class="d-flex align-items-center p-3 border rounded gry-bg c-pointer">
                                                      <input type="radio" name="shipping_type_{{ $key }}" value="pickup_point" class="d-none" onchange="show_pickup_point(this)" data-target=".pickup_point_id_{{ $key }}">
                                                      <span class="radio-box"></span>
                                                      <span class="d-block ml-2 strong-600">
                                                            {{ __('Local Pickup') }}
                                                      </span>
                                                   </label>
                                                </div>
                                          @endif
                                       @endif
                                    </div>

                                    @if (\App\BusinessSetting::where('type', 'pickup_point')->first()->value == 1)
                                       @if (is_array(json_decode(\App\Shop::where('user_id', $key)->first()->pick_up_point_id)))
                                          <div class="mt-3 pickup_point_id_{{ $key }} d-none">
                                                <select class="pickup-select form-control-lg w-100" name="pickup_point_id_{{ $key }}" data-placeholder="Select a pickup point">
                                                   <option>{{__('Select your nearest pickup point')}}</option>
                                                   @foreach (json_decode(\App\Shop::where('user_id', $key)->first()->pick_up_point_id) as $pick_up_point)
                                                      @if (\App\PickupPoint::find($pick_up_point) != null)
                                                            <option value="{{ \App\PickupPoint::find($pick_up_point)->id }}" data-address="{{ \App\PickupPoint::find($pick_up_point)->address }}" data-phone="{{ \App\PickupPoint::find($pick_up_point)->phone }}">
                                                               {{ \App\PickupPoint::find($pick_up_point)->name }}
                                                            </option>
                                                      @endif
                                                   @endforeach
                                                </select>
                                          </div>
                                       @endif
                                    @endif
                              </div>
                           </div>
                        </div>
                  </div>
               @endforeach
               {{-- <div class="title_delivery mb-4">
                  <h6>{{ \App\Shop::where('user_id', $key)->first()->name }}  Products</h6>
               </div>
               <div class="row">
                  <div class="col-md-6">
                     <div class="row">
                        @foreach ($seller_products as $key => $id)
                        @php
                        $product=\App\Product::find($id)->first();
                        // dd($product);
                        @endphp
                        <div class="col-md-12">
                           <div class="delivery_info_block d-flex align-items-center mb-4">
                              <div class="delivery_info_img">
                                 <img
                                 src="{{ asset($product->thumbnail_img) }}"
                                    class="img-fluid" loading="lazy" alt="{{ $product->name }}">
                              </div>
                              <div class="delivery_info_text ml-3">
                                 <h5>{{ $product->name }}</h5>
                              </div>
                           </div>
                        </div>
                        @endforeach
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="row">
                        <div class="col-xl-6 col-md-12">
                           <div class="shipping_radio custom-radio">
                              <input type="radio" class="shipping_radio-input" id="defaultUnchecked"
                              name="shipping_type_admin" value="home_delivery" checked class="d-none" onchange="show_pickup_point(this)" data-target=".pickup_point_id_admin">
                              <label class="shipping_radio-label" for="defaultUnchecked">Home Delivery</label>
                           </div>
                        </div>
                        @if (\App\BusinessSetting::where('type', 'pickup_point')->first()->value == 1)
                        @if (is_array(json_decode(\App\Shop::where('user_id', $key)->first()->pick_up_point_id)))
                        <div class="col-xl-6 col-md-12">
                           <div class="shipping_radio custom-radio">
                              <input type="radio" class="shipping_radio-input" id="defaultUnchecke"
                              name="shipping_type_admin" value="pickup_point" class="d-none" onchange="show_pickup_point(this)" data-target=".pickup_point_id_admin">
                              <label class="shipping_radio-label" for="defaultUnchecke">Local Pickup </label>
                           </div>
                        </div>
                        @endif
                        @endif
                        <div class="col-md-12">
                           <div class="container_block">
                              @if (\App\BusinessSetting::where('type', 'pickup_point')->first()->value == 1)
                              @if (is_array(json_decode(\App\Shop::where('user_id', $key)->first()->pick_up_point_id)))
                              <div class="main_delivery_info pickup_point_id_admin d-none">
                                 <select id="select_box" name="pickup_point_id_admin" data-placeholder="Select a pickup point">
                                    <option>{{__('Select your nearest pickup point')}}</option>
                                    @foreach (json_decode(\App\Shop::where('user_id', $key)->first()->pick_up_point_id) as $pick_up_point)
                                    @if (\App\PickupPoint::find($pick_up_point) != null)
                                    <option value="{{ \App\PickupPoint::find($pick_up_point)->id }}" data-address="{{ \App\PickupPoint::find($pick_up_point)->address }}" data-phone="{{ \App\PickupPoint::find($pick_up_point)->phone }}">
                                       {{ \App\PickupPoint::find($pick_up_point)->name }}
                                    </option>
                                 @endif
                                 @endforeach
                                 </select>
                              </div>
                              @endif
                              @endif
                           </div>
                        </div>
                     </div>
                  </div>
               </div> --}}
               @endif
               <div class="card mb-3">
                  <div class="card-header bg-white py-3">
                     <h5 class="heading-6 mb-0">Note:</h5>
                  </div>
                  <div class="card-body">
                     <div class="row no-gutters">
                        <textarea placeholder="Notes for Delivery" cols="10" rows="5" name="note"  class="form-control"></textarea>
                     </div>
                  </div>
               </div>

               <div class="col-md-12">
                  <div class="button_block d-flex justify-content-between align-items-center">
                     <a href=""> <span><i class="fa fa-reply-all"></i></span> Return to shop</a>
                     <!-- <a href="" class="btn_custom">Continue to Shipping</a> -->
                     <button type="submit" class="btn_custom"> Continue to Payment</button>
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
        function display_option(key){

        }
        function show_pickup_point(el) {
        	var value = $(el).val();
        	var target = $(el).data('target');

            console.log(value);

        	if(value == 'home_delivery'){
                if(!$(target).hasClass('d-none')){
                    $(target).addClass('d-none');
                }
        	}else{
        		$(target).removeClass('d-none');
        	}
        }

    </script>
@endsection
