<a href="" class="nav-box-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    {{-- <i class="fa fa-shopping-cart text-dark"></i> --}}
    <img data-toggle="tooltip" data-placement="top" title="Cart" src="{{asset('frontend/assets/images/logo/cart.svg')}}" alt="cart-logo" class="img-fluid img_sag">
    {{-- <span class="nav-box-text d-none d-xl-inline-block">{{__('Cart')}}</span> --}}
    @if(Session::has('cart'))
        <span class="nav-box-number sub_block">{{ count(Session::get('cart'))}}</span>
    @else
        <span class="nav-box-number sub_block">0</span>
    @endif
</a>
<ul class="dropdown-menu dropdown-menu-right px-0">
    <li>
        <div class="dropdown-cart px-0">
            @if(Session::has('cart'))
                @if(count($cart = Session::get('cart')) > 0)
                    <div class="dropdown-cart-items c-scrollbar" id="cart_header_table">
                        <h6 class="text-center font-weight-bold pt-1">Cart Items</h6>
                        <div class="table-responsive">
                            <table class="table mb-0">
                            <tbody>
                                @php
                                    $total = 0;
                                @endphp
                                @foreach($cart as $key => $cartItem)
                                    <tr>
                                    @php
                                    $product = \App\Product::find($cartItem['id']);
                                    $total = $total + $cartItem['price']*$cartItem['quantity'];
                                    @endphp
                                        <td class="img_header_cart">
                                        <div>
                                            <a href="{{ route('product', $product->slug) }}">
                                                @if (file_exists($product->thumbnail_img)) 
                                                    <img src="{{ asset($product->thumbnail_img) }}" data-src="{{ asset($product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                                                @else
                                                    <img src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ __($product->name) }}">
                                                @endif
                                            </a>
                                        </div>
                                        </td>
                                        <td class="cart_header_title"> 
                                        <a href="{{ route('product', $product->slug) }}" class="text-dark">{{ __($product->name) }}</a> <br><br>
                                        <span class="font-weight-bold" style="font-size: smaller">x{{ $cartItem['quantity'] }}</span>
                                        <span class="font-weight-bold" style="font-size: smaller">({{ single_price($cartItem['price']*$cartItem['quantity']) }})</span>
                                        </td>
                                        <td> 
                                        <a href="#" class="header_cart_icon">
                                            <button onclick="removeFromCart({{ $key }})" style="border:none; background-color:transparent">
                                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                                        </button>
                                        </a> 
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                            </table>
                        </div>
                    </div>
                    <hr>
                    <div class="cart_header_price d-flex justify-content-between px-2">
                        <div>
                            <h6>Subtotal</h6>
                        </div>
                        <div>
                            <h6>{{ single_price($total) }}</h6>
                        </div>
                    </div>
                    <div class="top_cartmodal_btn d-flex justify-content-around align-items-center w-100 pt-2">
                        <a href="{{ route('cart') }}" class="btn-custom rounded-0 py-2">
                            <img src="{{asset('frontend/assets/images/logo/cart.svg')}}" class="img-fluid" alt="">&nbsp; View Cart
                        </a>
                        @if (Auth::check())
                        <a href="{{ route('checkout.shipping_info') }}" class="btn-custom rounded-0 py-2"> 
                            <img src="{{asset('frontend/assets/images/logo/cart.svg')}}" class="img-fluid" alt="">&nbsp; Proceed Checkout
                        </a>
                        @endif
                    </div>
                @else
                    <div class="dc-header">
                        <h3 class="heading heading-6 strong-700">{{__('Your Cart is empty')}}</h3>
                    </div>
                @endif
            @else
                <div class="dc-header">
                    <h3 class="heading heading-6 strong-700">{{__('Your Cart is empty')}}</h3>
                </div>
            @endif
        </div>
    </li>
</ul>

