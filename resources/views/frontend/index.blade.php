@extends('frontend.layouts.app')
@section('content')
<style>
    .category-list {
        z-index: 98;
    }

    .sub_menu_list2 {
        position: absolute;
        top: 0;
        width: 57.5rem;
        right: -109%;
        height: 100%;
        padding: 0.5rem 0;
    }

    .sub_menu_list2 {
        display: none;
        transform: translate(14px, -1px);
        transition: 0.5s;
    }

    .product_icon:hover .sub_menu_list2 {
        display: flex;
        transform: translate(14px, -1px);
        left: 100%;
        border-left: 1px solid;
        border-color: #00000026;
        overflow-y: scroll;
        background-color: white;
    }

    .sub_menu_list2 .c-list {
        color: #000;
    }

    .sub_menu_list2 li {
        padding-bottom: 0.5rem;
    }

    .sub_menu_list2 li.title {
        color: var(--theme_color_sub);
    }

    .categories-nav .category_title_top {
        color: #ffffff;
    }

    .categories-nav {
        background-color: var(--theme_color);

    }

    .categories-nav li {
        display: flex;
        height: 100%;
    }

    .categories-nav li:hover a {
        background-color: #258aff !important;
        color: var(--theme_color_sub);
    }

    .demo {
        background: #258aff;
        color: #ffff;
        border-radius: 6px;
        padding: 5px;
    }

    .multi-level.show {
    visibility: visible !important;
    display: block !important;
    opacity: 1;
        }

        
    .dropdown-submenu:hover>.multi-level {
  padding: 0;
  border-radius: 0;
  display: block !important;
  opacity: 1;
        
  visibility: visible !important;
    }
    .dropdown-submenu .dropdown-menu {
    left: 100% !important;
    border-radius:0px !important;

    }
    .category_icon_img img {
    max-height:20px;
    min-height:20px;
    object-fit:contain;
        }
        .dropdown-menu .dropdown-item {
            padding: 10px 10px 10px 10px;
        }

</style>
<style>
    .banner-img {
        max-height: 230px;
        object-fit: contain;
        width: 100%;
    }
</style>
<!-- Categories -->
<!-- <section class="d-lg-block d-none">
    <div class="container p-0">
        <div class="row no-gutters">
            <div class="col-3 d-md-block d-none categories-list">
                <div class="category_title_top d-flex justify-content-between theme_bg" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                    <div class="category_title">
                        <h5 class="mb-0" style="cursor: pointer">All Categories <i class="fa fa-angle-down" aria-hidden="true"></i></h5>
                    </div>
                    <div class="category_btn m-auto">
                        <a href="{{ route('categories.all') }}">View all</a>
                    </div>
                </div>
                <ul class="category-list bg-white border_one position-absolute w-100 collapse" id="collapseExample">
                    @foreach (\App\Category::all()->take(11) as $key => $category)
                    @php
                    $brands = array();
                    @endphp
                    <li class="px-3 product_icon d-block" data-id="{{ $category->id }}">
                        <div style="
                                display: flex;
                                justify-content: space-between;
                                ">
                            <div>
                                <a href="{{ route('products.category', $category->slug) }}" class="sub_icon"><span class="pr-2 category_icon_img">
                                        <img src="{{ $category->icon }}" class="img-fluid" alt=""></span>
                                    {{ __($category->name) }}
                                </a>
                            </div>
                            <div class="icon_show_category">
                                <i class="fa fa-angle-right" aria-hidden="true"></i>
                            </div>
                        </div>
                        <div class="row sub_menu_list2">
                            @if(count($category->subcategories)>0)
                            @foreach ($category->subcategories as $sub)

                            <div class="col-xl-4 col-lg-3 col-md-6 col-12 text-center">
                                <ul class="p-0">
                                    <li class="title font-weight-bold">
                                        <a href="{{ route('products.subcategory', $sub->slug) }}">
                                            {{$sub->name}}
                                        </a>
                                    </li>
                                    @if(count($sub->subsubcategories)>0)
                                    @foreach($sub->subsubcategories as $subsub)
                                    <li><a href="{{ route('products.subsubcategory', $subsub->slug) }}" class="c-list">{{$subsub->name}}</a></li>
                                    @endforeach
                                    @endif
                                </ul>
                            </div>
                            @endforeach
                            @endif
                        </div>
                        {{-- <ul class="sub_menu_list">
                            @if(count($category->subcategories)>0)
                            @foreach ($category->subcategories as $sub)
                            <li>
                                <a href="{{ route('products.subcategory', $category->slug) }}">
                        <span class="mr-2"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                        {{$sub->name}}
                        </a>
                    </li>
                    @endforeach
                    @endif
                </ul> --}}
                </li>
                @endforeach
                </ul>
            </div>
            <div class="col-9">
                <ul class="categories-nav d-flex justify-content-around align-items-center h-100">
                    @foreach(\App\Category::where('top',1)->limit(5)->get() as $top)
                    <li>
                        <a href="{{ route('products.category', $top->slug) }}" class="category_title_top">{{$top->name}}</a>

                    </li>
                    @endforeach

                </ul>
            </div>

        </div>
    </div>
