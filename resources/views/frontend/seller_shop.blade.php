@extends('frontend.layouts.app')

@section('meta_title'){{ $shop->meta_title }}@stop

@section('meta_description'){{ $shop->meta_description }}@stop

@section('meta')
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="{{ $shop->meta_title }}">
    <meta itemprop="description" content="{{ $shop->meta_description }}">
    <meta itemprop="image" content="{{ asset($shop->logo) }}">

    <!-- Twitter Card data -->
    <meta name="twitter:card" content="product">
    <meta name="twitter:site" content="@publisher_handle">
    <meta name="twitter:title" content="{{ $shop->meta_title }}">
    <meta name="twitter:description" content="{{ $shop->meta_description }}">
    <meta name="twitter:creator" content="@author_handle">
    <meta name="twitter:image" content="{{ asset($shop->meta_img) }}">

    <!-- Open Graph data -->
    <meta property="og:title" content="{{ $shop->meta_title }}" />
    <meta property="og:type" content="Shop" />
    <meta property="og:url" content="{{ route('shop.visit', $shop->slug) }}" />
    <meta property="og:image" content="{{ asset($shop->logo) }}" />
    <meta property="og:description" content="{{ $shop->meta_description }}" />
    <meta property="og:site_name" content="{{ $shop->name }}" />
@endsection
<style>
    #productlist:hover {
        padding-top:10px;
        transition: all 0.5s;
        box-shadow: 0 0 4px 0 rgb(1 1 1 / 30%);
    }
    .search_icon_top{
        padding:14px;
    }
    .social-nav a{
        display: flex !important;
        align-items: center;
        justify-content: center;
    }

