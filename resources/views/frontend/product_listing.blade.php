@extends('frontend.layouts.app')

@if(isset($subsubcategory_id))
    @php
        $meta_title = \App\SubSubCategory::find($subsubcategory_id)->meta_title;
        $meta_description = \App\SubSubCategory::find($subsubcategory_id)->meta_description;
    @endphp
@elseif (isset($subcategory_id))
    @php
        $meta_title = \App\SubCategory::find($subcategory_id)->meta_title;
        $meta_description = \App\SubCategory::find($subcategory_id)->meta_description;
    @endphp
@elseif (isset($category_id))
    @php
        $meta_title = \App\Category::find($category_id)->meta_title;
        $meta_description = \App\Category::find($category_id)->meta_description;
    @endphp
@elseif (isset($brand_id))
    @php
        $meta_title = \App\Brand::find($brand_id)->meta_title;
        $meta_description = \App\Brand::find($brand_id)->meta_description;
    @endphp
@else
    @php
        $meta_title = env('APP_NAME');
        $meta_description = \App\SeoSetting::first()->description;
    @endphp
@endif
@section('title'){{ $meta_title }}@stop
@section('meta_title'){{ $meta_title }}@stop
@section('meta_description'){{ $meta_description }}@stop

@section('meta')
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="{{ $meta_title }}">
    <meta itemprop="description" content="{{ $meta_description }}">

    <!-- Twitter Card data -->
    <meta name="twitter:title" content="{{ $meta_title }}">
    <meta name="twitter:description" content="{{ $meta_description }}">

    <!-- Open Graph data -->
    <meta property="og:title" content="{{ $meta_title }}" />
    <meta property="og:description" content="{{ $meta_description }}" />
@endsection

