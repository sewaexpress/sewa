@extends('frontend.layouts.app')

{{-- @section('meta_title')
{{ $detailedProduct->meta_title }}
@endsection --}}

@section('meta_title'){{ $detailedProduct->name }}@endsection

@section('meta_description'){{ $detailedProduct->meta_description }}@stop

@section('meta_keywords'){{ $detailedProduct->tags }}@stop

@section('meta')
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="{{ $detailedProduct->meta_title }}">
    <meta itemprop="description" content="{{ $detailedProduct->meta_description }}">
    <meta itemprop="image" content="{{ asset($detailedProduct->meta_img) }}">

    <!-- Twitter Card data -->
    <meta name="twitter:card" content="product">
    <meta name="twitter:site" content="@publisher_handle">
    <meta name="twitter:title" content="{{ $detailedProduct->meta_title }}">
    <meta name="twitter:description" content="{{ $detailedProduct->meta_description }}">
    <meta name="twitter:creator" content="@author_handle">
    <meta name="twitter:image" content="{{ asset($detailedProduct->meta_img) }}">
    <meta name="twitter:data1" content="{{ single_price($detailedProduct->unit_price) }}">
    <meta name="twitter:label1" content="Price">

    <!-- Open Graph data -->
    <meta property="og:title" content="{{ $detailedProduct->meta_title }}" />
    <meta property="og:type" content="product" />
    <meta property="og:url" content="{{ route('product', $detailedProduct->slug) }}" />
    <meta property="og:image" content="{{ asset($detailedProduct->meta_img) }}" />
    <meta property="og:description" content="{{ $detailedProduct->meta_description }}" />
    <meta property="og:site_name" content="{{ env('APP_NAME') }}" />
    <meta property="og:price:amount" content="{{ single_price($detailedProduct->unit_price) }}" />
@endsection

@section('content')
<style>
    /* .fa-star.active{

    } */
    /* Swiper Slider */
.zoom {
    width: 100%;
    height: 400px;
    left: 100%;
    top: 0;
    position: absolute;
    opacity: 1;
    pointer-events: all;
}

.drift-zoom-pane {
    pointer-events: unset !important;
}

.drift-zoom-pane.drift-open {
    z-index: 2;
}

.img-responsive {
    max-width: 100;
    height: auto;
}

.swiper-container {
    width: 100%;
    height: 300px;
    margin-left: auto;
    margin-right: auto;
}

.swiper-slide {
    background-size: cover;
    background-position: center;
}

.gallery-top {
    height: 80%;
    width: 100%;
}

.gallery-thumbs {
    height: 20%;
    box-sizing: border-box;
    padding: 10px 0;
}

.gallery-thumbs .swiper-slide {
    width: 25%;
    height: 100%;
    opacity: 0.4;
}

.gallery-thumbs .swiper-slide-thumb-active {
    opacity: 1;
}
tr {
    border: 1px solid #dee2e6;
}
td {
    border: 1px solid #dee2e6;
    padding: 5px;
}