</style>
@section('content')
    <!-- <section>
        <img loading="lazy"  src="https://via.placeholder.com/2000x300.jpg" alt="" class="img-fluid">
    </section> -->

    @php
        $total = 0;
        $rating = 0;
        foreach ($shop->user->products as $key => $seller_product) {
            $total += $seller_product->reviews->count();
            $rating += $seller_product->reviews->sum('rating');
        }
    @endphp

    <section class="gry-bg py-4 ">
        <div class="container">
            <div class="row ">
                <div class="col-md-6">
                    <div class="d-flex">
                        @if (!empty($shop->logo))
                            @if (file_exists($shop->logo))
                                <img height="70" class="lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="@if ($shop->logo !== null) {{ asset($shop->logo) }} @else {{ asset('frontend/images/placeholder.jpg') }} @endif" alt="{{ $shop->name }}">
                            @else
                                <img height="70" class="lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ $shop->name }}"> 
                            @endif
                        @else
                            <img height="70" class="lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ $shop->name }}">  
                        @endif
                        
                        <div class="pl-4">
                            <h3 class="strong-700 heading-4 mb-0">{{ $shop->name }}
                                @if ($shop->user->seller->verification_status == 1)
                                    <span class="ml-2"><i class="fa fa-check-circle" style="color:green"></i></span>
                                @else
                                    <span class="ml-2"><i class="fa fa-times-circle" style="color:red"></i></span>
                                @endif
                            </h3>
                            <div class="star-rating star-rating-sm mb-1">
                                @if ($total > 0)
                                    {{ renderStarRating($rating/$total) }}
                                @else
                                    {{ renderStarRating(0) }}
                                @endif
                            </div>
                            <div class="location alpha-6">{{ $shop->address }}</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <ul class="text-md-right mt-4 mt-md-0 social-nav model-2 d-flex justify-md-content-end justify-content-center align-items-center h-100">
                        @if ($shop->facebook != null)
                            <li>
                                <a href="{{ $shop->facebook }}" class="facebook social_a" target="_blank" data-toggle="tooltip" data-original-title="Facebook">
                                    <i class="fa fa-facebook"></i>
                                </a>
                            </li>
                        @endif
                        @if ($shop->twitter != null)
                            <li>
                                <a href="{{ $shop->twitter }}" class="twitter social_a" target="_blank" data-toggle="tooltip" data-original-title="Twitter">
                                    <i class="fa fa-twitter"></i>
                                </a>
                            </li>
                        @endif
                        @if ($shop->google != null)
                            <li>
                                <a href="{{ $shop->google }}" class="google-plus social_a" target="_blank" data-toggle="tooltip" data-original-title="Google">
                                    <i class="fa fa-google-plus"></i>
                                </a>
                            </li>
                        @endif
                        @if ($shop->youtube != null)
                            <li>
                                <a href="{{ $shop->youtube }}" class="youtube social_a" target="_blank" data-toggle="tooltip" data-original-title="Youtube">
                                    <i class="fa fa-youtube"></i>
                                </a>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <section class="bg-white">
        <div class="container">
            <div class="row sticky-top mt-4">
                <div class="col">
                    <div class="seller-shop-menu">
                        <ul class="inline-links">
                            <li @if(!isset($type)) class="active" @endif><a href="{{ route('shop.visit', $shop->slug) }}">{{__('Store Home')}}</a></li>
                            <li @if(isset($type) && $type == 'top_selling') class="active" @endif><a href="{{ route('shop.visit.type', ['slug'=>$shop->slug, 'type'=>'top_selling']) }}">{{__('Top Selling')}}</a></li>
                            <li @if(isset($type) && $type == 'all_products') class="active" @endif><a href="{{ route('shop.visit.type', ['slug'=>$shop->slug, 'type'=>'all_products']) }}">{{__('All Products')}}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    @if (!isset($type))
        <section id="slider" class="mt-2" >
            <div class="container p-0">
               <div class="row no-gutters">
                  <div class="col-12">
                     <div class="slider_banner">
                        @if ($shop->sliders != null)
                        @foreach (json_decode($shop->sliders) as $key => $slider)
                            <div class="slider_item position-relative">
                                @if (!empty($slider))
                                    @if (file_exists($slider))
                                        <img class="d-block w-100 lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($slider) }}" alt="{{ $key }} slide" style="max-height:300px;">
                                    @else
                                        <img class="d-block w-100 lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ $key }} slide" style="max-height:300px;">
                                    @endif
                                @else
                                    <img class="d-block w-100 lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ $key }} slide" style="max-height:300px;">
                                @endif
                            </div>
                        @endforeach
                        @endif
                     </div>
                  </div>
               </div>
            </div>
        </section>
        @php
            $featured_product=$shop->user->products->where('published', 1)->where('featured', 1)->all();
        @endphp
        @if (count($featured_product)>0)
        <section id="productlist" class="mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row mb-4">
                            <div class="col-md-12">
                                <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                                    @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == "Nepali")
                                    <h2 class="position-relative mb-0">विशेष उत्पादनहरू</h2>
                                    <a class="btn_view" href="{{route('products')}}"> सबै विशेष उत्पादनहरू हेर्नुहोस्<span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                                    @else
                                    <h2 class="position-relative mb-0">Featured Products</h2>
                                    <a class="btn_view" href="{{route('products')}}"> View all featured products<span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                                    @endif
    
                                    </header>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-lists">
                                    <div class="right-side-wrapper">
                                        <div class="seller_shop">
                                            @foreach ($featured_product as $key => $product)
                                            {{-- @php
                                                    dd($product);
                                                @endphp --}}
                                            <div class="grid-item">
                                                <div class="product-grid-item">
    
    
                                                    <div class="product-grid-image">
                                                        <a href="{{ route('product', $product->slug) }}">
                                                            @php
                                                            $filepath = $product->featured_img;
                                                            @endphp
                                                            @if(isset($filepath))
                                                            @if (file_exists(public_path($filepath)))
                                                            <img src="{{ asset($product->featured_img) }}" alt="{{ $product->name }}" data-src="{{ asset($product->featured_img) }}" class="img-fluid pic-1">
                                                            @else
                                                            <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $product->name }}" data-src="{{ asset('uploads/No_Image.jpg') }}" class="img-fluid pic-1">
                                                            @endif
                                                            @else
                                                            <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $product->name }}" data-src="{{ asset('uploads/No_Image.jpg') }}" class="img-fluid pic-1">
                                                            @endif
                                                        </a>
                                                    </div>
    
                                                    <div class="category-title">
                                                        <div class="category">
                                                            <a class="m-0" href="{{ route('products.category', $product->category->slug) }}">{{ $product->category->name }}</a>
                                                        </div>
                                                        <h6 class="title">
                                                            <a href="{{ route('product', $product->slug) }}" class="">{{ __($product->name) }}</a>
                                                        </h6>
                                                    </div>
                                                    <div class="price-cart text-center py-2 min-height-20">
                                                        <div class="price d-flex flex-column align-items-center w-100">
                                                            <div class="prices align-items-center d-flex justify-content-between w-100">
                                                                <div>
    
                                                                    @php
                                                                    $qty = 0;
                                                                    if($product->variant_product){
                                                                    foreach ($product->stocks as $key => $stock) {
                                                                    $qty += $stock->qty;
                                                                    }
                                                                    }
                                                                    else{
                                                                    $qty = $product->current_stock ;
                                                                    }
                                                                    @endphp
                                                                    @if($qty > 0)
                                                                    <h6 class="m-0 gray text-left cus-price">{{ home_discounted_base_price($product->id) }}&nbsp;</h6>
                                                                    <div class="d-flex justify-content-between w-100 align-items-center">
                                                                        @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                                        <span class="ml-0">{{ home_base_price($product->id) }}</span>&nbsp;&nbsp;
                                                                        @endif
                                                                        @if (! intval(($product->discount),0) == 0)
                                                                        <div>
                                                                            {{ ($product->discount_type == 'amount')?'  Rs.':'' }} -{{ intval(($product->discount),0) }}{{ !($product->discount_type == 'amount')?' %':'' }}
    
                                                                        </div>
                                                                        @endif
    
                                                                    </div>
                                                                    @endif
    
                                                                    <div class="d-flex w-100 mt-2">
                                                                        @if($qty <= 0) <div class="stock mr-1">
                                                                            Out of Stock
                                                                    </div>
                                                                    @endif
    
                                                                </div>
                                                            </div>
                                                            @if($qty > 0)
                                                            <div class="d-flex justify-content-between">
                                                                {{-- @if (! intval(($product->discount),0) == 0)
                                                                            <div class="product-discount-label">
                                                                                {{ ($product->discount_type == 'amount')?'Rs.':'' }} {{ $product->discount }}{{ !($product->discount_type == 'amount')?' %':'' }}
                                                            </div>
                                                            @endif --}}
                                                            <a class="all-deals ico effect" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-placement="right" title="Add to Cart"><i class="fa fa-shopping-cart icon"></i> </a>
    
                                                        </div>
                                                        @endif
                                                    </div>
                                                </div>
                                            </div>
    
                                            <div class="cart-compare">
                                                <a class="all-deals effect gray" href="javasctipy:void(0);" onclick="addToWishList({{$product->id}})"><i class="fa fa-heart icon mr-2"></i>Wishlist
                                                </a>
                                                <a class="all-deals effect gray" onclick="addToCompare({{$product->id}})">
                                                    <i class="fa fa-exchange icon mr-2"></i>Compare
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        @endif

    @endif


    <section class="bg-white pt-5" >
        <div class="container">
            <h4 class="heading-5 strong-600 border-bottom pb-3 mb-4">
                @if (!isset($type))
                    {{__('New Arrival Products')}}
                @elseif ($type == 'top_selling')
                    {{__('Top Selling')}}
                @elseif ($type == 'all_products')
                    {{__('All Products')}}
                @endif
            </h4>
            <div class="row">
                <div class="col-md-12">
                    <div class="product-lists">
                        <div class="right-side-wrapper">
                            <div class="row">
                                @php
                                    if (!isset($type)){
                                        $products = \App\Product::where('user_id', $shop->user->id)->where('published', 1)->orderBy('created_at', 'desc')->paginate(24);
                                    }
                                    elseif ($type == 'top_selling'){
                                        $products = \App\Product::where('user_id', $shop->user->id)->where('published', 1)->orderBy('num_of_sale', 'desc')->paginate(24);
                                    }
                                    elseif ($type == 'all_products'){
                                        $products = \App\Product::where('user_id', $shop->user->id)->where('published', 1)->paginate(24);
                                    }
                                @endphp
                                @foreach ($products as $key => $product)
                                <div class="col-lg-2 col-md-4 col-sm-12" id="productlist">
                                    <div class="product-grid-item">


                                        <div class="product-grid-image">
                                            <a href="{{ route('product', $product->slug) }}">
                                                @php
                                                $filepath = $product->featured_img;
                                                @endphp
                                                @if(isset($filepath))
                                                @if (file_exists(public_path($filepath)))
                                                <img src="{{ asset($product->featured_img) }}" alt="{{ $product->name }}" data-src="{{ asset($product->featured_img) }}" class="img-fluid pic-1">
                                                @else
                                                <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $product->name }}" data-src="{{ asset('uploads/No_Image.jpg') }}" class="img-fluid pic-1">
                                                @endif
                                                @else
                                                <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $product->name }}" data-src="{{ asset('uploads/No_Image.jpg') }}" class="img-fluid pic-1">
                                                @endif
                                            </a>
                                        </div>

                                        <div class="category-title">
                                            <div class="category">
                                                <a class="m-0" href="{{ route('products.category', $product->category->slug) }}">{{ $product->category->name }}</a>
                                            </div>
                                            <h6 class="title">
                                                <a href="{{ route('product', $product->slug) }}" class="">{{ __($product->name) }}</a>
                                            </h6>
                                        </div>
                                        <div class="price-cart text-center py-2 min-height-20">
                                            <div class="price d-flex flex-column align-items-center w-100">
                                                <div class="prices align-items-center d-flex justify-content-between w-100">
                                                    <div>

                                                        @php
                                                        $qty = 0;
                                                        if($product->variant_product){
                                                        foreach ($product->stocks as $key => $stock) {
                                                        $qty += $stock->qty;
                                                        }
                                                        }
                                                        else{
                                                        $qty = $product->current_stock ;
                                                        }
                                                        @endphp
                                                        @if($qty > 0)
                                                        <h6 class="m-0 gray text-left cus-price">{{ home_discounted_base_price($product->id) }}&nbsp;</h6>
                                                        <div class="d-flex justify-content-between w-100 align-items-center">
                                                            @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                            <span class="ml-0">{{ home_base_price($product->id) }}</span>&nbsp;&nbsp;
                                                            @endif
                                                            @if (! intval(($product->discount),0) == 0)
                                                            <div>
                                                                {{ ($product->discount_type == 'amount')?'  Rs.':'' }} -{{ intval(($product->discount),0) }}{{ !($product->discount_type == 'amount')?' %':'' }}

                                                            </div>
                                                            @endif

                                                        </div>
                                                        @endif

                                                        <div class="d-flex w-100 mt-2">
                                                            @if($qty <= 0) <div class="stock mr-1">
                                                                Out of Stock
                                                        </div>
                                                        @endif

                                                    </div>
                                                </div>
                                                @if($qty > 0)
                                                    <div class="d-flex justify-content-between">
                                                    <a class="all-deals ico effect" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-placement="right" title="Add to Cart"><i class="fa fa-shopping-cart icon"></i> </a>

                                                    </div>
                                                @endif
                                            </div>
                                        </div>
                                    </div>

                                    <div class="cart-compare">
                                        <a class="all-deals effect gray" href="javasctipy:void(0);" onclick="addToWishList({{$product->id}})"><i class="fa fa-heart icon mr-2"></i>Wishlist
                                        </a>
                                        <a class="all-deals effect gray" onclick="addToCompare({{$product->id}})">
                                            <i class="fa fa-exchange icon mr-2"></i>Compare
                                        </a>
                                    </div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            <div class="row">
                <div class="col">
                    <div class="products-pagination my-5">
                        <nav aria-label="Center aligned pagination">
                            <ul class="pagination justify-content-center">
                                {{ $products->links() }}
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>


@endsection
@section('script')
    

<script>
            $(".seller_shop").slick({
            infinite: true,
            autoplay: true,
            slidesToShow: 5,
            slidesToScroll: 1,
            arrows: true,
            dots: false,
            responsive: [
                {
                    breakpoint: 1400,
                    settings: {
                        slidesToShow: 5,
                        slidesToScroll: 1,
                    },
                },
                {
                    breakpoint: 1080,
                    settings: {
                        slidesToShow: 5,
                        slidesToScroll: 1,
                    },
                },
                {
                    breakpoint: 780,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1,
                    },
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 1,
                        dots: true,
                    },
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        dots: true,
                    },
                },
            ],
        });
</script>
@endsection