@section('content')

    <!-- Breadcrumbs -->
    <section id="breadcrumb-wrapper" class="position-relative bg-light">
        {{-- <div class="image">
            <img src="{{asset('frontend/assets/images/banner/1.jpg')}}" alt="breadcrumb-image" class="img-fluid">
        </div> --}}
    
        <div class="container">
        <ol class="breadcrumb mt-3 py-3">
            <li class=""><a class="text-dark font-weight-bold" href="{{ route('home') }}">{{__('Home')}}</a></li>
                <li class=""><a class="text-dark font-weight-bold" href="{{ route('products') }}">{{__('All Categories')}}</a></li>
                @if(isset($category_id))
                    <li class="active "><a class="text-dark font-weight-bold" href="{{ route('products.category', \App\Category::find($category_id)->slug) }}">{{ \App\Category::find($category_id)->name }}</a></li>
                @endif
                @if(isset($subcategory_id))
                    <li class=""><a class="text-dark font-weight-bold" href="{{ route('products.category', \App\SubCategory::find($subcategory_id)->category->slug) }}">{{ \App\SubCategory::find($subcategory_id)->category->name }}</a></li>
                    <li class="active "><a class="text-dark font-weight-bold" href="{{ route('products.subcategory', \App\SubCategory::find($subcategory_id)->slug) }}">{{ \App\SubCategory::find($subcategory_id)->name }}</a></li>
                @endif
                @if(isset($subsubcategory_id))
                    <li class=""><a class="text-dark font-weight-bold" href="{{ route('products.category', \App\SubSubCategory::find($subsubcategory_id)->subcategory->category->slug) }}">{{ \App\SubSubCategory::find($subsubcategory_id)->subcategory->category->name }}</a></li>
                    <li class=""><a class="text-dark font-weight-bold" href="{{ route('products.subcategory', \App\SubsubCategory::find($subsubcategory_id)->subcategory->slug) }}">{{ \App\SubsubCategory::find($subsubcategory_id)->subcategory->name }}</a></li>
                    <li class="active "><a class="text-dark font-weight-bold" href="{{ route('products.subsubcategory', \App\SubSubCategory::find($subsubcategory_id)->slug) }}">{{ \App\SubSubCategory::find($subsubcategory_id)->name }}</a></li>
                @endif
        </ol>


        </div>
    </section>
    <!-- Breadcrumbs Ends -->


    <section id="product-listing-wrapper" class="py-4">
        <div class="container">
            <form class="" id="search-form" action="{{ route('search') }}" method="GET">
                <div class="product-lists">
                    <div class="row">
                    <div class="col-xl-3 col-lg-3 col-12">
                        <div class="left-side-wrapper px-4 py-4 d-lg-block d-none">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card-wrapper mb-2">
                                        <div class="card-group-item">
                                            <div class="card-head">
                                                <div
                                                    class="heading d-flex align-items-center text-center flex-wrap">
                                                    <div class="head">
                                                        <h6 class="text-capitalize m-0">Choose Category</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="filter-content1">
                                                <div class="card-body px-3 py-2">
                                                    <ul class="mb-0">
                                                        @if(!isset($category_id) && !isset($category_id) && !isset($subcategory_id) && !isset($subsubcategory_id))
                                                            @foreach(\App\Category::all() as $category)
                                                                <li><div class="item"><a href="{{ route('products.category', $category->slug) }}" class="category-item py-1">{{ __($category->name) }}</a></div></li>
                                                            @endforeach
                                                        @endif
                                                        @if(isset($category_id))
                                                            <li><div class="item"><a href="{{ route('products') }}" class="active">{{__('All Categories')}}</a></div></li>
                                                            <li><div class="item"><a href="{{ route('products.category', \App\Category::find($category_id)->slug) }}" class="active">{{ __(\App\Category::find($category_id)->name) }}</a></div></li>
                                                            @foreach (\App\Category::find($category_id)->subcategories as $key2 => $subcategory)
                                                                <li class="child"><div class="item"><a href="{{ route('products.subcategory', $subcategory->slug) }}">{{ __($subcategory->name) }}</a></div></li>
                                                            @endforeach
                                                        @endif
                                                        @if(isset($subcategory_id))
                                                            <li><div class="item"><a href="{{ route('products') }}" class="active">{{__('All Categories')}}</a></div></li>
                                                            <li><div class="item"><a href="{{ route('products.category', \App\SubCategory::find($subcategory_id)->category->slug) }}" class="active">{{ __(\App\SubCategory::find($subcategory_id)->category->name) }}</a></div></li>
                                                            <li><div class="item"><a href="{{ route('products.subcategory', \App\SubCategory::find($subcategory_id)->slug) }}" class="active">{{ __(\App\SubCategory::find($subcategory_id)->name) }}</a></div></li>
                                                            @foreach (\App\SubCategory::find($subcategory_id)->subsubcategories as $key3 => $subsubcategory)
                                                                <li class="child"><div class="item"><a href="{{ route('products.subsubcategory', $subsubcategory->slug) }}">{{ __($subsubcategory->name) }}</a></div></li>
                                                            @endforeach
                                                        @endif
                                                        @if(isset($subsubcategory_id))
                                                            <li><div class="item"><a href="{{ route('products') }}" class="active">{{__('All Categories')}}</a></div></li>
                                                            <li><div class="item"><a href="{{ route('products.category', \App\SubsubCategory::find($subsubcategory_id)->subcategory->category->slug) }}" class="active">{{ __(\App\SubSubCategory::find($subsubcategory_id)->subcategory->category->name) }}</a></div></li>
                                                            <li><div class="item"><a href="{{ route('products.subcategory', \App\SubsubCategory::find($subsubcategory_id)->subcategory->slug) }}" class="active">{{ __(\App\SubsubCategory::find($subsubcategory_id)->subcategory->name) }}</a></div></li>
                                                            <li><div class="item"><a href="{{ route('products.subsubcategory', \App\SubsubCategory::find($subsubcategory_id)->slug) }}" class="current">{{ __(\App\SubsubCategory::find($subsubcategory_id)->name) }}</a></div></li>
                                                        @endif
                                                    </ul>
                                                </div>
                                                <!-- card-body.// -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="card-wrapper my-2">
                                        <div class="card-group-item">
                                            <div class="card-head">
                                                <div class="heading d-flex align-items-center text-center flex-wrap">
                                                    <div class="head">
                                                        <h6 class="text-capitalize m-0">{{__('Price range')}}</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="filter-content1">
                                                <div class="card-body px-3 py-2">
                                                    <div class="range-slider-wrapper mt-3">
                                                        <!-- Range slider container -->
                                                        <div id="input-slider-range" data-range-value-min="{{ filter_products(\App\Product::query())->get()->min('unit_price') }}" data-range-value-max="{{ filter_products(\App\Product::query())->get()->max('unit_price') }}"></div>
            
                                                        <!-- Range slider values -->
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <span class="range-slider-value value-low"
                                                                    @if (isset($min_price))
                                                                        data-range-value-low="{{ $min_price }}"
                                                                    @elseif($products->min('unit_price') > 0)
                                                                        data-range-value-low="{{ $products->min('unit_price') }}"
                                                                    @else
                                                                        data-range-value-low="0"
                                                                    @endif
                                                                    id="input-slider-range-value-low">
                                                            </div>
            
                                                            <div class="col-6 text-right">
                                                                <span class="range-slider-value value-high"
                                                                    @if (isset($max_price))
                                                                        data-range-value-high="{{ $max_price }}"
                                                                    @elseif($products->max('unit_price') > 0)
                                                                        data-range-value-high="{{ $products->max('unit_price') }}"
                                                                    @else
                                                                        data-range-value-high="0"
                                                                    @endif
                                                                    id="input-slider-range-value-high">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                {{-- product rating --}}
                                <div class="col-12">
                                    <div class="card-wrapper my-2">
                                        <div class="card-group-item">
                                            <div class="card-head">
                                                <div
                                                    class="heading d-flex align-items-center text-center flex-wrap">
                                                    <div class="head">
                                                        <h6 class="text-capitalize m-0">Product Rating</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="px-3 py-2">
                                                <ul class="mb-0">
                                                    @for ($i = 1; $i <= 5; $i++)     
                                                    <li>
                                                        <input type="radio" name="rating" value="{{$i}}" onchange="filter()" title="{{$i}} star" />
                                                        
                                                        @for ($j = 1; $j <= $i; $j++)   
                                                            <label class="fa fa-star fa-2x" for="star{{$i}}" title="{{$i}} star" aria-hidden="true"></label>
                                                        @endfor

                                                    </li>
                                                    @endfor

                                                </ul>
                                            </div>
                                        </div>
                                        <!-- card-group-item.// -->
                                    </div>
                                </div>

                                @if (!empty($all_colors))
                                    <div class="col-12">
                                        <div class="card-wrapper my-2">
                                            <div class="card-group-item">
                                                <div class="card-head">
                                                    <div
                                                        class="heading d-flex align-items-center text-center flex-wrap">
                                                        <div class="head">
                                                            <h6 class="text-capitalize m-0">Choose Color</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="colors_block px-3 py-2">
                                                    <ul class="list-inline checkbox-color checkbox-color-circle mb-0">
                                                        @foreach ($all_colors as $key => $color)
                                                            <li>
                                                                <input type="radio" id="color-{{ $key }}" name="color" value="{{ $color }}" @if(isset($selected_color) && $selected_color == $color) checked @endif onchange="filter()">
                                                                <label style="background: {{ $color }};" for="color-{{ $key }}" data-toggle="tooltip" data-original-title="{{ \App\Color::where('code', $color)->first()->name }}"></label>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                </div>
                                            </div>
                                            <!-- card-group-item.// -->
                                        </div>
                                    </div>
                                @endif


                                @foreach ($attributes as $key => $attribute)
                                    @if (\App\Attribute::find($attribute['id']) != null)
                                        <div class="col-12">
                                            <div class="card-wrapper my-2">
                                                <div class="card-group-item">
                                                    <div class="card-head">
                                                        <div
                                                            class="heading d-flex align-items-center text-center flex-wrap">
                                                            <div class="head">
                                                                <h6 class="text-capitalize m-0">Choose {{ \App\Attribute::find($attribute['id'])->name }}</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="colors_block px-3 py-2">
                                                        @if(array_key_exists('values', $attribute))
                                                            @foreach ($attribute['values'] as $key => $value)
                                                                @php
                                                                    $flag = false;
                                                                    if(isset($selected_attributes)){
                                                                        foreach ($selected_attributes as $key => $selected_attribute) {
                                                                            if($selected_attribute['id'] == $attribute['id']){
                                                                                if(in_array($value, $selected_attribute['values'])){
                                                                                    $flag = true;
                                                                                    break;
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                @endphp
                                                                <div class="checkbox">
                                                                    <input type="checkbox" id="attribute_{{ $attribute['id'] }}_value_{{ $value }}" name="attribute_{{ $attribute['id'] }}[]" value="{{ $value }}" @if ($flag) checked @endif onchange="filter()">
                                                                    <label for="attribute_{{ $attribute['id'] }}_value_{{ $value }}">{{ $value }}</label>
                                                                </div>
                                                            @endforeach
                                                        @endif
                                                    </div>
                                                </div>
                                                <!-- card-group-item.// -->
                                            </div>
                                        </div>
                                    @endif
                                @endforeach
                            </div>

                            {{-- <button type="submit" class="btn btn-styled btn-block btn-base-4">Apply filter</button> --}}
                        </div>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn-custom d-xl-none d-lg-none d-md-block mb-4"
                        data-toggle="modal" data-target="#leftsidebarfilter">
                        Product Filter
                        <span class="ml-2">
                            <i class="fa fa-list" aria-hidden="true"></i>
                        </span>
                    </button>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-12">
                        <!-- <div class="bg-white"> -->
                            @isset($category_id)
                                <input type="hidden" name="category" value="{{ \App\Category::find($category_id)->slug }}">
                            @endisset
                            @isset($subcategory_id)
                                <input type="hidden" name="subcategory" value="{{ \App\SubCategory::find($subcategory_id)->slug }}">
                            @endisset
                            @isset($subsubcategory_id)
                                <input type="hidden" name="subsubcategory" value="{{ \App\SubSubCategory::find($subsubcategory_id)->slug }}">
                            @endisset

                            <div class="sort-by-bar row no-gutters bg-white mb-3 px-3 pt-2">
                                <div class="col-xl-4 d-flex d-xl-block justify-content-between align-items-end ">
                                    <div class="sort-by-box flex-grow-1">
                                        <div class="form-group">
                                            <label>{{__('Search')}}</label>
                                            <div class="search-widget">
                                                <input class="form-control input-lg" type="text" name="q" placeholder="{{__('Search products')}}" @isset($query) value="{{ $query }}" @endisset>
                                                <button type="submit" class="btn-inner">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    {{-- <div class="d-xl-none ml-3 form-group">
                                        <button type="button" class="btn p-1 btn-sm" id="side-filter">
                                            <i class="la la-filter la-2x"></i>
                                        </button>
                                    </div> --}}
                                </div>
                                <div class="col-xl-7 offset-xl-1">
                                    <div class="row no-gutters">
                                        <div class="col-3">
                                            <div class="sort-by-box px-1">
                                                <div class="form-group">
                                                    <label>{{__('Sort by')}}</label>
                                                    <select class="form-control sortSelect" data-minimum-results-for-search="Infinity" name="sort_by" onchange="filter()">
                                                        <option value="1" @isset($sort_by) @if ($sort_by == '1') selected @endif @endisset>{{__('Newest')}}</option>
                                                        <option value="2" @isset($sort_by) @if ($sort_by == '2') selected @endif @endisset>{{__('Oldest')}}</option>
                                                        <option value="3" @isset($sort_by) @if ($sort_by == '3') selected @endif @endisset>{{__('Price low to high')}}</option>
                                                        <option value="4" @isset($sort_by) @if ($sort_by == '4') selected @endif @endisset>{{__('Price high to low')}}</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="sort-by-box px-1">
                                                <div class="form-group">
                                                    <label>{{__('Brands')}}</label>
                                                    <select class="form-control sortSelect" data-placeholder="{{__('All Brands')}}" name="brand" onchange="filter()">
                                                        <option value="">{{__('All Brands')}}</option>
                                                        @foreach (\App\Brand::all() as $brand)
                                                            <option value="{{ $brand->slug }}" @isset($brand_id) @if ($brand_id == $brand->id) selected @endif @endisset>{{ $brand->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="sort-by-box px-1">
                                                <div class="form-group">
                                                    <label>{{__('Sellers')}}</label>
                                                    <select class="form-control sortSelect" data-placeholder="{{__('All Sellers')}}" name="seller_id" onchange="filter()">
                                                        <option value="">{{__('All Sellers')}}</option>
                                                        @foreach (\App\Seller::all() as $key => $seller)
                                                            @if ($seller->user != null && $seller->user->shop != null)
                                                                <option value="{{ $seller->id }}" @isset($seller_id) @if ($seller_id == $seller->id) selected @endif @endisset>{{ $seller->user->shop->name }}</option>
                                                            @endif
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="sort-by-box px-1">
                                                <div class="form-group">
                                                    <label>{{__('Locations')}}</label>
                                                    <select class="form-control sortSelect" data-placeholder="{{__('All Locations')}}" name="location" onchange="filter()">
                                                        <option value="">{{__('All Locations')}}</option>
                                                        @foreach (\App\Location::all() as $location)
                                                            <option value="{{ $location->id }}" @isset($location_id) @if ($location_id == $location->id) selected @endif @endisset>{{ $location->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="min_price" value="">
                            <input type="hidden" name="max_price" value="">
                            <!-- <hr class=""> -->
                            <div class="row right-side-wrapper">
                                <div class="grid-container">
                                    @foreach ($products as $key => $product)
                                    <div class="grid-item">
                                        <div class="product-grid-item">
                                            <div class="product-grid-image">
                                                <a href="{{ route('product', $product->slug) }}">
                                                    @if(!empty($product->photos))
                                                        @if (count(json_decode($product->photos))>0)
                                                            @if (file_exists(json_decode($product->photos)[0]))
                                                                    
                                                                <img class="pic-1 img-fit lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset(json_decode($product->photos)[0]) }}" alt="{{ __($product->name) }}">
                                                            @else
                                                                <img class="pic-1 img-fit lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}"  alt="{{ __($product->name) }}">
                                                                    
                                                            @endif
                                                            
                                                        @else
                                                        <img class="pic-1 img-fit lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}"  alt="{{ __($product->name) }}">

                                                        @endif
                                                    @else
                                                    <img class="pic-1 img-fit lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}"  alt="{{ __($product->name) }}">

                                                    @endif
                                                    {{-- <img class="pic-1"
                                                        src="https://electro.madrasthemes.com/wp-content/uploads/2016/03/WirelessSound-300x300.png"> --}}
                                                </a>
                                                {{-- @if (! $product->discount == 0)                                
                                                    <span class="product-discount-label">
                                                        {{ ($product->discount_type == 'amount')?'Rs.':'' }} {{ $product->discount }}{{ !($product->discount_type == 'amount')?' %':'' }}
                                                    </span>
                                                @endif --}}

                                            </div>
                                            
                            <div class="category-title mt-2">
                                <h6 class="title">
                                   <a href="{{ route('product', $product->slug) }}" class="">{{ __($product->name) }}</a>
                                </h6>
                                <div class="category">
                                   <a class="m-0">{{ $product->category->name }}</a>
                                </div>
                             </div>
                             
                             <div class="price-cart text-center py-2">
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
                                                        {{ ($product->discount_type == 'amount')?'  Rs.':'' }} -{{ intval(($product->discount)) }}{{ !($product->discount_type == 'amount')?' %':'' }}
                    
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
                                            {{-- @if (! $product->discount == 0)
                                                <div class="product-discount-label">
                                                    {{ ($product->discount_type == 'amount')?'Rs.':'' }} {{ $product->discount }}{{ !($product->discount_type == 'amount')?' %':'' }}
                                                </div>
                                            @endif --}}
                                            <a class="all-deals ico effect" onclick="showAddToCartModal({{ $product->id }})" data-toggle="tooltip" data-placement="right"
                                                title="Add to Cart"><i class="fa fa-shopping-cart icon"></i> </a>

                                        </div>
                                       @endif
                                    </div>
                                </div>
                            </div>
                            <div class="cart-compare">
                                <a class="all-deals effect gray" href="javasctipy:void(0);" onclick="addToWishList({{$product->id}})"
                                    ><i class="fa fa-heart icon mr-2"></i>Wishlist
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
                            <div class="products-pagination bg-white p-3">
                                <nav aria-label="Center aligned pagination">
                                    <ul class="pagination justify-content-center">
                                        {{ $products->links() }}
                                    </ul>
                                </nav>
                            </div>

                        <!-- </div> -->
                    </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

               <!-- Mobile Filter Pop Up -->
   <!-- Modal -->
    <div class="modal fade" id="leftsidebarfilter" tabindex="-1" role="dialog" aria-labelledby="leftsidebarfilterlabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="leftsidebarfilterlabel">
                    Filter Products 
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="left-side-wrapper px-4 py-4">
                        <!-- Content -->
                        <div class="card-wrapper mb-2">
                            <div class="card-group-item">
                                <div class="card-head">
                                    <div class="heading d-flex align-items-center text-center flex-wrap">
                                    <div class="head">
                                        <h5 class="text-uppercase pl-5 m-0">Categories</h5>
                                    </div>
                                    </div>
                                </div>
                                <div class="filter-content1">
                                    <div class="card-body p-3">
                                    <ul class="mb-0">
                                        @if(!isset($category_id) && !isset($category_id) && !isset($subcategory_id) && !isset($subsubcategory_id))
                                            @foreach(\App\Category::all() as $category)
                                                <li><div class="item"><a href="{{ route('products.category', $category->slug) }}" class="category-item py-1">{{ __($category->name) }}</a></div></li>
                                            @endforeach
                                        @endif
                                        @if(isset($category_id))
                                            <li><div class="item"><a href="{{ route('products') }}" class="active">{{__('All Categories')}}</a></div></li>
                                            <li><div class="item"><a href="{{ route('products.category', \App\Category::find($category_id)->slug) }}" class="active">{{ __(\App\Category::find($category_id)->name) }}</a></div></li>
                                            @foreach (\App\Category::find($category_id)->subcategories as $key2 => $subcategory)
                                                <li class="child"><div class="item"><a href="{{ route('products.subcategory', $subcategory->slug) }}">{{ __($subcategory->name) }}</a></div></li>
                                            @endforeach
                                        @endif
                                        @if(isset($subcategory_id))
                                            <li><div class="item"><a href="{{ route('products') }}" class="active">{{__('All Categories')}}</a></div></li>
                                            <li><div class="item"><a href="{{ route('products.category', \App\SubCategory::find($subcategory_id)->category->slug) }}" class="active">{{ __(\App\SubCategory::find($subcategory_id)->category->name) }}</a></div></li>
                                            <li><div class="item"><a href="{{ route('products.subcategory', \App\SubCategory::find($subcategory_id)->slug) }}" class="active">{{ __(\App\SubCategory::find($subcategory_id)->name) }}</a></div></li>
                                            @foreach (\App\SubCategory::find($subcategory_id)->subsubcategories as $key3 => $subsubcategory)
                                                <li class="child"><div class="item"><a href="{{ route('products.subsubcategory', $subsubcategory->slug) }}">{{ __($subsubcategory->name) }}</a></div></li>
                                            @endforeach
                                        @endif
                                        @if(isset($subsubcategory_id))
                                            <li><div class="item"><a href="{{ route('products') }}" class="active">{{__('All Categories')}}</a></div></li>
                                            <li><div class="item"><a href="{{ route('products.category', \App\SubsubCategory::find($subsubcategory_id)->subcategory->category->slug) }}" class="active">{{ __(\App\SubSubCategory::find($subsubcategory_id)->subcategory->category->name) }}</a></div></li>
                                            <li><div class="item"><a href="{{ route('products.subcategory', \App\SubsubCategory::find($subsubcategory_id)->subcategory->slug) }}" class="active">{{ __(\App\SubsubCategory::find($subsubcategory_id)->subcategory->name) }}</a></div></li>
                                            <li><div class="item"><a href="{{ route('products.subsubcategory', \App\SubsubCategory::find($subsubcategory_id)->slug) }}" class="current">{{ __(\App\SubsubCategory::find($subsubcategory_id)->name) }}</a></div></li>
                                        @endif

                                    </ul>
                                    </div>
                                    <!-- card-body.// -->
                                </div>
                            </div>
                            <!-- card-group-item.// -->
                        </div>
                        <!-- Content -->
                        {{-- <div class="card-wrapper mt-4 mb-2">
                            <div class="card-group-item">
                                <div class="card-head">
                                    <div class="heading d-flex align-items-center text-center flex-wrap">
                                    <div class="head">
                                        <h5 class="text-uppercase pl-5 m-0">Price Range</h5>
                                    </div>
                                    </div>
                                </div>
                                <div class="filter-content2">
                                    <div class="card-body">
                                        <div class="range-slider-wrapper mt-3">
                                            <!-- Range slider container -->
                                            <div id="input-slider-range" data-range-value-min="{{ filter_products(\App\Product::query())->get()->min('unit_price') }}" data-range-value-max="{{ filter_products(\App\Product::query())->get()->max('unit_price') }}"></div>

                                            <!-- Range slider values -->
                                            <div class="row">
                                                <div class="col-6">
                                                    <span class="range-slider-value value-low"
                                                        @if (isset($min_price))
                                                            data-range-value-low="{{ $min_price }}"
                                                        @elseif($products->min('unit_price') > 0)
                                                            data-range-value-low="{{ $products->min('unit_price') }}"
                                                        @else
                                                            data-range-value-low="0"
                                                        @endif
                                                        id="input-slider-range-value-low">
                                                </div>

                                                <div class="col-6 text-right">
                                                    <span class="range-slider-value value-high"
                                                        @if (isset($max_price))
                                                            data-range-value-high="{{ $max_price }}"
                                                        @elseif($products->max('unit_price') > 0)
                                                            data-range-value-high="{{ $products->max('unit_price') }}"
                                                        @else
                                                            data-range-value-high="0"
                                                        @endif
                                                        id="input-slider-range-value-high">
                                                </div>
                                            </div>
                                        </div>
                                        
                                            
                                            
                                    </div>
                                    <!-- card-body.// -->
                                </div>
                            </div>
                            <!-- card-group-item.// -->
                        </div> --}}
                        <!-- Content -->
                        @if (!empty($all_colors))
                            <div class="card-wrapper mb-2">
                                <div class="card-group-item">
                                    <div class="card-head">
                                        <div class="heading d-flex align-items-center text-center flex-wrap">
                                        <div class="head">
                                            <h5 class="text-uppercase pl-5 m-0">Choose Color</h5>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="colors_block px-3 py-2">
                                        <ul class="list-inline checkbox-color checkbox-color-circle mb-0">
                                            @foreach ($all_colors as $key => $color)
                                                <li>
                                                    <input type="radio" id="color-{{ $key }}" name="color" value="{{ $color }}" @if(isset($selected_color) && $selected_color == $color) checked @endif onchange="filter()">
                                                    <label style="background: {{ $color }};" for="color-{{ $key }}" data-toggle="tooltip" data-original-title="{{ \App\Color::where('code', $color)->first()->name }}"></label>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                                <!-- card-group-item.// -->
                            </div>
                        @endif
                        <!-- Content -->
                        {{-- @foreach ($attributes as $key => $attribute)
                        {{dd('hi')}}
                            @if (\App\Attribute::find($attribute['id']) != null)
                                <div class="card-wrapper mt-4 mb-2">
                                    <div class="card-group-item">
                                        <div class="card-head">
                                            <div
                                                class="heading d-flex align-items-center text-center flex-wrap">
                                                <div class="head">
                                                    <h6 class="text-capitalize m-0">Choose {{ \App\Attribute::find($attribute['id'])->name }}</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="colors_block px-3 py-2">
                                            @if(array_key_exists('values', $attribute))
                                                @foreach ($attribute['values'] as $key => $value)
                                                    @php
                                                        $flag = false;
                                                        if(isset($selected_attributes)){
                                                            foreach ($selected_attributes as $key => $selected_attribute) {
                                                                if($selected_attribute['id'] == $attribute['id']){
                                                                    if(in_array($value, $selected_attribute['values'])){
                                                                        $flag = true;
                                                                        break;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    @endphp
                                                    <div class="checkbox">
                                                        <input type="checkbox" id="attribute_{{ $attribute['id'] }}_value_{{ $value }}" name="attribute_{{ $attribute['id'] }}[]" value="{{ $value }}" @if ($flag) checked @endif onchange="filter()">
                                                        <label for="attribute_{{ $attribute['id'] }}_value_{{ $value }}">{{ $value }}</label>
                                                    </div>
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                    <!-- card-group-item.// -->
                                </div>
                            @endif
                        @foreach --}}
                    </div>
                </div>
                <!-- <div class="modal-footer">
                    </div> -->
            </div>
        </div>
    </div>
<!-- Mobile Filter Pop Up Ends -->

@endsection

@section('script')
    <script type="text/javascript">
        function filter(){
            $('#search-form').submit();
        }
        function rangefilter(arg){
            // console.log(arg[0]);
            $('input[name=min_price]').val(arg[0]);
            $('input[name=max_price]').val(arg[1]);
            filter();
        }
        // function ratefilter(rate){
        //     // console.log(rate[0],rate[1]);
        //     $('input[name=min_rating]').val(rate[0]);
        //     $('input[name=max_rating]').val(rate[1]);
        //     // console.log($('input[name=min_rating]').val(rate[0]));
        //     filter();
        // }
    </script>
@endsection
