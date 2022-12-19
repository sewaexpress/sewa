{{-- @if (\App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
    @php
        $array = array();
        foreach (\App\Seller::where('verification_status', 1)->get() as $key => $seller) {
            if($seller->user != null && $seller->user->shop != null){
                $total_sale = 0;
                foreach ($seller->user->products as $key => $product) {
                    $total_sale += $product->num_of_sale;
                }
                $array[$seller->id] = $total_sale;
            }
        }
        asort($array);
    @endphp
<!--============================================= VENDER START ======-->
  @if(!empty($array))
<section id="vendor-listing-wrapper" class="padding_defauld vender_home">
    <div class="container">
       <div class="row mb-4">
          <div class="col-md-12">
             <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == "Nepali")
                <h2 class="position-relative mb-0">हाम्रो शीर्ष विक्रेताहरू</h2>
                <a class="btn_view" href="#"> सबै विक्रेताहरू हेर्नुहोस् <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>

                @else
                <h2 class="position-relative mb-0">Our Top Vendors</h2>
                <a class="btn_view" href="#"> View All Vendors <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                @endif

             </div>
          </div>
       </div>
       <div class="row">
        @php
        $count = 0;
    @endphp
    @foreach ($array as $key => $value)
        @if ($count < 20)
            @php
                $count ++;
                $seller = \App\Seller::find($key);
                $total = 0;
                $rating = 0;
                foreach ($seller->user->products as $key => $seller_product) {
                    $total += $seller_product->reviews->count();
                    $rating += $seller_product->reviews->sum('rating');
                }
            @endphp
          <div class="col-xl-4 col-lg-4 col-md-6 col-12 mb-4">
             <a class="vender_item" href="{{ route('shop.visit', $seller->user->shop->slug) }}">
                <div class="vendor-wrap d-flex align-items-center">
                   <div class="image">
                    <img
                     src="@if ($seller->user->shop->logo !== null) {{ asset($seller->user->shop->logo) }} @else {{ asset('frontend/images/placeholder.jpg') }} @endif"
                     alt="{{ $seller->user->shop->name }}"
                     class="img-fluid lazyload"
                    >
                   </div>
                   <div class="vendor-content ml-3">
                      <label for="name" class="m-0 font-weight-bold">{{ __($seller->user->shop->name) }}</label>
                      <ul class="d-flex">
                        @if ($total > 0)
                            {{ renderStarRating($rating/$total) }}
                        @else
                            {{ renderStarRating(0) }}
                        @endif
                      </ul>
                   </div>
                </div>
             </a>
          </div>
         @endif
         @endforeach
          <!-- <div class="col-12 text-center mt-4">
                   <button type="button" class="btn-custom mx-auto">View More</button>
               </div> -->
       </div>

    </div>
</section>
 <!--============================================= VENDER END ======-->
 @endif
 @endif --}}


 
 @if (\App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
    @php
        $array = array();
        foreach (\App\Seller::where('verification_status', 1)->get() as $key => $seller) {
            if($seller->user != null && $seller->user->shop != null){
                $total_sale = 0;
                foreach ($seller->user->products as $key => $product) {
                    $total_sale += $product->num_of_sale;
                }
                $array[$seller->id] = $total_sale;
            }
        }

        asort($array);
    @endphp
    
<!--============================================= VENDER START ======-->

  @if(!empty($array))
<section id="product-listing-wrapper" class="product_listing">
    <div class="container">
        <div class="product-lists">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-12">
                        <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                            @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->name == "Nepali")
                            <h2 class="position-relative mb-0">हाम्रो शीर्ष विक्रेताहरू</h2>

                            @else
                            <h2 class="position-relative mb-0">Our Top Vendors</h2>

                            @endif

                        </div>
                    </div>
                </div>

                <div class="col-xl-12 mt-3">
                    <div class="slider_feature2">

                        @foreach ($array as $key => $value)
                                @php
                                    $seller = \App\Seller::find($key);
                                    $total = 0;
                                    $rating = 0;
                                    foreach ($seller->user->products as $key => $seller_product) {
                                        $total += $seller_product->reviews->count();
                                        $rating += $seller_product->reviews->sum('rating');
                                    }
                                @endphp
                                <div class="product-grid-item mb-3">
                                    <div class="product-grid-image mb-3" style="padding: 10px">
                                        <a href="{{ route('shop.visit', $seller->user->shop->slug) }}">
                                            @if (!empty($seller->user->shop->logo))
                                                @if (file_exists($seller->user->shop->logo))
                                                <img src="{{ asset($seller->user->shop->logo) }}" alt="{{ $seller->user->shop->name }}" class="img-fluid pic-1">
                                                @else
                                                <img src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ $seller->user->shop->name }}" class="img-fluid pic-1">
                                                    
                                                @endif
                                            @else
                                            <img src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ $seller->user->shop->name }}" class="img-fluid pic-1">
                                                
                                            @endif
                                        

                                        </a>
                                    </div>
                                    <div class="category-title d-flex justify-content-center">
                                        <a href="{{ route('shop.visit', $seller->user->shop->slug) }}">

                                        <h6 for="name" class="title">{{ __($seller->user->shop->name) }}</h6>
                                        </a>
                                            
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <ul class="d-flex">
                                            @if ($total > 0)
                                                {{ renderStarRating($rating/$total) }}
                                            @else
                                                {{ renderStarRating(0) }}
                                            @endif
                                        </ul>
                                    </div>
                                </div>
                        @endforeach
                    </20>
                </div>
            </div>
        </div>
    </div>
 </section>
 <!--============================================= VENDER END ======-->
 @endif
 @endif 