</section> -->
<!-- Categories Ends -->  
 <!-- Categories -->

   <!-- Categories Ends -->
<section id="slider">
    <div class="container p-0">
        <div class="row no-gutters">
            {{-- <div class="col-lg-3 col-12 d-md-block d-none">
             <div class="category_title_top d-flex justify-content-between theme_bg">
                <div class="category_title">
                   <h5 class="mb-0">All Categories</h5>
                </div>
                <div class="category_btn">
                   <a href="{{ route('categories.all') }}">सबै हेर्नुहोस्</a>
        </div>
    </div>
    <ul class="bg-white border_one d-lg-block d-none">
        @foreach (\App\Category::all()->take(10) as $key => $category)
        @php
        $brands = array();
        @endphp
        <li class="px-3 product_icon position-relative d-block" data-id="{{ $category->id }}">
            <div style="
                            display: flex;
                            justify-content: space-between;
                            ">
                <div>
                    <a href="{{ route('products.category', $category->slug) }}" class="sub_icon"><span class="pr-2 category_icon_img">
                            <img src="{{ $category->icon }}" class="img-fluid" alt=""></span>
                        {{ __($category->name) }}
                    </a>
                </div>
                <div class="icon_show_category">
                    <i class="fa fa-angle-right" aria-hidden="true"></i>
                </div>
            </div>
            <ul class="sub_menu_list">
                @if(count($category->subcategories)>0)
                @foreach ($category->subcategories as $sub)
                <li>
                    <a href="{{ route('products.subcategory', $category->slug) }}">
                        <span class="mr-2"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                        {{$sub->name}}
                    </a>
                </li>
                @endforeach
                @endif
            </ul>
        </li>
        @endforeach
    </ul>
    </div> --}}
    <div class="col-12">
        <div class="slider_banner">
            @foreach (\App\Slider::where('published', 1)->get() as $key => $slider)
            <div class="slider_item position-relative">
                <a href="{{ $slider->link }}" target="_blank"> <img src="{{ asset($slider->photo) }}" class="d-block w-100 img-fluid" data-src="{{ asset($slider->photo) }}" alt="{{ env('APP_NAME')}}" /></a>
            </div>
            @endforeach
        </div>
    </div>
    </div>
    </div>
</section>


@php
$flash_deal = \App\FlashDeal::where('status', 1)->where('featured', 1)->first();
@endphp
@if($flash_deal != null && strtotime(date('Y-m-d H:i:s')) >= $flash_deal->start_date && strtotime(date('Y-m-d H:i:s')) <= $flash_deal->end_date)
@php    
    $time = date('Y-m-d H:i:s',$flash_deal->end_date);
