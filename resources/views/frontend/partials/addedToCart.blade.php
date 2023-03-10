
<div class="modal-body p-4 added-to-cart">
    <div class="text-center text-success">
        <i class="fa fa-check"></i>
        <h3>{{__('Item added to your cart!')}}</h3>
    </div>
    <div class="product-box">
        <div class="block">
            <div class="block-image">
                @if (file_exists($product->featured_img)) 
                   <img class="lazyload" src="{{ asset($product->featured_img) }}" data-src="{{ asset($product->featured_img) }}" alt="{{ __($product->name) }}">
                @else
                   <img class="lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ __($product->name) }}">
                @endif
                {{-- <img src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset(json_decode($product->featured_img)) }}" class="lazyload" alt="Product Image"> --}}
            </div>
            <div class="block-body">
                <h6 class="strong-600">
                    {{ __($product->name) }}
                </h6>
                <div class="row align-items-center no-gutters mt-2 mb-2">
                    <div class="col-sm-2">
                        <div>{{__('Price')}}:</div>
                    </div>
                    <div class="col-sm-10">
                        <div class="heading-6 text-danger">
                            <strong>
                                {{ single_price(($data['price']+$data['tax'])*$data['quantity']) }}
                            </strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center">
        <button class="btn-custom" data-dismiss="modal">{{__('Back to shopping')}}</button>
        <a href="{{ route('cart') }}" class="btn-custom" >{{__('Proceed to Checkout')}}</a>
    </div>
</div>
