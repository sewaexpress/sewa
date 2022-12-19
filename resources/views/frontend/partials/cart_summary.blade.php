{{-- <div class="col-xl-4 col-md-7 m-auto m-xl-0 "> --}}
    <div class="cart-summary sub_border_shadow mt-4 mt-xl-0  p-xl-4 p-lg-4 p-md-3 p-3 bg-white text-left">
       <div class="cart_user_top">
          <div class="cart_summary d-flex justify-content-between">
             <strong class="cart_text mb-3 d-block font-weight-bold">{{__('Summary')}}</strong>
             <span class="item_block">{{ count(Session::get('cart')) }} {{__('Items')}}</span>
          </div>
          <hr style="margin-top:0px">
       </div>
       {{-- <div class="cart-price d-flex justify-content-between mb-2">
          <h6 class="">
             PRODUCT</h6>
          <span class="cart_text">TOTAL</span>
       </div> --}}
       @if (\App\Addon::where('unique_identifier', 'club_point')->first() != null && \App\Addon::where('unique_identifier', 'club_point')->first()->activated)
            @php
                $total_point = 0;
            @endphp
            @foreach (Session::get('cart') as $key => $cartItem)
                @php
                    $product_count = \App\Product::where('id',$cartItem['id'])->count();
                    if($product_count > 0){
                        $product = \App\Product::find($cartItem['id']);
                        $total_point += $product->earn_point*$cartItem['quantity'];                        
                    }
                @endphp
                {{-- @php
                    $product = \App\Product::find($cartItem['id']);
                    $total_point += $product->earn_point*$cartItem['quantity'];
                @endphp --}}
            @endforeach
            <div class="club-point mb-3 bg-soft-base-1 border-light-base-1 border">
                {{ __("Total Club point") }}:
                <span class="strong-700 float-right">{{ $total_point }}</span>
            </div>
        @endif
        <table class="table-cart table-cart-review">
            <thead>
                <tr>
                    <th class="product-name">{{__('Product')}}</th>
                    <th class="product-total text-right">{{__('Total')}}</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $subtotal = 0;
                    $tax = 0;
                    $shipping = 0;
                    if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'flat_rate') {
                        $shipping = \App\BusinessSetting::where('type', 'flat_rate_shipping_cost')->first()->value;
                    }
                    $admin_products = array();
                    $seller_products = array();
                @endphp
                {{-- @if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'flat_rate')
                    <span class="first-shipping flat_rate hidden">{{\App\BusinessSetting::where('type', 'flat_rate_shipping_cost')->first()->value}}</span>
                @elseif(\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'product_wise_shipping')
                    <span class="first-shipping product_wise_shipping hidden">{{\App\BusinessSetting::where('type', 'flat_rate_shipping_cost')->first()->value}}</span>
                @endif --}}
                
                @foreach (Session::get('cart') as $key => $cartItem)
                    @php
                        $product_count = \App\Product::where('id',$cartItem['id'])->count();
                    @endphp
                    @if ($product_count > 0)
                    @php
                        $product = \App\Product::find($cartItem['id']);
                        if($product->added_by == 'admin'){
                            array_push($admin_products, $cartItem['id']);
                        }
                        else{
                            $product_ids = array();
                            if(array_key_exists($product->user_id, $seller_products)){
                                $product_ids = $seller_products[$product->user_id];
                            }
                            array_push($product_ids, $cartItem['id']);
                            $seller_products[$product->user_id] = $product_ids;
                        }
                        $subtotal += $cartItem['price']*$cartItem['quantity'];
                        $tax += $cartItem['tax']*$cartItem['quantity'];
                        if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'product_wise_shipping') {
                            $shipping += $cartItem['shipping'];
                        }
                        $product_name_with_choice = $product->name;
                        if ($cartItem['variant'] != null) {
                            $product_name_with_choice = $product->name.' - '.$cartItem['variant'];
                        }
                    @endphp
                    <tr class="cart_item">
                        <td class="product-name">
                            {{ $product_name_with_choice }}
                            <strong class="product-quantity">× {{ $cartItem['quantity'] }}</strong>
                        </td>
                        <td class="product-total text-right">
                            <span class="pl-4">{{ single_price($cartItem['price']*$cartItem['quantity']) }}</span>
                        </td>
                    </tr>
                    @endif
                @endforeach

                @php
                    if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'seller_wise_shipping') {
                        if(!empty($admin_products)){
                            $shipping = \App\BusinessSetting::where('type', 'shipping_cost_admin')->first()->value;
                        }
                        if(!empty($seller_products)){
                            foreach ($seller_products as $key => $seller_product) {
                                $shipping += \App\Shop::where('user_id', $key)->first()->shipping_cost;
                            }
                        }
                    }
                @endphp
            </tbody>
        </table>

        <table class="table-cart table-cart-review">

            <tfoot>
                <tr class="cart-subtotal">
                    <th>{{__('Subtotal')}}</th>
                    <td class="text-right">
                        <span class="strong-600 sub-total-span">{{ single_price($subtotal) }}</span>
                        <span class="hidden sub-total">{{ ($subtotal) }}</span>
                    </td>
                </tr>

                <tr class="cart-shipping">
                    <th>{{__('Tax')}}</th>
                    <td class="text-right">
                        <span class="text-italic tax-total-span">{{ single_price($tax) }}</span>
                        <span class="hidden tax-total">{{ ($tax) }}</span>
                    </td>
                </tr>
                <span class="hidden shipping-before-location">{{$shipping}}</span>
                {{-- {{Session::forget('selectedLocation')}} --}}
                @if (Session::has('selectedLocation') && !empty(Session::get('selectedLocation')))
                    @php
                    $locationSelected = Session::get('selectedLocation');
                        $location = \App\Location::where('id',$locationSelected)->count();
                        // echo $default_location;
                        $delivery_charge = 0;
                        if($location > 0){
                            $location = \App\Location::where('id',$locationSelected)->first();
                            $delivery_charge = $location->delivery_charge;
                        }
                        $shipping += $delivery_charge;
                        // dd($default_location);
                    @endphp
                    
                @else
                    @php
                    $delivery_charge = 0;
                    if(isset($default_location) && !empty($default_location)){
                        $location = \App\Location::where('id',$default_location->delivery_location)->count();
                        // echo $default_location;
                        $delivery_charge = 0;
                        if($location > 0){
                            $location = \App\Location::where('id',$default_location->delivery_location)->first();
                            $delivery_charge = $location->delivery_charge;
                        }
                        $shipping += $delivery_charge;
                        // dd($default_location);

                    }
                    @endphp
                    
                @endif
                {{-- @foreach (Auth::user()->addresses as $key => $address)
                    @if ($address->set_default)
                    @endif
                @endforeach --}}
                {{-- <tr class="cart-shipping">
                    <th>{{__('Delivery Charge')}}</th>
                    <td class="text-right">
                        <span class="text-italic delivery-charge-span">Rs {{ $delivery_charge }}</span>
                    </td>
                </tr> --}}

                <tr class="cart-shipping">
                    <th>{{__('Total Shipping')}}</th>
                    <td class="text-right">
                        <span class="text-italic shipping-total-span">
                            @if($shipping > 0)
                                {{ single_price($shipping) }}
                            @else
                                Free
                            @endif
                            
                        </span>
                    </td>
                </tr>

                @if (Session::has('coupon_discount'))
                    <tr class="cart-shipping">
                        <th>{{__('Coupon Discount')}}</th>
                        <td class="text-right">
                            <span class="text-italic">{{ single_price(Session::get('coupon_discount')) }}</span>
                        </td>
                    </tr>
                @endif

                @php
                    $total = $subtotal+$tax+$shipping;
                    if(Session::has('coupon_discount')){
                        $total -= Session::get('coupon_discount');
                    }
                @endphp

                <tr class="cart-total">
                    <th><span class="strong-600">{{__('Total')}}</span></th>
                    <td class="text-right">
                        <strong><span class="grand-total-span">{{ single_price($total) }}</span></strong>
                    </td>
                </tr>
            </tfoot>
        </table>

        @if (Auth::check() && \App\BusinessSetting::where('type', 'coupon_system')->first()->value == 1)
            @if (Session::has('coupon_discount'))
                <div class="mt-3">
                    <form class="form-inline" action="{{ route('checkout.remove_coupon_code') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group flex-grow-1">
                            <div class="form-control bg-gray w-100">{{ \App\Coupon::find(Session::get('coupon_id'))->code }}</div>
                        </div>
                        <button type="submit" class="btn btn-base-1">{{__('Change Coupon')}}</button>
                    </form>
                </div>
            @else
                <div class="mt-3">
                    <form class="form-inline" action="{{ route('checkout.apply_coupon_code') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group flex-grow-1">
                            <input type="text" class="form-control w-100" name="code" placeholder="{{__('Have coupon code? Enter here')}}" required>
                        </div>
                        <button type="submit" class="btn btn-base-1">{{__('Apply')}}</button>
                    </form>
                </div>
            @endif
        @endif

       {{-- @php
       $subtotal = 0;
       $tax = 0;
       $shipping = 0;
       if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'flat_rate') {
           $shipping = \App\BusinessSetting::where('type', 'flat_rate_shipping_cost')->first()->value;
       }
       $admin_products = array();
       $seller_products = array();
      @endphp
      @foreach (Session::get('cart') as $key => $cartItem)
         @php
            $product = \App\Product::find($cartItem['id']);
            if($product->added_by == 'admin'){
                  array_push($admin_products, $cartItem['id']);
            }
            else{
                  $product_ids = array();
                  if(array_key_exists($product->user_id, $seller_products)){
                     $product_ids = $seller_products[$product->user_id];
                  }
                  array_push($product_ids, $cartItem['id']);
                  $seller_products[$product->user_id] = $product_ids;
            }
            $subtotal += $cartItem['price']*$cartItem['quantity'];
            $tax += $cartItem['tax']*$cartItem['quantity'];
            if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'product_wise_shipping') {
                  $shipping += $cartItem['shipping'];
            }
            $product_name_with_choice = $product->name;
            if ($cartItem['variant'] != null) {
                  $product_name_with_choice = $product->name.' - '.$cartItem['variant'];
            }
         @endphp
         <div class="cart-price d-flex justify-content-between mb-2">
            <h6 class=""> {{ $product_name_with_choice }}<span>× {{ $cartItem['quantity'] }}</span> </h6>
            <span class="cart_text">{{ single_price($cartItem['price']*$cartItem['quantity']) }}</span>
         </div>
         @php
         if (\App\BusinessSetting::where('type', 'shipping_type')->first()->value == 'seller_wise_shipping') {
            if(!empty($admin_products)){
                  $shipping = \App\BusinessSetting::where('type', 'shipping_cost_admin')->first()->value;
            }
            if(!empty($seller_products)){
                  foreach ($seller_products as $key => $seller_product) {
                     $shipping += \App\Shop::where('user_id', $key)->first()->shipping_cost;
                  }
            }
         }
      @endphp
         <div class="cart-price d-flex justify-content-between mb-2">
            <h6 class="">
               SUBTOTAL </h6>
            <span class="cart_text">{{ single_price($subtotal) }}</span>
         </div>
         <div class="cart-price d-flex justify-content-between mb-2">
            <h6 class="">
               TAX </h6>
            <span class="cart_text">{{ single_price($tax) }}</span>
         </div>
         <div class="cart-price d-flex justify-content-between mb-2">
            <h6 class="">
               TOTAL SHIPPING </h6>
            <span class="cart_text">{{ single_price($shipping) }}</span>
         </div>
         @if (Session::has('coupon_discount'))
         <div class="cart-price d-flex justify-content-between mb-2">
         <h6 class="">
            COUPON DISCOUNT </h6>
         <span class="cart_text">{{ single_price(Session::get('coupon_discount')) }}</span>
         </div>
         @endif
         <hr>
         <div class="cart-price d-flex justify-content-between ">
         @php
         $total = $subtotal+$tax+$shipping;
         if(Session::has('coupon_discount')){
               $total -= Session::get('coupon_discount');
         }
            @endphp
            <h6 class="">TOTAL</h6>
            <span class="cart_text">{{ single_price($total) }}</span>
         </div>
         @endforeach
         @if (Auth::check() && \App\BusinessSetting::where('type', 'coupon_system')->first()->value == 1)
         @if (Session::has('coupon_discount'))
         <div class="cart-price border-0 mt-3">
            <form class="form-inline border-0" action="{{ route('checkout.remove_coupon_code') }}" method="POST" enctype="multipart/form-data">
               @csrf
               <input type="hidden">
               <div class="form-group flex-grow-1">
                  {{ \App\Coupon::find(Session::get('coupon_id'))->code }}
               </div>
               <button type="submit" class="btn btn-base-1" style="background-color: var(--theme_color)">Change Coupon</button>
               </form>
               @else
               <form class="form-inline border-0" action="{{ route('checkout.apply_coupon_code') }}" method="POST" enctype="multipart/form-data">
                  @csrf
                  <div class="form-group flex-grow-1">
                     <input type="text" class="form-control w-100 rounded-0" name="code" placeholder="{{__('Have coupon code? Enter here')}}" required>
               </div>
               <button type="submit" class="btn btn-base-1" style="background-color: var(--theme_color)">Apply</button>
            </form>
         </div>
         @endif
         @endif --}}
   </div>
 {{-- </div> --}}