@endphp
<section id="product-listing-wrapper" class=" product_listing pt-3">
    <div class="container">
    <div class="product-lists">
    <div class="row">
       <div class="col-lg-9 col-sm-12">
          <div class="col-12">
             <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == "Nepali")
                 <h2 class="position-relative mb-0">Flash Sale</h2>
                 <div class="flash-deal-box float-left d-flex">
                    Sale Ends in : <div class="countdown countdown--style-1 countdown--style-1-v1 " data-countdown-date="{{ date('Y-m-d H:i:s', $flash_deal->end_date) }}" data-countdown-label="show"></div>
                 </div>
                 <a class="btn_view" href="{{ route('flash-deals') }}"> सबै हेर्नुहोस् <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                @else
                 <h2 class="position-relative mb-0">Flash Sale</h2>
                 <div class="flash-deal-box float-left d-flex">
                     Sale Ends in : <div class="countdown countdown--style-1 countdown--style-1-v1 " data-countdown-date="{{ date('Y-m-d H:i:s', $flash_deal->end_date) }}" data-countdown-label="show"></div>
                 </div>
                 <a class="btn_view" href="{{ route('flash-deals') }}"> View all <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                @endif
             </div>
          </div>
          <div class="col-12">
             <div class="grid-container2  flash_feature">
                 @foreach ($flash_deal->flash_deal_products as $key => $flash_deal_product)
                     @php
                         $product = \App\Product::find($flash_deal_product->product_id);
                     @endphp
                     @if ($product != null && $product->published != 0)
                         <div class="grid-item mb-4">
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
                                 <div class="category-title mt-2">
                                     <h6 class="title">
                                     <a href="{{ route('product', $product->slug) }}" class="">{{ __($product->name) }}</a>
                                     </h6>
                                     <div class="category">
                                     <a class="m-0">{{ $product->category->name }}</a>
                                     </div>
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
                                                                 {{ ($flash_deal_product->discount_type == 'amount')?'  Rs.':'' }} -{{ (intval($flash_deal_product->discount,0)) }}{{ !($product->discount_type == 'amount')?' %':'' }}
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
                                                     {{-- <div class="product-discount-label">
                                                         {{ ($product->discount_type == 'amount')?'Rs.':'' }} {{ $product->discount }}{{ !($product->discount_type == 'amount')?' %':'' }}
                                                     </div> --}}
                                                     <a class="all-deals ico effect" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-placement="right" title="Add to Cart"><i class="fa fa-shopping-cart icon"></i> </a>
                                                 </div>
                                             @endif
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     @endif
                 @endforeach
             </div>
             <div class="col-3">
             </div>
          </div>
       </div>
       <div class="col-lg-3 col-sm-12">
           @php
               $banner = 'uploads/No_Image.jpg';
                if(isset($flash_deal->banner) && ($flash_deal->banner) != ''){
                    if (file_exists(public_path($filepath))){
                        $banner = $flash_deal->banner;
                    }
                }

               
           @endphp
           <img src="{{asset($banner)}}" style="width: 100%;object-fit:contain;min-height: 100%;max-height: 100%;" alt="">
       </div>
    </div>
</section>
@endif
<!--============================================================ CATEGORY START=-->
{{-- <section id="category_section" class="">
    <div class="container">
        <div class="grid-container slick_category">
            @foreach (\App\Category::where('featured', 1)->get() as $key => $category)
            <div class="category_men_block">
                <a href="{{ route('products.category', $category->slug) }}">
                    <div class="grid-item">
                        <img src="{{ asset($category->banner) }}" data-src="{{ asset($category->banner) }}" alt="{{ __($category->name) }}" class="img-fluid img-fit lazyloaded">
                    </div>
                    <div class="text_cate">
                        <h3>{{ __($category->name) }}</h3>
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
</section> --}}

