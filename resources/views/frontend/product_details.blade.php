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
                <a class="text-dark font-weight-bold"  href="{{ route('products.category',$category->slug) }}">{{$category->name}}</a>
            </li>
            @if ($sub_category!=null)
                <li>
                    <a class="text-dark font-weight-bold" href="{{ route('products.subcategory',$sub_category->slug) }}">{{$sub_category->name}}</a>
                </li>
                @if ($sub_sub!=null)
                    <li>
                        <a class="text-dark font-weight-bold" href="{{ route('products.subsubcategory',$sub_sub->slug) }}">{{$sub_sub->name}}</a>
                    </li>

                @endif
            @endif

            <li>
                <a class="text-dark font-weight-bold" href="{{ route('product',$detailedProduct->slug) }}">{{$detailedProduct->name}}</a>
            </li>
        </ol>


       </div>
    </section>
    <!-- Breadcrumbs Ends -->

    <!-- Product Detail  -->
    <section id="product-detail-wrapper" class="py-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-12 col-12">
                    <div class="product-carousel">
                        @if(is_array(json_decode($detailedProduct->photos)) && count(json_decode($detailedProduct->photos)) > 0)
                        <!-- Swiper and EasyZoom plugins start -->
                        <div class="swiper-container gallery-top">
                            <div class="swiper-wrapper">
                                @foreach (json_decode($detailedProduct->photos) as $key => $photo)

                                <div class="swiper-slide">
                                    @if (!empty($photo))
                                        @if (file_exists($photo))
                                            <img src="{{ asset($photo) }}"
                                            data-zoom="{{ asset($photo) }}" class="img-responsive asdf">
                                        @else
                                            <img src="{{asset('frontend/images/placeholder.jpg')}}"
                                            data-zoom="{{asset('frontend/images/placeholder.jpg')}}" class="img-responsive asdf">
                                        @endif
                                    @else
                                        <img src="{{asset('frontend/images/placeholder.jpg')}}"
                                        data-zoom="{{asset('frontend/images/placeholder.jpg')}}" class="img-responsive asdf">
                                    @endif
                                </div>
                                @endforeach
                            </div>
                            <!-- Add Arrows -->
                            <div class="swiper-button-next swiper-button-white"></div>
                            <div class="swiper-button-prev swiper-button-white"></div>
                        </div>

                        <div class="swiper-container gallery-thumbs">
                            <div class="swiper-wrapper">
                                @foreach (json_decode($detailedProduct->photos) as $key => $photo)
                                    @if (!empty($photo))
                                        @if (file_exists($photo))
                                            <div class="swiper-slide" style="background-image:url('{{ asset($photo) }}')">
                                            </div>
                                        @else
                                        <div class="swiper-slide" style="background-image:url('{{ asset("frontend/images/placeholder.jpg") }}')">
                                        </div>
                                        @endif
                                    
                                    @else
                                    <div class="swiper-slide"
                                    style="background-image:url('{{ asset("frontend/images/placeholder.jpg") }}')">
                                    @endif
                                @endforeach
                            </div>
                        </div>

                        <div class="zoom">
                        </div>
                        <!-- Swiper and EasyZoom plugins end -->
                        @endif
                    </div>
                </div>
                <div class="col-lg-7 col-md-12 col-12 mx-auto">
                    <div class="row">
                        <div class="col-lg-8 col-md-12 col-12">
                            <div class="d-flex justify-content-center product-detail flex-column">
                                <div class="about mb-1">
                                    <div class="d-inline-block flex-column flex-wrap mb-2">
                                        <h3 class="font-weight-bold m-0">{{ __($detailedProduct->name) }}</h3>                               
        
                                    </div>
        
        
                                    <div class="d-flex flex-wrap align-items-center">
                                        <!-- Rating -->
                                        <div class="rating-wrapper mr-3">
                                            <div class="p-ratings">
                                                @php
                                                    $total = 0;
                                                    $rating = 0;
                                                @endphp
                                                <i class="star-rating">
                                                    {{-- @if ($detailedProduct->rating > 0)
                                                        {{ renderStarRating($rating/$total) }}
                                                    @else
                                                        {{ renderStarRating(0) }}
                                                    @endif --}}
                                                    {{ renderStarRating($detailedProduct->rating) }}
                                                </i>
                                                
                                                <span class="rating-count ml-1">
                                                    ({{count($detailedProduct->reviews)}} {{__('reviews')}})
                                                </span>
                                            </div>
                                        </div>
                                        <!-- Rating Ends -->
                                        
                                        {{-- <div class="font-weight-bold d-inline-flex align-items-center">
                                            <ul class="p-0 m-0 d-flex align-items-center">                                        
                                                <li class="mr-2">
                                                    <div class="jssocials-share jssocials-share-email">
                                                        <a class="all-deals effect gray" href="javasctipy:void(0);" onclick="addToWishList({{$detailedProduct->id}})">
                                                            <i class="fa fa-heart icon mr-2"></i>
                                                        </a>
                                                        <a class="all-deals effect gray" onclick="addToCompare({{$detailedProduct->id}})">
                                                            <i class="fa fa-exchange icon mr-2"></i>
                                                        </a>
                                                    </div>
                                                </li>
                                            </ul>
                                            
                                        </div> --}}
                                        {{-- <div class="social-media font-weight-bold d-inline-flex align-items-center">
                                            <!-- <label class="mr-3 mb-0 font-weight-bold">
                                            Share On
                                            </label> -->
                                            <ul class="p-0 m-0 d-flex align-items-center">
                                                
                                                <li class="mr-2">
                                                    <div id="share"></div>
                                                </li>
                                            </ul>
                                            
                                        </div> --}}
                                    </div>
                                </div>
                                <hr>

                                    <div class="row align-items-center">
                                        <div class="sold-by col-auto">
                                            <small class="mr-2">Brand: </small><br>
                                            @if($detailedProduct->brand)
                                            <a href="{{route('products.brand',['brand_slug' => $detailedProduct->brand->slug])}}">{{$detailedProduct->brand->name}}</a>
                                            @endif
                                        </div>
                                    </div>
                                    <hr>
                                {{-- @else
                                    <div class="row align-items-center">
                                        <div class="sold-by col-auto">
                                            <small class="mr-2">Vendor: </small><br>                                    
                                            @if ($detailedProduct->added_by == 'seller' && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                                                <a href="{{ route('shop.visit', $detailedProduct->user->shop->slug) }}">{{ $detailedProduct->user->shop->name }}</a>
                                            @else
                                                {{ __('Inhouse product') }}
                                            @endif
                                        </div>
                                    </div>
                                    <hr>
                                @endif --}}
                                <div class="form-group">
                                    @if(home_price($detailedProduct->id) != home_discounted_price($detailedProduct->id))
                                        <div class="product-price text-dark">
                                            <div class="second-price font-weight-bold">{{ home_discounted_price($detailedProduct->id) }}
                                            </div>
                                            <div class="d-flex">
                                                <div class="first-price mr-2">{{ home_price($detailedProduct->id) }}
                                                </div>
                                                <div class="discount">
                                                    @if (! $detailedProduct->discount == 0)
                                                        <div class="">
                                                            -{{ ($detailedProduct->discount_type == 'amount')?'Rs.':'' }} {{ (intval($detailedProduct->discount,0)) }}{{ !($detailedProduct->discount_type == 'amount')?' %':'' }} off
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                        @else
                                        <div class="product-price text-dark">
                                            <div class="second-price font-weight-bold">{{ home_discounted_price($detailedProduct->id) }}
                                            </div> 
                                        </div>
                                    @endif
                                </div>
        
        
                                <form id="option-choice-form" class="image-size-wrapper">
                                    @csrf
                                    <input type="hidden" name="id" value="{{ $detailedProduct->id }}">
                                    @php
                                    $qty = 0;
                                    if($detailedProduct->variant_product){
                                        foreach ($detailedProduct->stocks as $key => $stock) {
                                            $qty += $stock->qty;
                                        }
                                    }
                                    else{
                                        $qty = $detailedProduct->current_stock ;
                                    }
                                    @endphp
                                    <div class="form-row">
        
                                        @if (count(json_decode($detailedProduct->colors)) > 0)
                                        <div class="form-group col-lg-12 col-md-6 mb-0">
                                            <div class="image-select">
                                                <h5>Color</h5>
                                                <div class="my-color ml-5">
                                                    @foreach (json_decode($detailedProduct->colors) as $key => $color)
                                                    <label class="radio m-0" style="background: {{ $color }};" for="{{ $detailedProduct->id }}-color-{{ $key }}" data-toggle="tooltip">
                                                        <input type="radio" id="{{ $detailedProduct->id }}-color-{{ $key }}" name="color" value="{{ $color }}" @if($key == 0) checked @endif>
                                                        <span style="background:{{$color}}; border:{{$color}}"></span> 
                                                    </label>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                        @endif
        
                                        @if ($detailedProduct->choice_options != null)
                                        {{-- {{dd($detailedProduct->choice_options)}} --}}
                                        @foreach (json_decode($detailedProduct->choice_options) as $key => $choice)
                                        <div class="form-group col-lg-12 col-md-6 mb-0">
                                            <div class="size-wrapper">
                                                <div class="size-select">
                                                    <h5>{{ \App\Attribute::find($choice->attribute_id)->name }}</h5>
                                                    <div class="select-size ml-5">
                                                        {{-- {{dd($choice->values)}} --}}
                                                        @foreach ($choice->values as $key => $value)
                                                        <input type="radio" id="{{ $choice->attribute_id }}-{{ $value }}" name="attribute_id_{{ $choice->attribute_id }}" value="{{ $value }}" @if($key == 0) checked @endif>
                                                            <label for="{{ $choice->attribute_id }}-{{ $value }}" class="size">{{ $value }}</label>
                                                        @endforeach
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        @endforeach
                                        @endif
        
                                        <div class="form-group col-lg-4 col-md-6 mt-3">
                                            <div class="quantity">
                                                <h5>Quantity</h5>
                                                <div class="qty-1">
                                                    <span class="input-group-btn minus">
                                                        <button class="btn btn-number" type="button" data-type="minus" data-field="quantity" style="padding:0px;">
                                                            -
                                                        </button>
                                                    </span>
                                                    <input type="text" name="quantity" class="input-number text-center" placeholder="1" value="1" min="1" max="10">
                                                    <span class="input-group-btn plus" data-type="plus" data-field="quantity">
                                                        <button class="btn btn-number" type="button" data-type="plus" data-field="quantity" style="padding:0px;">
                                                            +
                                                        </button>
                                                    </span>
                                                </div>
                                                <div class="avialable-amount">(<span id="available-quantity">{{ $qty }}</span> {{__('available')}})</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    {{-- <div class="row no-gutters">
                                        <div class="product-description-label font-weight-bold d-flex">
                                            Shipping Cost:
                                            @php   
                                            $shipping_type = \App\BusinessSetting::where('type', 'shipping_type')->first()->value;
                                            if($shipping_type == 'product_wise_shipping'){
                                                $shipping = $detailedProduct->shipping_cost;
                                            }elseif($shipping_type == 'flat_rate'){
                                                $shipping = \App\BusinessSetting::where('type', 'flat_rate_shipping_cost')->first()->value;
                                            }
                                            @endphp
                                            @if ($detailedProduct->shipping_type=='free')
                                               <span class="cost pl-2">Free</span> 
                                            @else
                                                @if ($shipping <= 0)
                                                    <span class="cost pl-2">Free</span> 
                                                @else
                                                    <span class="cost pl-2"> Rs. {{(intval($detailedProduct->shipping_cost,0))}} </span>
                                                @endif
                                            @endif
                                        </div>
                                    </div> --}}
                                    <div class="row no-gutters py-2 d-none align-items-center" id="chosen_price_div">
                                        <div class="col-2 m-auto">
                                            <div class="product-description-label h5 m-0">{{__('Total Price')}}:</div>
                                        </div>
                                        <div class="col-10">
                                            <div class="product-price text-dark" style="background: none;">
                                                <strong id="chosen_price" class="font-weight-bold h5">
                                                    
                                                </strong>
                                            </div>
                                        </div>
        
                                    </div>
        
        
        
                                    <div class="d-table width-100 mt-3">
                                        <div class="d-table-cell">
                                            <!-- Buy Now button -->
                                            @if ($qty > 0)
                                                @if(Auth::check())                                                    
                                                    <button type="button" class="btn-custom ml-2" onclick="buyNow()">
                                                        {{__('Buy Now')}}
                                                    </button>
                                                    <button type="button" class="btn-custom" onclick="addToCart()">
                                                        <span class=" d-md-inline-block"> {{__('Add to cart')}}</span>
                                                    </button>
                                                @else
                                                                                                    
                                                    <button type="button" class="btn-custom ml-2" onclick="showCheckoutModal()">
                                                        {{__('Buy Now')}}
                                                    </button>
                                                    <button type="button" class="btn-custom" onclick="showCheckoutModal()">
                                                        <span class=" d-md-inline-block"> {{__('Add to cart')}}</span>
                                                    </button>
                                                    {{-- <button class="btn btn-styled btn-base-1" onclick="showCheckoutModal()" style="background: var(--theme_color)">{{__('Continue to Shipping')}}</button> --}}
                                                @endif
                                            @else
                                                <button type="button" class="btn btn-effect btn-base-3 btn-icon-left strong-700" disabled>
                                                     {{__('Out of Stock')}}
                                                </button>
                                            @endif
                                        </div>
                                    </div>
        
                                </form>
        
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-12">
                            <div class="seller-info-box mb-4">
                                <div class="sold-by position-relative">
                                    @if ($detailedProduct->added_by == 'seller' && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1 && $detailedProduct->user->seller->verification_status == 1)
                                        <div class="position-absolute medal-badge">
                                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" viewBox="0 0 287.5 442.2">
                                                <polygon style="fill:#F8B517;" points="223.4,442.2 143.8,376.7 64.1,442.2 64.1,215.3 223.4,215.3 "/>
                                                <circle style="fill:#FBD303;" cx="143.8" cy="143.8" r="143.8"/>
                                                <circle style="fill:#F8B517;" cx="143.8" cy="143.8" r="93.6"/>
                                                <polygon style="fill:#FCFCFD;" points="143.8,55.9 163.4,116.6 227.5,116.6 175.6,154.3 195.6,215.3 143.8,177.7 91.9,215.3 111.9,154.3
                                                60,116.6 124.1,116.6 "/>
                                            </svg>
                                        </div>
                                    @endif
                                    
                                    <div class="title font-weight-bold">{{__('Sold By')}}</div>
                                    @if($detailedProduct->added_by == 'seller' && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                                        <a href="{{ route('shop.visit', $detailedProduct->user->shop->slug) }}" class="name d-block font-weight-bold">
                                            {{ $detailedProduct->user->shop->name }}
                                            @if ($detailedProduct->user->seller->verification_status == 1)
                                                <span class="ml-2"><i class="fa fa-check-circle" style="color:green"></i></span>
                                            @else
                                                <span class="ml-2"><i class="fa fa-times-circle" style="color:red"></i></span>
                                            @endif
                                        </a>
                                        {{-- <div class="location">                                    
                                            @if ($detailedProduct->added_by == 'seller' && \App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                                                <a href="{{ route('shop.visit', $detailedProduct->user->shop->slug) }}">{{ $detailedProduct->user->shop->name }}</a>
                                            @else
                                                {{ __('Inhouse product') }}
                                            @endif
                                        </div> --}}
                                    @else
                                        <span class="font-weight-bold">Inhouse product</span>                                
                                    @endif
                                    @php
                                        $total = 0;
                                        $rating = 0;
                                        foreach ($detailedProduct->user->products as $key => $seller_product) {
                                            $total += $seller_product->reviews->count();
                                            $rating += $seller_product->reviews->sum('rating');
                                        }
                                        // echo $rating/$total;
                                    @endphp
        
                                    <div class="rating text-center d-block">
                                        <span class="star-rating star-rating-sm d-block">
                                            @if ($total > 0)
                                                {{ renderStarRating($rating/$total) }}
                                            @else
                                                {{ renderStarRating(0) }}
                                            @endif
                                        </span>
                                        <span class="rating-count d-block ml-0">({{ $total }} {{__('customer reviews')}})</span>
                                    </div>
                                </div>
                                <div class="row no-gutters align-items-center">
                                    @if($detailedProduct->added_by == 'seller')
                                        <div class="col">
                                            <a href="{{ route('shop.visit', $detailedProduct->user->shop->slug) }}" class="d-block store-btn">{{__('Visit Store')}}</a>
                                        </div>
                                        {{-- <div class="col">
                                            <ul class="social-media social-media--style-1-v4 text-center">
                                                <li>
                                                    <a href="{{ $detailedProduct->user->shop->facebook }}" class="facebook" target="_blank" data-toggle="tooltip" data-original-title="Facebook">
                                                        <i class="fa fa-facebook"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="{{ $detailedProduct->user->shop->google }}" class="google" target="_blank" data-toggle="tooltip" data-original-title="Google">
                                                        <i class="fa fa-google"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="{{ $detailedProduct->user->shop->twitter }}" class="twitter" target="_blank" data-toggle="tooltip" data-original-title="Twitter">
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="{{ $detailedProduct->user->shop->youtube }}" class="youtube" target="_blank" data-toggle="tooltip" data-original-title="Youtube">
                                                        <i class="fa fa-youtube"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div> --}}
                                    @endif
                                </div>
                            </div>
                            <div class="seller-info-box mb-4">
                                <div class="sold-by position-relative">                                    
                                    <div class="title font-weight-bold">Services</div>
                                    <span class="font-weight-bold">
                                       {{-- <i class="fa fa-exchange"></i>  --}}
                                       {{($detailedProduct->refundable == 1)?'Refundable':'Non Refundable'}}
                                    </span>
                                    @if (($detailedProduct->made_in_nepal == 1))
                                        <br><span class="font-weight-bold">Made In Nepal</span>
                                    @endif
                                    
                                    @if (($detailedProduct->warranty == 0))
                                        <br><span class="font-weight-bold">No Warranty Available</span>
                                    @else
                                    <br><span class="font-weight-bold">
                                        {{-- <i class="fa fa-undo"></i> --}}
                                        Warranty:{{' '.$detailedProduct->warranty_time}}</span>
                                    @endif
                                    
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
            <div class="col-12 mt-3">
                {{-- justify-content-center --}}
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="first-tab" data-toggle="tab" href="#first"
                        role="tab" aria-controls="first" aria-selected="true"
                        style="color: rgb(72, 77, 103);">Product Details</a>
                        
                        @if($detailedProduct->specs != null)
                        <a class="nav-item nav-link" id="fifth-tab" data-toggle="tab" href="#fifth" role="tab" aria-controls="fourth" aria-selected="false"
                        style="color: rgb(72, 77, 103);">Specification</a>
                        @endif

                        
                        @if($detailedProduct->pdf != null)
                        <a class="nav-item nav-link" id="fourth-tab" data-toggle="tab" href="#fourth" role="tab" aria-controls="fourth" aria-selected="false"
                        style="color: rgb(72, 77, 103);">Downloads</a>
                        @endif

                        @if($detailedProduct->video_link != null)
                        
                        <a class="nav-item nav-link" id="third-tab" data-toggle="tab" href="#third" role="tab" aria-controls="third" aria-selected="false"
                        style="color: rgb(72, 77, 103);">Video</a>

                        @endif

                        <a class="nav-item nav-link" id="second-tab" data-toggle="tab" href="#second" role="tab"
                        aria-controls="second" aria-selected="false"
                        style="color: rgb(72, 77, 103);">Reviews <span>({{count($detailedProduct->reviews)}})</span>
                        </a>
                        
                       
                        
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade p-3 w-75 active show" id="first" role="tabpanel"
                        aria-labelledby="first-tab">{!! $detailedProduct->description !!}
                    </div>
                    
                    <style>
                        #fifth li{
                            list-style: inside;
                        }
                    </style>
                    <div class="tab-pane fade p-3 w-75" id="fifth" role="tabpanel"
                        aria-labelledby="fifth-tab">{!! $detailedProduct->specs !!}
                    </div>
                    
                    <div class="tab-pane fade p-3" id="fourth" role="tabpanel" aria-labelledby="fourth-tab">
                        <div class="py-2 px-4">
                            <div class="row">
                                <div class="col-md-12">
                                    <a class="btn btn-success" href="{{ asset($detailedProduct->pdf) }}"><i class="fa fa-download"></i> {{ __('Download PDF') }}</a>
                                </div>
                            </div>
                            <span class="space-md-md"></span>
                        </div>
                    </div>
                    
                    <div class="tab-pane fade p-3" id="third" role="tabpanel" aria-labelledby="third-tab">
                        <div class="fluid-paragraph py-2">
                            <!-- 16:9 aspect ratio -->
                            {{-- {{dd($detailedProduct)}} --}}
                            <div class="embed-responsive embed-responsive-16by9 mb-5">
                                @php
                                    $url = $detailedProduct->video_link;
                                @endphp
                                    @if(!filter_var($url, FILTER_VALIDATE_URL) === false)
                                        @if ($detailedProduct->video_provider == 'youtube' && $detailedProduct->video_link != null)
                                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/{{ explode('=', $detailedProduct->video_link)[1] }}"></iframe>
                                        @elseif ($detailedProduct->video_provider == 'dailymotion' && $detailedProduct->video_link != null)
                                            <iframe class="embed-responsive-item" src="https://www.dailymotion.com/embed/video/{{ explode('video/', $detailedProduct->video_link)[1] }}"></iframe>
                                        @elseif ($detailedProduct->video_provider == 'vimeo' && $detailedProduct->video_link != null)
                                            <iframe src="https://player.vimeo.com/video/{{ explode('vimeo.com/', $detailedProduct->video_link)[1] }}" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                                        @endif
                                    @endif
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade p-3" id="second" role="tabpanel" aria-labelledby="second-tab">
                        <div class="row align-items-center justify-content-center">
                            @if(Auth::check())
                                        @php
                                            $commentable = false;
                                        @endphp
                                        @foreach ($detailedProduct->orderDetails as $key => $orderDetail)
                                            @if($orderDetail->order != null && $orderDetail->order->user_id == Auth::user()->id && $orderDetail->delivery_status == 'delivered' && \App\Review::where('user_id', Auth::user()->id)->where('product_id', $detailedProduct->id)->first() == null)
                                                @php
                                                    $commentable = true;
                                                @endphp
                                            @endif
                                        @endforeach
                                        @if ($commentable)
                                        <div class="col-lg-4 col-12 mx-auto">
                                            <!-- User Comment -->
                                            <div class="user-comment py-4 px-3">
                                                <div class="title mb-3 text-center">
                                                    <h2 class="font-weight-bold mb-2">Add a comment</h2>
                                                </div>
                                                <div class="col-12">
                                                    <form class="form-default" role="form" action="{{ route('reviews.store') }}" method="POST">
                                                        @csrf
                                                        <input type="hidden" name="product_id" value="{{ $detailedProduct->id }}">
                                                        <div class="row">
                                                            <div class="col-12 my-2">
                                                                <input type="text" class="form-control rounded-0" name="name" value="{{ Auth::user()->name }}" class="form-control" disabled required>
                                                                {{-- <input type="text" class="form-control rounded-0"
                                                                    placeholder="Name"> --}}
                                                            </div>
                                                            <div class="col-12 my-2">
                                                                <input type="text" class="form-control rounded-0" name="email" value="{{ Auth::user()->email }}" class="form-control" required disabled>
                                                                {{-- <input type="email" class="form-control rounded-0"
                                                                    placeholder="Email address"> --}}
                                                            </div>
                                                            <div class="col-12 my-2">
                                                                <div class="col-text-area d-flex justify-content-center">
                                                                    <textarea class="w-100 p-3 rounded-0" rows="4" name="comment" placeholder="{{__('Your review')}}" required></textarea>
                                                                    {{-- <textarea class="w-100 p-3 rounded-0"
                                                                        placeholder="Add Comment"></textarea> --}}
                                                                </div>
                                                            </div>
                                                            <div class="col-12">
                                                                <div class="d-flex justify-content-center mb-4">
                                                                    <div class="c-rating mt-1 mb-1 clearfix d-inline-block">
                                                                        <input type="radio" id="star1" name="rating" value="5" required/>
                                                                        <label class="tf-ion-android-star" for="star1" title="Awesome" aria-hidden="true"></label>
                                                                        <input type="radio" id="star2" name="rating" value="4" required/>
                                                                        <label class="tf-ion-android-star" for="star2" title="Great" aria-hidden="true"></label>
                                                                        <input type="radio" id="star3" name="rating" value="3" required/>
                                                                        <label class="tf-ion-android-star" for="star3" title="Very good" aria-hidden="true"></label>
                                                                        <input type="radio" id="star4" name="rating" value="2" required/>
                                                                        <label class="tf-ion-android-star" for="star4" title="Good" aria-hidden="true"></label>
                                                                        <input type="radio" id="star5" name="rating" value="1" required/>
                                                                        <label class="tf-ion-android-star" for="star5" title="Bad" aria-hidden="true"></label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="button-wrapper mx-auto mb-3">
                                                                <button type="submit" class="btn-custom px-4 color-white">Send</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <!-- User Comment Ends-->
                                        </div>
                                        @endif
                                    @endif

                                    
                                    <!-- people Comments -->
                            @if(count($detailedProduct->reviews) > 0)
                            
                            <div class="col-xl-8 col-lg-8 col-12 mb-4">
                                <div class="d-flex people-comment">
                                    <ul class="comment-wrapper">
                                        @foreach ($detailedProduct->reviews as $key => $review)
                                        <li class="d-flex mb-2 p-4">
                                            <div class="image mr-3">
                                                <a href="#">
                                                    @php
                                                        $user_img=\App\User::where('id',$review->user_id)->first();
                                                    @endphp
                                                    @if (empty($user_img->avatar_original))
                                                        <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                                    @else
                                                        @if (file_exists(asset($user_img->avatar_original)))
                                                            <img class="img-responsive user-photo" src="{{asset($user_img->avatar_original)}}">
                                                        @else
                                                        <img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">

                                                        @endif
                                                    @endif
                                                    
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h5>{{$user_img->name}}</h5>
                                                <div class="comment-date mb-2">
                                                    <p class="m-0 text-uppercase"> {{ date('D, d M Y', strtotime($review->created_at)) }} </p>
                                                </div>
                                                <div class="col">
                                                    <div class="rating text-right clearfix d-block">
                                                        <span class="star-rating star-rating-sm float-right">
                                                            @for ($i=0; $i < $review->rating; $i++)
                                                                <i class="fa fa-star active"></i>
                                                            @endfor
                                                            @for ($i=0; $i < 5-$review->rating; $i++)
                                                                <i class="fa fa-star"></i>
                                                            @endfor
                                                        </span>
                                                    </div>
                                                </div>
                                                <p>{{ $review->comment }}</p>
                                                <!-- Comment Reply -->
                                                {{-- <ul>
                                                    <li>
                                                        <div class="comment-reply">
                                                            <div class="d-flex">
                                                                <div class="image mr-3">
                                                                    <a href="#">
                                                                        <img class="img-responsive user-photo"
                                                                            src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
                                                                    </a>
                                                                </div>
                                                                <div class="media-body">
                                                                    <h5>Azar Hank</h5>
                                                                    <div class="comment-date mb-2">
                                                                        <p class="m-0 text-uppercase"> 12 March,
                                                                            2021 AT 10:50 </p>
                                                                    </div>
                                                                    <p>Lorem ipsum, dolor sit amet consectetur
                                                                        adipisicing elit. Sed consequuntur
                                                                        repudiandae, ducimus error animi neque
                                                                        recusandae optio tempora non sequi
                                                                        cupiditate ipsum perspiciatis
                                                                        porro maxime praesentium doloribus amet
                                                                        delectus velit.</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <!-- Comment Reply Ends -->
                                                <div class="button">
                                                    <a href="#"> Reply</a>
                                                </div> --}}
                                            </div>
                                        </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                            @endif
                            <!-- people Comments Ends -->

                            @if(count($detailedProduct->reviews) <= 0)
                                <div class="text-center">
                                    {{ __('There have been no reviews for this product yet.') }}
                                </div>
                            @endif

                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        {{-- </div> --}}
    </section>

    <section class="gry-bg">
        <div class="container">
            <div class="row">
                <div class="col-xl-9">
                    <div class="my-4 bg-white p-3">
                        <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                            @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == "Nepali")
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
                                            @foreach (filter_products(\App\Product::where('subcategory_id', $detailedProduct->subcategory_id)->where('id', '!=', $detailedProduct->id))->get() as $key => $related_product)
                                                <div class="grid-item mx-1">
                                                    <div class="product-grid-item">
                
                                                        <div class="product-grid-image">
                                                            <a href="{{ route('product', $related_product->slug) }}">
                                                                @php
                                                                    $filepath = $related_product->featured_img;
                                                                @endphp
                                                                @if(isset($filepath))
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
                                                                    @if($qty > 0)
                                                                        <h6 class="m-0 gray text-left cus-price">{{ home_discounted_base_price($related_product->id) }}&nbsp;</h6>
                                                                        <div class="d-flex justify-content-between w-100 align-items-center">
                                                                            @if(home_base_price($related_product->id) != home_discounted_base_price($related_product->id))
                                                                                <span class="ml-0">{{ home_base_price($related_product->id) }}</span>&nbsp;&nbsp;
                                                                            @endif
                                                                            @if (! $related_product->discount == 0)
                                                                                <div>
                                                                                    {{ ($related_product->discount_type == 'amount')?'  Rs.':'' }} -{{ intval(($related_product->discount)) }}{{ !($related_product->discount_type == 'amount')?' %':'' }}
                                                
                                                                                </div>
                                                                            @endif
                                                                            
                                                                        </div>
                                                                    @endif
                                                                        
                                                                        <div class="d-flex w-100 mt-2">
                                                                            @if($qty <= 0)
                                                                                <div class="stock mr-1">
                                                                                    Out of Stock
                                                                                </div>
                                                                            @endif
                                                                        
                                                                        </div>
                                                                </div>
                                                                @if($qty > 0)
                                                                    <div class="d-flex justify-content-between">
                                                                        {{-- @if (! $related_product->discount == 0)
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
                            {{__('Top Selling Products From This Seller')}}
                        </div>

                        <div class="box-content">
                            @foreach (filter_products(\App\Product::where('user_id', $detailedProduct->user_id)->orderBy('num_of_sale', 'desc'))->limit(5)->get() as $key => $top_product)
                            <div class="mb-3 product-box-3">
                                <div class="clearfix">
                                    <div class="product-image float-left">
                                        <a href="{{ route('product', $top_product->slug) }}">
                                           @if(is_array(json_decode($top_product->photos)) && count(json_decode($top_product->photos)) > 0)
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
                                            <!-- @if(home_base_price($top_product->id) != home_discounted_base_price($top_product->id))
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
                    <h5 class="modal-title strong-600 heading-5">{{__('Any query about this product')}}</h5>
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
                        <button type="button" class="btn btn-link" data-dismiss="modal">{{__('Cancel')}}</button>
                        <button type="submit" class="btn btn-base-1 btn-styled">{{__('Send')}}</button>
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
                    <h6 class="modal-title" id="exampleModalLabel">{{__('Login')}}</h6>
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
                                                <input type="email" name="email" class="form-control" placeholder="{{__('Email')}}">
                                                <span class="input-group-addon">
                                                    <i class="text-md ion-person"></i>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="input-group input-group--style-1">
                                                <input type="password" name="password" class="form-control" placeholder="{{__('Password')}}">
                                                <span class="input-group-addon">
                                                    <i class="text-md ion-locked"></i>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="row align-items-center">
                                            <div class="col-md-6">
                                                <a href="#" class="link link-xs link--style-3">{{__('Forgot password?')}}</a>
                                            </div>
                                            <div class="col-md-6 text-right">
                                                <button type="submit" class="btn btn-styled btn-base-1 px-4">{{__('Sign in')}}</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body px-4">
                                    @if(\App\BusinessSetting::where('type', 'google_login')->first()->value == 1)
                                        <a href="{{url('auth/google/redirect')}}" class="btn btn-styled btn-block btn-google btn-icon--2 btn-icon-left px-4 my-4">
                                            <i class="icon fa fa-google"></i> {{__('Login with Google')}}
                                        </a>
                                    @endif
                                    @if (\App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1)
                                        <a href="{{url('auth/facebook/redirect')}}" class="btn btn-styled btn-block btn-facebook btn-icon--2 btn-icon-left px-4 my-4">
                                            <i class="icon fa fa-facebook"></i> {{__('Login with Facebook')}}
                                        </a>
                                    @endif
                                    @if (\App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                    <a href="{{ route('social.login', ['provider' => 'twitter']) }}" class="btn btn-styled btn-block btn-twitter btn-icon--2 btn-icon-left px-4 my-4">
                                        <i class="icon fa fa-twitter"></i> {{__('Login with Twitter')}}
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
                $('#login_modal').modal('show');
            @endif
        }


    </script>

    
@endsection
