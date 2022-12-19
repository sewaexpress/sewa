@extends('frontend.layouts.app')

@section('content')
@php
    // $b = 'a & b /d ,g';
    // $a = (preg_replace('/[^A-Za-z0-9\-]/', ' ', $b));
    // $c = preg_replace('!\s+!', ' ', $a);
    // $d = str_replace(' ','-',$c);
    // dd($d);
    // $string = str_replace(' ','-',strtolower(trim($b)));
    
    // dd();
    //                 dd(preg_replace('/[^A-Za-z0-9\-]/', '', $string));
@endphp
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col">
                <ul class="breadcrumb">
                    <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                    <li><a href="{{ route('flash-deals') }}">{{__('Flash Deals')}}</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
@foreach ($flash_deals as $flash_deal)
    
@if($flash_deal != null && strtotime(date('d-m-Y')) >= $flash_deal->start_date && strtotime(date('d-m-Y')) <= $flash_deal->end_date)
    
<section id="product-listing-wrapper" class=" product_listing">
    <div class="container">
    <div class="product-lists">
    <div class="row">
       <div class="col-12">
          <div class="col-12">
             <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == "Nepali")
                 <h2 class="position-relative mb-0">{{$flash_deal->title}}</h2>
                 <div class="flash-deal-box float-left d-flex">
                    Sale Ends in : <div class="countdown countdown--style-1 countdown--style-1-v1 " data-countdown-date="{{ date('m/d/Y', $flash_deal->end_date) }}" data-countdown-label="show"></div>
                 </div>
                 <a class="btn_view" href="{{ route('flash-deals') }}"> सबै हेर्नुहोस् <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                @else
                 <h2 class="position-relative mb-0">{{$flash_deal->title}}</h2>
                 <div class="flash-deal-box float-left d-flex">
                    Sale Ends in : <div class="countdown countdown--style-1 countdown--style-1-v1 " data-countdown-date="{{ date('m/d/Y', $flash_deal->end_date) }}" data-countdown-label="show"></div>
                 </div>
                 <a class="btn_view" href="{{ route('flash-deals') }}"> 
                    
                </a>
                @endif
             </div>
          </div>
          <div class="col-12">
             <div class="grid-container  flash_feature">
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
    </div>
 </section>
@endif
@endforeach

@endsection