<section id="banner_three" class="mb-3">
    <div class="container">
        <div class="row">
            @foreach (\App\Banner::where('position', 3)->where('published', 1)->take(1)->get() as $key => $banner)
            <div class="col-md-12 mb-3">
                <a href="{{ $banner->url }}">
                    {{-- two_banner_img --}}
                    <div class="">
                        <img src="{{ asset($banner->photo) }}" class="img-fluid banner-img" alt="{{ env('APP_NAME') }} promo">
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
</section>
<section id="product-listing-wrapper" class=" product_listing">
    <div class="container">
        <div class="product-lists">
            <div class="row">
                <div class="col-md-12">
                    <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                        @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == "Nepali")
                        <h2 class="position-relative mb-0">नयाँ सामानहरू</h2>
                        <a class="btn_view" href="{{route('products')}}"> सबै हेर्नुहोस् <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>

                        @else
                        <h2 class="position-relative mb-0">New Arrivals</h2>
                        <a class="btn_view" href="{{route('search')}}"> View all <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                        @endif
                        </header>
                    </div>
                </div>

                <div class="col-xl-12">

                    <div class="slider_feature">
                        {{-- ->where('current_stock','>',0) --}}
                        @foreach (filter_products(\App\Product::orderBy('id','DESC')->where('current_stock','>',0)->with('stocks'))->limit(12)->get() as $key => $product)
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
                                <div class="category-title mt-2">
                                    <h6 class="title">
                                        <a href="{{ route('product', $product->slug) }}" class="">{{ __($product->name) }}</a>
                                    </h6>
                                    <div class="category">
                                        <a class="m-0">{{ $product->category->name }}</a>
                                    </div>
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
                                                        {{ ($product->discount_type == 'amount')?'  Rs.':'' }} -{{ (intval($product->discount,0)) }}{{ !($product->discount_type == 'amount')?' %':'' }}

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
                         
                            <a class="all-deals effect gray" onclick="addToWishList({{ $product->id }})">
                                <i class="fa fa-heart icon mr-2"></i>Wishlist
                            </a>
                            <a class="all-deals effect gray" onclick="addToCompare({{ $product->id }})">
                                <i class="fa fa-exchange icon mr-2"></i>Compare
                            </a>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</section>

<div id="section_featured">
</div>

<!-- Brands -->
<section id="our-brands" class="m-3">
    <div class="container">
        <div class="product-lists">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                        @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == "Nepali")
                        <h2 class="position-relative mb-0">ब्रान्डहरू</h2>
                        <a class="btn_view" href="{{route('brands.all')}}"> सबै ब्रान्डहरू हेर्नुहोस्<span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                        @else
                        <h2 class="position-relative mb-0">Brands</h2>
                        <a class="btn_view" href="{{route('brands.all')}}"> View all Brands<span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                        @endif
                    </div>
                </div>
                <div class="col-xl-12 my-2">
                    <div class="slick_brand">
                        @php
                        $brands=\App\Models\Brand::all();
                        @endphp
                        @foreach ($brands as $brand)

                        <div class="brand-list mx-1" style="border: 2px solid #ddd">
                            <a href="{{route('products.brand',$brand->slug)}}">
                                <div class="item">
                                    @if (!empty($brand->logo))
                                    @if (file_exists($brand->logo))
                                    <img src="{{asset($brand->logo)}}" alt="{{$brand->name}}" class="img-fluid img-fit lazyloaded">
                                    @else
                                    <img src="{{asset('frontend/images/placeholder.jpg')}}" alt="{{$brand->name}}" class="img-fluid img-fit lazyloaded">
                                    @endif
                                    @else
                                    <img src="{{asset('frontend/images/placeholder.jpg')}}" alt="{{$brand->name}}" class="img-fluid img-fit lazyloaded">
                                    @endif

                                </div>
                            </a>
                        </div>
                        @endforeach

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Brands Ends -->




@if(Auth::check())
@if(isset($recommended) && (($recommended)->count()) >0)
<section id="product-listing-wrapper" class=" product_listing">
    <div class="container">
        <div class="product-lists">
            <div class="row">
                <div class="col-md-12">
                    <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                        @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == "Nepali")
                        <h2 class="position-relative mb-0">सिफारिस गरिएको</h2>
                        <a class="btn_view" href="{{route('products')}}"> सबै हेर्नुहोस् <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>

                        @else
                        <h2 class="position-relative mb-0">Recommended For you</h2>
                        <a class="btn_view" href="{{route('search')}}"> View all <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                        @endif
                        </header>
                    </div>
                </div>

                <div class="col-xl-12">

                    <div class="slider_feature">
                        @foreach ($recommended as $key => $product_id)
                        {{-- @foreach (filter_products(\App\Product::orderBy('id','DESC')->where('current_stock','>',0)->with('stocks'))->limit(12)->get() as $key => $product) --}}

                        @php
                        $product = \App\Product::where('id',$product_id->product_id)->where('published',1)->with('stocks')->first();

                        @endphp
                        @if (($product))
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
                @endif
                @endforeach
            </div>
        </div>
    </div>
    </div>
    </div>