</style>
    <!-- Breadcrumbs -->
    <section id="breadcrumb-wrapper" class="position-relative bg-light">
        {{-- <div class="image">
            <img src="{{asset('frontend/assets/images/banner/1.jpg')}}" alt="breadcrumb-image" class="img-fluid">
        </div> --}}
    
       <div class="container">
        <ol class="breadcrumb mt-3 py-3">
            <li>
                <a class="text-dark font-weight-bold" href="{{ route('home') }}">Home</a>
            </li>
            @php
                $category=\App\Models\Category::where('id',$detailedProduct->category_id)->first();
                $sub_category=\App\Models\SubCategory::where('id',$detailedProduct->subcategory_id)->first();
                $sub_sub=\App\Models\SubSubCategory::where('id',$detailedProduct->subsubcategory_id)->first();

            @endphp
            <li>
                <a class="text-dark font-weight-bold"  href="{{ route('products.category', $category->slug) }}">{{ $category->name }}</a>
            </li>
            @if ($sub_category != null)
                <li>
                    <a class="text-dark font-weight-bold" href="{{ route('products.subcategory', $sub_category->slug) }}">{{ $sub_category->name }}</a>
                </li>
                @if ($sub_sub != null)
                    <li>
                        <a class="text-dark font-weight-bold" href="{{ route('products.subsubcategory', $sub_sub->slug) }}">{{ $sub_sub->name }}</a>
                    </li>

                @endif
            @endif

            <li>
                <a class="text-dark font-weight-bold" href="{{ route('product', $detailedProduct->slug) }}">{{ $detailedProduct->name }}</a>
            </li>
        </ol>


       </div>
    </section>
    <!-- Breadcrumbs Ends -->
    <!-- Product Detail  -->

    <section class="gry-bg">
        <div class="container">
            <div class="row">
                <div class="col-xl-9">
                    <div class="my-4 bg-white p-3">
                        <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                            @if (\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == 'Nepali')
                            <h2 class="position-relative mb-0">सम्बन्धित उत्पादनहरु</h2>
                            
                            @else
                            <h2 class="position-relative mb-0">Related Products</h2>
                            
                            @endif
                                
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-lists mt-4">
                                    <div class="right-side-wrapper">
                                        <div class="grid-container2 best_selling">
                                            @foreach (filter_products(\App\Product::where('subcategory_id', $detailedProduct->subcategory_id)->where('id', '!=', $detailedProduct->id))->limit(5)->get() as $key => $related_product)
                                                <div class="grid-item mx-1">
                                                    <div class="product-grid-item">
                
                                                        <div class="product-grid-image">
                                                            <a href="{{ route('product', $related_product->slug) }}">
                                                                @php
                                                                    $filepath = $related_product->featured_img;
                                                                @endphp
                                                                @if (isset($filepath))
                                                                    @if (file_exists(public_path($filepath)))
                                                                        <img src="{{ asset($related_product->featured_img) }}" alt="{{ $related_product->name }}" data-src="{{ asset($related_product->featured_img) }}" class="img-fluid pic-1">
                                                                    @else
                                                                        <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $related_product->name }}" data-src="{{ asset('uploads/No_Image.jpg') }}" class="img-fluid pic-1">
                                                                    @endif
                                                                @else
                                                                    <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $related_product->name }}" data-src="{{ asset('uploads/No_Image.jpg') }}" class="img-fluid pic-1">
                                                                @endif
                                                            </a>
                                                        </div>
                                                        <div class="category-title mt-2">
                                                            <h6 class="title">
                                                                <a href="{{ route('product', $related_product->slug) }}" class="">{{ __($related_product->name) }}</a>
                                                            </h6>
                                                            <div class="category">
                                                            <a class="m-0">{{ $related_product->category->name }}</a>
                                                            </div>
                                                        </div>
                                                        <div class="price-cart text-center py-2">
                                                            <div class="price d-flex flex-column align-items-center w-100">
                                                                <div class="prices align-items-center d-flex justify-content-between w-100">
                                                                <div>
                                                        
                                                                    @php
                                                                        $qty = 0;
                                                                        if($related_product->variant_product){
                                                                            foreach ($related_product->stocks as $key => $stock) {
                                                                                $qty += $stock->qty;
                                                                            }
                                                                        }
                                                                        else{
                                                                            $qty = $related_product->current_stock ;
                                                                        }
                                                                    @endphp
                                                                    @if ($qty > 0)
                                                                        <h6 class="m-0 gray text-left cus-price">{{ home_discounted_base_price($related_product->id) }}&nbsp;</h6>
                                                                        <div class="d-flex justify-content-between w-100 align-items-center">
                                                                            @if (home_base_price($related_product->id) != home_discounted_base_price($related_product->id))
                                                                                <span class="ml-0">{{ home_base_price($related_product->id) }}</span>&nbsp;&nbsp;
                                                                            @endif
                                                                            @if (!$related_product->discount == 0)
                                                                                <div>
                                                                                    {{ $related_product->discount_type == 'amount' ? '  Rs.' : '' }} -{{ intval($related_product->discount) }}{{ !($related_product->discount_type == 'amount') ? ' %' : '' }}
                                                
                                                                                </div>
                                                                            @endif
                                                                            
                                                                        </div>
                                                                    @endif
                                                                        
                                                                        <div class="d-flex w-100 mt-2">
                                                                            @if ($qty <= 0)
                                                                                <div class="stock mr-1">
                                                                                    Out of Stock
                                                                                </div>
                                                                            @endif
                                                                        
                                                                        </div>
                                                                </div>
                                                                @if ($qty > 0)
                                                                    <div class="d-flex justify-content-between">
                                                                        {{-- @if (!$related_product->discount == 0)
                                                                            <div class="product-discount-label">
                                                                                {{ ($related_product->discount_type == 'amount')?'Rs.':'' }} {{ $related_product->discount }}{{ !($related_product->discount_type == 'amount')?' %':'' }}
                                                                            </div>
                                                                        @endif --}}
                                                                        {{-- <a class="all-deals ico effect" onclick="showAddToCartModal({{ $related_product->id }})" data-toggle="tooltip" data-placement="right"
                                                                            title="Add to Cart"><i class="fa fa-shopping-cart icon"></i> </a> --}}
                            
                                                                    </div>
                                                                @endif
                                                                </div>
                                                            </div>
                                                        </div>
                                                        {{-- <div class="cart-compare">
                                                            <a class="all-deals effect gray" href="javasctipy:void(0);" onclick="addToWishList({{$related_product->id}})"
                                                                ><i class="fa fa-heart icon mr-2"></i>Wishlist
                                                            </a>
                                                            <a class="all-deals effect gray" onclick="addToCompare({{$related_product->id}})">
                                                            <i class="fa fa-exchange icon mr-2"></i>Compare
                                                            </a>
                                                        </div> --}}
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3  d-xl-block">
                    <div class="seller-top-products-box bg-white sidebar-box my-4">
                        <div class="box-title">
                            {{ __('Top Selling Products From This Seller') }}
                        </div>

                        <div class="box-content">
                            @foreach (filter_products(\App\Product::where('user_id', $detailedProduct->user_id)->orderBy('num_of_sale', 'desc'))->limit(5)->get() as $key => $top_product)
                            <div class="mb-3 product-box-3">
                                <div class="clearfix">
                                    <div class="product-image float-left">
                                        <a href="{{ route('product', $top_product->slug) }}">
                                           @if (is_array(json_decode($top_product->photos)) && count(json_decode($top_product->photos)) > 0)
                                                @if (file_exists(json_decode($top_product->photos)[0]))
                                                    <img class="img-fit lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset(json_decode($top_product->photos)[0]) }}" alt="{{ __($top_product->name) }}">
                                                @else
                                                    <img class="img-fit lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ __($top_product->name) }}">
                                                @endif

                                            @else
                                                <img class="img-fit lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ __($top_product->name) }}">

                                            @endif
                                        </a>
                                    </div>
                                    <div class="product-details float-left">
                                        <h4 class="title text-truncate" style="width:100%">
                                            <a href="{{ route('product', $top_product->slug) }}" class="d-block">{{ $top_product->name }}</a>
                                        </h4>
                                        
                                        <div class="star-rating star-rating-sm mt-1">
                                            {{ renderStarRating($top_product->rating) }}
                                        </div>
                                        <div class="price-box">
                                            <!-- @if (home_base_price($top_product->id) != home_discounted_base_price($top_product->id))
                                                <del class="old-product-price strong-400">{{ home_base_price($top_product->id) }}</del>
                                            @endif -->
                                            <span class="product-price strong-600">{{ home_discounted_base_price($top_product->id) }}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            
            </div>
        </div>
    </section>
    <!-- Product Detail Ends -->
    <div class="modal fade" id="chat_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-zoom product-modal" id="modal-size" role="document">
            <div class="modal-content position-relative">
                <div class="modal-header">
                    <h5 class="modal-title strong-600 heading-5">{{ __('Any query about this product') }}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form class="" action="{{ route('conversations.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="product_id" value="{{ $detailedProduct->id }}">
                    <div class="modal-body gry-bg px-3 pt-3">
                        <div class="form-group">
                            <input type="text" class="form-control mb-3" name="title" value="{{ $detailedProduct->name }}" placeholder="Product Name" required>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="8" name="message" required placeholder="Your Question">{{ route('product', $detailedProduct->slug) }}</textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-link" data-dismiss="modal">{{ __('Cancel') }}</button>
                        <button type="submit" class="btn btn-base-1 btn-styled">{{ __('Send') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-zoom" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">{{ __('Login') }}</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <div class="card">
                                <div class="card-body px-4">
                                    <form class="form-default" role="form" action="{{ route('cart.login.submit') }}" method="POST">
                                        @csrf
                                        <div class="form-group">
                                            <div class="input-group input-group--style-1">
                                                <input type="email" name="email" class="form-control" placeholder="{{ __('Email') }}">
                                                <span class="input-group-addon">
                                                    <i class="text-md ion-person"></i>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="input-group input-group--style-1">
                                                <input type="password" name="password" class="form-control" placeholder="{{ __('Password') }}">
                                                <span class="input-group-addon">
                                                    <i class="text-md ion-locked"></i>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="row align-items-center">
                                            <div class="col-md-6">
                                                <a href="#" class="link link-xs link--style-3">{{ __('Forgot password?') }}</a>
                                            </div>
                                            <div class="col-md-6 text-right">
                                                <button type="submit" class="btn btn-styled btn-base-1 px-4">{{ __('Sign in') }}</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body px-4">
                                    @if (\App\BusinessSetting::where('type', 'google_login')->first()->value == 1)
                                        <a href="{{ url('auth/google/redirect') }}" class="btn btn-styled btn-block btn-google btn-icon--2 btn-icon-left px-4 my-4">
                                            <i class="icon fa fa-google"></i> {{ __('Login with Google') }}
                                        </a>
                                    @endif
                                    @if (\App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1)
                                        <a href="{{ url('auth/facebook/redirect') }}" class="btn btn-styled btn-block btn-facebook btn-icon--2 btn-icon-left px-4 my-4">
                                            <i class="icon fa fa-facebook"></i> {{ __('Login with Facebook') }}
                                        </a>
                                    @endif
                                    @if (\App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                    <a href="{{ route('social.login', ['provider' => 'twitter']) }}" class="btn btn-styled btn-block btn-twitter btn-icon--2 btn-icon-left px-4 my-4">
                                        <i class="icon fa fa-twitter"></i> {{ __('Login with Twitter') }}
                                    </a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script type="text/javascript">
    $(document).ready(function(){
    $('#district').on('change', function() {
        $('#location').prop('disabled', false);
        var district_id = $(this).val();
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        var ajaxurl = '/location/getLocation';
        $.ajax({
            type: 'POST',
            url: ajaxurl,
            data: {
                "district_id": district_id,
            },
            dataType: 'json',
            beforeSend: function() {},
            success: function(data) {

                if (data != 'false') {
                    optionLoop = '<option disabled selected>Select Location</option>';
                    options = data;
                    options.forEach(function(index) {
                        optionLoop +=
                            '<option data-charge="'+index.delivery_charge+'" value="'+index.id+'">'+index.name+'</option>';
                    });
                } else {
                    optionLoop = '<option disabled>No Locations</option>';
                }
                $(".address-location").html(optionLoop);
                $('#charge').text('Rs. 0');

            },
            error: function(data) {
                showFrontendAlert('error',data.responseText);
            }
        });
    });
    $('#location').on('change', function() {
        var charge = $(this).find(':selected').data('charge');
        $('#charge').text('Rs. '+charge);
    });
});
        $(document).ready(function() {
    		$('#share').jsSocials({
    			showLabel: false,
                showCount: false,
                shares: ["email", "twitter", "facebook", "linkedin", "pinterest", "stumbleupon", "whatsapp"]
    		});
            getVariantPrice();
    	});
        
        function showCheckoutModal() {
            $('#GuestCheckout').modal();
        }

        function CopyToClipboard(containerid) {
            if (document.selection) {
                var range = document.body.createTextRange();
                range.moveToElementText(document.getElementById(containerid));
                range.select().createTextRange();
                document.execCommand("Copy");

            } else if (window.getSelection) {
                var range = document.createRange();
                document.getElementById(containerid).style.display = "block";
                range.selectNode(document.getElementById(containerid));
                window.getSelection().addRange(range);
                document.execCommand("Copy");
                document.getElementById(containerid).style.display = "none";

            }
            showFrontendAlert('success', 'Copied');
        }

        function show_chat_modal(){
            @if (Auth::check())
                $('#chat_modal').modal('show');
            @else
                $('#login_modal').modal('show'); @endif
            }


        </script>

        
@endsection
