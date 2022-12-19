@foreach (\App\HomeCategory::where('status', 1)->get() as $key => $homeCategory)
   @if ($homeCategory->category != null)
      @if(\App\Product::where('published', 1)->where('category_id', $homeCategory->category->id)->where('current_stock','>',0)->count()>0)
         <section id="product-listing-wrapper" class="product_listing">
            <div class="container">
               <div class="product-lists">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="section_title_block d-flex justify-content-between align-item-center h-100">
                           <h2 class="position-relative mb-0">{{ __($homeCategory->category->name) }}</h2>
                           <a class="btn_view" href="{{ route('products.category', $homeCategory->category->slug) }}"> View all <span class="pl-2 "><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
                           </header>
                        </div>
                     </div>
                     <div class="col-xl-12">
                        <div class="slider_feature33">
                           @foreach (filter_products(\App\Product::where('published', 1)->where('category_id', $homeCategory->category->id))->latest()->limit(15)->get() as $key => $product)
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
                                             {{-- {{$product->discount}} --}}
                                             @if($qty > 0)
                                                <h6 class="m-0 gray text-left cus-price">{{ home_discounted_base_price($product->id) }}&nbsp;</h6>
                                                <div class="d-flex justify-content-between w-100 align-items-center">
                                                @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                      <span class="ml-0">{{ home_base_price($product->id) }}</span>&nbsp;&nbsp;
                                                @endif
                                                @if (! intval($product->discount,0) == 0)
                                                <div>
                                                      {{ ($product->discount_type == 'amount')?'  Rs.':'' }} -{{ intval(($product->discount),0) }}{{ !($product->discount_type == 'amount')?' %':'' }}
                                                </div>
                                                @endif
                                                </div>
                                             @endif
                                             @if($qty <= 0) 
                                                <div class="d-flex w-100 mt-2">
                                                <div class="stock mr-1">
                                                      Out of Stock
                                                </div>
                                                </div>
                                             @endif
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
               </div>
            </div>
         </section>
      @endif
   @endif
@endforeach