</section>
@endif
@endif
<div id="section_best_selling">
</div>


<!--============================================= BANNER START ======-->

<section id="banner_two" class="mb-3">
    <div class="container">
        <div class="row">
            @foreach (\App\Banner::where('position', 1)->where('published', 1)->take(2)->get() as $key => $banner)
            <div class="col-md-6 mb-3">
                <a href="{{ $banner->url }}">
                    {{-- two_banner_img --}}
                    <div class="">
                        <img src="{{ asset($banner->photo) }}" class="img-fluid banner-img" alt="{{ env('APP_NAME') }} promo">
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!--=========================================== BANNER END ======-->



{{-- @if(\App\BusinessSetting::where('type', 'classified_product')->first()->value == 1)
        @php
            $customer_products = \App\CustomerProduct::where('status', '1')->where('published', '1')->take(10)->get();
        @endphp
       @if (count($customer_products) > 0)
           <section class="mb-4">
               <div class="container">
                   <div class="px-2 py-4 p-md-4 bg-white shadow-sm">
                       <div class="section-title-1 clearfix">
                           <h3 class="heading-5 strong-700 mb-0 float-left">
                               <span class="mr-4">{{__('Classified Ads')}}</span>
</h3>
<ul class="inline-links float-right">
    <li><a href="{{ route('customer.products') }}" class="active">{{__('View More')}}</a></li>
</ul>
</div>
<div class="caorusel-box arrow-round">
    <div class="slick-carousel" data-slick-items="6" data-slick-xl-items="5" data-slick-lg-items="4" data-slick-md-items="3" data-slick-sm-items="2" data-slick-xs-items="2">
        @foreach ($customer_products as $key => $customer_product)
        <div class="product-card-2 card card-product my-2 mx-1 mx-sm-2 shop-cards shop-tech">
            <div class="card-body p-0">
                <div class="card-image">
                    <a href="{{ route('customer.product', $customer_product->slug) }}" class="d-block">
                        <img class="img-fit lazyload mx-auto" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset(json_decode($customer_product->photos)[0]) }}" alt="{{ __($customer_product->name) }}">
                    </a>
                </div>
                <div class="p-sm-3 p-2">
                    <div class="price-box">
                        <span class="product-price strong-600">{{ single_price($customer_product->unit_price) }}</span>
                    </div>
                    <h2 class="product-title p-0 text-truncate-1">
                        <a href="{{ route('customer.product', $customer_product->slug) }}">{{ __($customer_product->name) }}</a>
                    </h2>
                    <div>
                        @if($customer_product->conditon == 'new')
                        <span class="product-label label-hot">{{__('new')}}</span>
                        @elseif($customer_product->conditon == 'used')
                        <span class="product-label label-hot">{{__('Used')}}</span>
                        @endif
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
</div>
</div>
</section>
@endif
@endif --}}

{{-- <div class="mb-4">
        <div class="container">
            <div class="row gutters-10 ">
                @foreach (\App\Banner::where('position', 2)->where('published', 1)->get() as $key => $banner)
                    <div class="col-lg-{{ 12/count(\App\Banner::where('position', 2)->where('published', 1)->get()) }}">
<div class="media-banner mb-3 mb-lg-0">
    <a href="{{ $banner->url }}" target="_blank" class="banner-container">
        <img src="{{ asset('frontend/images/placeholder-rect.jpg') }}" data-src="{{ asset($banner->photo) }}" alt="{{ env('APP_NAME') }} promo" class="img-fluid lazyload">
    </a>
</div>
</div>
@endforeach
</div>
</div>
</div> --}}

<div id="section_home_categories">

</div>

<!--=========================================== Home category section ======-->

<!--=========================================== Home category section END ======-->


<!--============================================= BANNER START ======-->
<section id="banner_two" class="mb-5">
    <div class="container">
        <div class="row">
            @foreach (\App\Banner::where('position', 2)->where('published', 1)->take(2)->get() as $key => $banner)
            <div class="col-md-6 mb-3">
                <a href="{{ $banner->url }}">
                    {{-- two_banner_img --}}
                    <div class="">
                        <img src="{{ asset($banner->photo) }}" class="img-fluid banner-img" alt="{{ env('APP_NAME') }} promo">
                    </div>
                </a>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!--=========================================== BANNER END ======-->

<!--============================================= JUST FOR YOU START ======-->

<!--============================================= JUST FOR YOU END ======-->
<div id="section_best_sellers">

</div>




@php
    $today = date('Y-m-d H:i:s');
    // dd($today);
@endphp
@endsection

@section('script')
@if($flash_deal != null && strtotime(date('Y-m-d H:i:s')) >= $flash_deal->start_date && strtotime(date('Y-m-d H:i:s')) <= $flash_deal->end_date)
@php
    $time = '';
@endphp
<script>
    $(document).ready(function() {
        // flash counter
        var data = @json($time);
        var today = @json($today);
        // console.log(data);
        var countDownDate = new Date(data).getTime();
        // console.log('countDownDate'+countDownDate)
        // Update the count down every 1 second
        var x = setInterval(function() {
        // Get today's date and time
        var now = new Date(today).getTime();
        // console.log('now'+now)
        //   alert(countDownDate);
        // Find the distance between now and the count down date
        var distance = countDownDate - now;
        // console.log('distance'+distance)
        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        // console.log(document.getElementsByClassName("demo"));
        // Output the result in an element with id="demo"
        $('.demo').text(days + " days : " + hours + " hours : " + minutes + " minutes : " + seconds + " seconds");
        //document.getElementsByClassName("demo").innerHTML = days + "d " + hours + "h "+ minutes + "m " + seconds + "s ";
        // If the count down is over, write some text
            if (distance < 0) {
                clearInterval(x);
                $('.demo').text("EXPIRED");
                //document.getElementsByClassName("demo").innerHTML = "EXPIRED";
            }
        }, 1000);
        // flash counter
    });
</script>
@endif

<script>
    $(document).ready(function() {
        $(".slider_feature").slick({
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
                        slidesToShow: 2,
                        slidesToScroll: 1,
                        dots: true,
                    },
                },
                {
                    breakpoint: 320,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                        dots: true,
                    },
                },
            ],
        });
        $.post('{{ route('home.section.featured')}}', {_token:'{{ csrf_token() }}'
            },
            function(data) {
                // console.log(data);
                $('#section_featured').html(data);
                $(".featured-section").slick({
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
                                slidesToShow: 1,
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
            });
        $.post('{{ route('home.section.best_selling')}}', {_token:'{{ csrf_token() }}'
            },
            function(data) {
                // console.log(data);
                $('#section_best_selling').html(data);
                $(".best-selling").slick({
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
                                slidesToShow: 1,
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
            });
        $.post('{{ route('home.section.home_categories')}}', {_token:'{{ csrf_token() }}'},
            function(data) {
                $('#section_home_categories').html(data);
                
            });
        $.post('{{ route('home.section.best_sellers')}}', {_token:'{{ csrf_token() }}'
            },
            function(data) {
                $('#section_best_sellers').html(data);
                // slickInit();

                $(".slider_feature2").slick({
                    autoplay: true,
                    slidesToShow: 5,
                    slidesToScroll: 7,
                    arrows: true,
                    dots: false,
                    responsive: [{
                            breakpoint: 1400,
                            settings: {
                                slidesToShow: 5,
                                slidesToScroll: 4,
                            },
                        },
                        {
                            breakpoint: 1080,
                            settings: {
                                slidesToShow: 1,
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
                                slidesToShow: 2,
                                slidesToScroll: 1,
                                dots: true,
                            },
                        },
                    ],
                });
            });
    });
    $( document ).ajaxStop(function() {
        $(".slider_feature33").slick({
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
                        slidesToShow: 1,
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

    });
</script>
@endsection