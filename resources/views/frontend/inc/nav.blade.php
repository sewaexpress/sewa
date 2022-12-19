<style>
   .dropdown-custom-category .dropdown-menu {
       position: relative !important;
       transform: unset !important;
       max-height: 300px;
       overflow-y: scroll;
       border: 0;
       box-shadow: rgb(237 237 237) 0px 8px 24px;
       width: 100%;
       margin-bottom: 10px;

   }

   .dropdown-custom-category .dropdown-menu .nav .nav-item {
       text-align: left;
   }

   .dropdown-custom-category .dropdown-menu .nav .nav-link {
       font-size: 0.7rem;
       color: #767676 !important;
       padding:0px;
   }

   .dropdown-custom-category .dropdown-menu .nav {
       padding: 5px 0px;
   }
   .error {
  background: red;
  padding: 10px 15px;
  color: white;
  display: none;
}
</style>
@php
    
   //  dd(Session::get('cart'));
@endphp
<header class="section-header top-header-bg d-md-block d-none">
    <div class="container px-0">
       <div class="top-header d-flex justify-content-between align-items-center">
          <div class="marque">
             <marquee behavior="" direction="Left" class="text-white">Connecting your Daily Life</marquee>
          </div>
          <div class="top-social-icon">
             <ul class="mb-0">
                <!-- Button trigger modal -->
                <li class="d-flex align-items-center top_head_right">
                  <a href="{{route('shops.create')}}" class="mr-2 text-light" >
                     Sell on Sewa Express
                  </a>
                  {{-- <button type="button" data-toggle="modal" data-target="#currency" style="background: transparent; border:none; color:white;">
                     Currency Converter
                  </button> --}}
                  
                   <div class="dropdown user_login_mobile">
                      <button
                         class="text-light btn_account pb-0 btn bg-transparent dropdown-toggle pt-0 font-weight-normal "
                         type="button" data-toggle="dropdown">
                         Track Your Order

                         <span class="caret"></span>
                      </button>
                      <ul class="my_account dropdown-menu pl-3 ">
                         <div class="input_track_blo d-flex flex-column pb-2">
                            <label><small class="font-weight-bold">Track Your Order</small></label>
                            <form class="" action="{{ route('orders.track') }}" method="GET" enctype="multipart/form-data">

                            <div class="track_input_btn d-flex">

                               <input name="order_code" type="text" class="form-control" placeholder="Enter order id" />
                               <button type="submit" class="btn_custom_go">Go</button>    
                            </div>

                           </form>

                         </div>
                      </ul>
                   </div>
                   <!-- user login start  -->
                   <div class="dropdown user_login_mobile">
                      <button
                         class="text-light btn_account pb-0 btn bg-transparent dropdown-toggle pt-0 font-weight-normal "
                         type="button" data-toggle="dropdown">
                         <i class="fa fa-user-o" aria-hidden="true"></i> 
                         @auth
                         {{Auth::user()->name}}
                         @else
                         My Account
                         @endauth
                         <span class="caret"></span>
                      </button>
                      <ul class="my_account dropdown-menu pl-3">
                          @auth
                          <li>
                            <a href="{{ route('dashboard') }}" class="font-weight-normal"><span class="pr-2"><i class="fa fa-user"
                                     aria-hidden="true"></i></span>
                               My Panel</a>
                         </li>
                         <li>
                            <a href="{{ route('logout') }}" class="font-weight-normal"><span class="pr-2"><i class="fa fa-user"
                                     aria-hidden="true"></i></span>
                               Logout</a>
                         </li>
                         @else
                         <li>
                            <a href="{{ route('user.login') }}" class="font-weight-normal"><span class="pr-2"><i class="fa fa-user"
                                     aria-hidden="true"></i></span>
                               Login</a>
                         </li>
                         <li>
                            <a href="{{ route('user.registration') }}" class="font-weight-normal"><span class="pr-2"><i
                                     class="fa fa-sign-in" aria-hidden="true"></i></span>Sign Up</a>
                         </li>
                         @endif
                      </ul>
                   </div>
                   <div class="dropdown ml-2" id="lang-change">
                     @php
                         if(Session::has('locale')){
                             $locale = Session::get('locale', Config::get('app.locale'));
                         }
                         else{
                             $locale = 'en';
                         }
                     @endphp
                     <a href="" class="dropdown-toggle top-bar-item" data-toggle="dropdown" style="color:white">
                        {{$locale}}
                         {{-- <img src="{{ asset('frontend/images/placeholder.jpg') }}" height="11" data-src="{{ asset('frontend/images/icons/flags/'.$locale.'.png') }}" class="flag lazyload text-light" alt="{{ \App\Language::where('code', $locale)->first()->name }}" height="11"> --}}
                         {{-- <span class="language">{{ \App\Language::where('code', $locale)->first()->name }}</span> --}}
                     </a>
                     <ul class="dropdown-menu">
                         @foreach (\App\Language::all() as $key => $language)
                             <li class="dropdown-item text-light @if($locale == $language) active @endif">
                                 <a href="#" data-flag="{{ $language->code }}">
                                    {{-- <img src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset('frontend/images/icons/flags/'.$language->code.'.png') }}" class="flag lazyload" alt="{{ $language->name }}" height="11"> --}}
                                    <span class="language ml-1">{{ $language->name }}</span></a>
                             </li>
                         @endforeach
                     </ul>
                  </div>
                   <!-- cart modal start  -->
                   <!-- Modal -->
                   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                      aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                         <div class="modal-content">
                            <div class="modal-header">
                               <h5 class="modal-title text-dark font-weight-bold" id="exampleModalLabel">
                                  My Cart
                               </h5>
                               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">×</span>
                               </button>
                            </div>
                            <div class="modal-body mb-0 pb-0">
                               <div class="table-responsive px-md-3">
                                  <table class="table text-center mb-0">
                                     <tbody class="">
                                        <tr class="d-flex align-items-center">
                                           <td class="cart_img">
                                              <div>
                                                 <img
                                                    src="https://montechbd.com/shopist/demo/public/uploads/1619869340-h-250-tv2.png"
                                                    alt="image" />
                                              </div>
                                           </td>
                                           <td>
                                              <h5>Blue Diamond Almonds</h5>
                                              <h6>Rs233</h6>
                                           </td>
                                           <td>
                                              <a href="" class="gray_title"><i class="fa fa-trash-o"
                                                    aria-hidden="true"></i></a>
                                           </td>
                                        </tr>

                                     </tbody>
                                  </table>
                               </div>
                            </div>
                            <div class="modal-footer d-flex flex-column align-items-end">
                               <div class="cart_top_total">
                                  <h6 class="text-dark mr-1">Total Rs233</h6>
                               </div>
                               <div class="top_cartmodal_btn d-flex justify-content-between align-items-center w-100">
                                  <a href="cart.html" class="them_btn_new btn_cart_modal">View Cart</a>
                                  <a href="checkout.html" class="them_btn_new btn_cart_modal">Proceed Checkout</a>
                               </div>
                            </div>
                         </div>
                      </div>
                   </div>
                   <!-- cart modal end  -->
                   <!-- Popup Search Modal -->
                   <!-- Modal -->
                   <!-- Popup Search Modal Ends-->
                   <!-- search modal end  -->
                   <!-- search header end  -->
                </li>
             </ul>
          </div>
       </div>
    </div>
</header>
<div class="nav_bar header-sticky" style="background-color: white;">
   <div class="container pl-0 ">
      <div class="row">
         <div class="col-md-3">
            <a class="navbar-brand text-dark font-weight-bold" href="{{ route('home') }}">
               @php
               $generalsetting = \App\GeneralSetting::first();
               @endphp
               @if($generalsetting->logo != null)
                  <img src="{{ asset($generalsetting->logo) }}" class="img-fluid" alt="{{ env('APP_NAME') }}">
               @else
                  <img src="{{ asset('frontend/images/logo/logo.png') }}"  class="img-fluid" alt="{{ env('APP_NAME') }}">
               @endif
            </a>
         </div>

         <div class="col-md-6">
            <div class="search_men d-none d-md-block">
               <form class="form-inline search_top justify-content-between" action="{{ route('search') }}" method="GET">
                  <input class="form-control border-0 search_input" type="search" aria-label="Search" id="search" name="q" placeholder="Search {{(Session::get('key'))?'for '.implode(',',array_slice(explode(',',Session::get('key')), -3)):''}}" autocomplete="off"/>
                  {{-- array_slice(explode(',',Session::get('key')), -3) --}}
                  {{-- <div class="search_select border-0">
                     <select name="category" class="border-0 search_select_content px-2">
                        <option value="">
                           All Categories
                        </option>
                        @foreach (\App\Category::all() as $key => $category)
                        <option class="level-0" value="{{ $category->slug }}"
                           @isset($category_id)
                               @if ($category_id == $category->id)
                                   selected
                               @endif
                           @endisset>
                           {{ __($category->name) }}
                        </option>
                        @endforeach
                     </select>
                  </div> --}}
                  <div class="search_icon_top text-center">
                    <button type="submit" class="search_icon text-dark" style="display:contents"><i class="fa fa-search"></i></button>
                  </div>
                  <div class="typed-search-box d-none">
                     <div class="search-preloader">
                         <div class="loader"><div></div><div></div><div></div></div>
                     </div>
                     <div class="search-nothing d-none">

                     </div>
                     <div id="search-content">

                     </div>
                 </div>
               </form>
            </div>
         </div>
         <div class="col-md-2 ml-auto">
            <ul class="cart_top_list d-flex justify-content-around mb-0 h-100 align-items-center ">

               <li>
                  <a href="{{ route('compare') }}" class="position-relative">
                     {{-- <sub class='sub_block'>1</sub> --}}
                     <img data-toggle="tooltip" data-placement="top" title="" data-original-title="Compare"
                        src="{{asset('./frontend/assets/images/logo/compare.svg')}}" class="img-fluid" alt="" />
                        @if(Session::has('compare'))
                        <sup class="sub_block" id="compare_items_sidenav">{{ count(Session::get('compare'))}}</sup>
                     @else
                        <sup class="sub_block" id="compare_items_sidenav">0</sup>
                  @endif
                     </a>
               </li>
               <li>
                  <a href="{{ route('wishlists.index') }}" class="position-relative">
                     {{-- <sub class='sub_block'>0</sub> --}}
                     <img data-toggle="tooltip" data-placement="top" title=""
                        data-original-title="Wishlist" src="{{asset('./frontend/assets/images/logo/wishlist.svg')}}"
                        class="img-fluid" alt="" />
                        @if(Auth::check())
                        <sup class="sub_block">{{ count(Auth::user()->wishlists)}}</sup>
                     @else
                        <sup class="sub_block">0</sup>
                        @endif
                     </a>
               </li>
               <div class="d-none d-lg-inline-block" data-hover="dropdown">
                  <div class="nav-cart-box dropdown" id="cart_items">
                      <a href="" class="nav-box-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <!-- <i class="fa fa-shopping-cart text-dark"></i> -->
                          <img data-toggle="tooltip" data-placement="top" title="Cart" src="{{asset('frontend/assets/images/logo/cart.svg')}}" alt="cart-logo" class="img-fluid img_sag">
                          {{-- <span class="nav-box-text d-none d-xl-inline-block">{{__('Cart')}}</span> --}}
                          @if(Session::has('cart'))
                              <sup class="nav-box-number sub_block">{{ count(Session::get('cart'))}}</sup>
                          @else
                              <sup class="nav-box-number sub_block">0</sup>
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
                                                         $product_count = \App\Product::where('id',$cartItem['id'])->count();
                                                      @endphp
                                                      @if ($product_count > 0)
                                                         @php                                                          
                                                            $product = \App\Product::find($cartItem['id']);
                                                            $total = $total + $cartItem['price']*$cartItem['quantity'];
                                                         @endphp
                                                         
                                                         <td class="img_header_cart">
                                                            <div>
                                                               <a href="{{ route('product', $product->slug) }}">
                                                                  @if (file_exists($product->featured_img)) 
                                                                     <img src="{{ asset($product->featured_img) }}" data-src="{{ asset($product->featured_img) }}" alt="{{ __($product->name) }}">
                                                                  @else
                                                                     <img src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ __($product->name) }}">
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
                                                      @endif
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
                  </div>
              </div>
            </ul>
         </div>
      </div>
   </div>
   <!-- Button trigger modal -->
   <div class="mobile-menu d-lg-none d-md-block mr-4 position-absolute" data-toggle="modal"
      data-target="#rightsidebarfilter">
      <span><i class="fa fa-bars fa-2x text-light" aria-hidden="true"></i></span>
   </div>
   <!-- Button trigger modal -->

   <!-- mobile search start  -->
   <div class="search_mobile_men  d-block d-md-none">
      <button class="search_icon_new" type="submit">
         <i class="fa fa-search"></i>
      </button>

      <div class="sub_search">
         <form action="{{ route('search') }}" method="GET" class="d-flex">
            <input class="input_box" type="text" aria-label="Search" id="search_mob" name="q" placeholder="Search..." autocomplete="off"/>
            <button class="search_top" type="submit">
               <i class="fa fa-search" aria-hidden="true"></i>
            </button>
         </form>
         <div class="type-search-box d-none">
            <div class="search-preloader">
                <div class="loader">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div class="search-nothing d-none">
            </div>
            <div id="mob_search-content">
            </div>
        </div>
      </div>
   </div>
   <!-- search mobile new end  -->
   @if ((request()->segment(1)) == '')
      
   <section class="d-lg-block d-none">
      <div class="container p-0">
         <div class="row no-gutters">
            <div class="col-2 d-md-block d-none" id="categories-list">
               <div class="category_title_top d-flex justify-content-between theme_bg" data-toggle="collapse"
                  href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                  <div class="category_title">
                     <h5 class="mb-0">All Categories</h5>
                  </div>
                  {{-- <div class="category_btn">
                     
                  </div> --}}
               </div>
               <ul class="dropdown-menu multi-level category-list bg-white border_one position-absolute w-100 collapse p-0 m-0"
                  role="menu" aria-labelledby="dropdownMenu" id="collapseExample">
                  @foreach (\App\Category::all()->take(11) as $key => $category)
                    @php
                        $brands = array();
                    @endphp
                  <li class="dropdown-submenu" data-id="{{ $category->id }}">
                     <a href="{{ route('products.category', $category->slug) }}" class="dropdown-item category_icon_img d-flex justify-content-between" tabindex="-1" href="#">
                        <div class="category_icon_img">
                            @if($category->icon != '')
                                @if(file_exists($category->icon))
                                    <img src="{{ $category->icon }}" class="img-fluid" alt=""> <span class="name">
                                @else
                                    <img src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid" alt=""> <span class="name">
                                @endif
                                
                                {{-- <img class="cat-image lazyload" src="{{ $category->icon }}" data-src="{{ asset($category->icon) }}" width="30" alt="{{ __($category->name) }}"> --}}
                            @else
                            <img src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid" alt=""> <span class="name">
                                {{-- <img class="cat-image" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($category->icon) }}" width="30" alt="{{ __($category->name) }}"> --}}

                            @endif
                           
                            {{ __($category->name) }}
                           </span>
                        </div>
                        <div class="icon_show_category">
                           <i class="fa fa-angle-right" aria-hidden="true"></i>
                        </div>
                     </a>
                     @if(count($category->subcategories)>0)
                        <ul class="dropdown-menu multi-level sub-category">
                            @foreach ($category->subcategories as $sub)
                                <li class="dropdown-submenu">
                                    <a class="dropdown-item category_icon_img d-flex justify-content-between" tabindex="-1"
                                        href="{{ route('products.subcategory', $sub->slug) }}">
                                        <div class="category_icon_img">
                                            {{-- <img src="frontend/assets/images/cart.svg" class="img-fluid" alt="">  --}}
                                            <span class="name">
                                                {{$sub->name}}
                                            </span>
                                        </div>
                                        <div class="icon_show_category">
                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                        </div>
                                    </a>
                                    
                                    @if(count($sub->subsubcategories)>0)
                                        <ul class="dropdown-menu multi-level">
                                            @foreach($sub->subsubcategories as $subsub)
                                                <li class="dropdown-submenu"> <a
                                                    class="dropdown-item category_icon_img d-flex justify-content-between" tabindex="-1"
                                                    href="{{ route('products.subsubcategory', $subsub->slug) }}">
                                                    <div class="category_icon_img">
                                                        {{-- <img src="frontend/assets/images/cart.svg" class="img-fluid" alt="">  --}}
                                                        <span class="name">
                                                            {{$subsub->name}}
                                                        </span>
                                                    </div>
                                                    <div class="icon_show_category">
                                                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                    </div>
                                                    </a>
                                            
                                                </li>
                                            @endforeach
                                        </ul>
                                    @endif
                                </li>     
                            @endforeach
                        </ul>
                     @endif
                  </li>
                    @endforeach
                    <li class="dropdown-submenu">
                        <a href="{{ route('categories.all') }}" class="dropdown-item category_icon_img d-flex justify-content-between">
                            <div class="category_icon_img">
                                {{-- <img src="{{ asset('frontend/images/placeholder.jpg') }}" class="img-fluid" alt=""> <span class="name"> --}}
                                    <i class="fa fa-category" aria-hidden="true"></i>
                                    View All
                               </span>
                            </div>
                         </a>
                        
                    </li>
               </ul>
            </div>
            <div class="col-10">
               <ul class="categories-nav d-flex justify-content-around align-items-center h-100">
                @foreach(\App\Category::where('top',1)->orderBy('digital','asc')->limit(6)->get() as $top)
                <li>
                    <a href="{{ route('products.category', $top->slug) }}" class="category_title_top">{{$top->name}}</a>

                </li>
                @endforeach

               </ul>
            </div>
         </div>
      </div>
   </section>
   @endif
</div>



<!-- Mobile Nav -->
<div class="modal fade" id="rightsidebarfilter" tabindex="-1" role="dialog" aria-labelledby="rightsidebarfilterlabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
      <div class="modal-content h-100">
         <div class="modal-header px-3 py-3 align-items-center">
            <div class="cart-Track Your Order">
               <div class="image">
                  <a class="navbar-brand" href="{{ route('home') }}">
                     <!-- <img src="frontend/assets/images/logo/logo.png" alt="navigation-logo" class="img-fluid"> -->
                     @if($generalsetting->logo != null)
                        <img src="{{ asset($generalsetting->logo) }}" class="img-fluid" alt="{{ env('APP_NAME') }}">
                     @else
                        <img src="{{ asset('frontend/images/logo/logo.png') }}"  class="img-fluid" alt="{{ env('APP_NAME') }}">
                     @endif
                  </a>
               </div>
            </div>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <style>
            .navbar-nav .nav-link{
               border-bottom: 0px;
            }
         </style>
         <div class="modal-body d-flex justify-content-between h-100 px-4">
            <ul class="navbar-nav w-100">
               <li class="nav-item d-flex align-items-center">
                  <a class="nav-link active" href="{{ route('home') }}">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>
                     Home
                     <span class="mx-2"><i class="fa fa-home" aria-hidden="true"></i></span>
                  </a>
               </li>
               <li class="nav-item d-flex align-items-center">
                  <a class="nav-link add-on" data-target="#nav-cart" href="{{ route('cart') }}">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>My Cart
                     <span class="mx-2"><i class="fa fa-shopping-bag" aria-hidden="true"></i></span>
                     @if(Session::has('cart'))
                        <sup class="sub_block" id="cart_items_sidenav">{{ count(Session::get('cart'))}}</sup>
                     @else
                        <sup class="sub_block" id="cart_items_sidenav">0</sup>
                     @endif
                  </a>
               </li>

               <li class="nav-item d-flex align-items-center">
                  <a class="nav-link add-on" href="{{route('wishlists.index')}}" data-target="#nav-cart">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>Wishlist
                     <span class="mx-2"><i class="fa fa-heart" aria-hidden="true"></i></span>
                     @if(Auth::check())
                        <span class="sub_block">{{ count(Auth::user()->wishlists)}}</span>
                     @else
                        <span class="sub_block">0</span>
                     @endif
                  </a>
              </li>
               <li class="nav-item d-flex align-items-center">
                  <a href="{{ route('compare') }}" class="nav-link add-on" data-target="#nav-cart">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>Compare
                     <span class="mx-2"><i class="fa fa-refresh" aria-hidden="true"></i></span>
                     @if(Session::has('compare'))
                        <sup class="sub_block" id="compare_items_sidenav">{{ count(Session::get('compare'))}}</sup>
                     @else
                        <sup class="sub_block" id="compare_items_sidenav">0</sup>
                     @endif
                  </a>
               </li>
               <li class="dropdown-custom-category">
                  <a class="nav-link dropdown-toggle" href="" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>Category
                     <span class="mx-2"><i class="fa fa-angle-down" aria-hidden="true"></i></span>
                  </a>
                  <div class="dropdown-menu">
                      <div class="container d-block">
                          <div class="row">
                              <div class="col-md-12">
                                  <ul class="nav flex-column p-0" style="line-height: 2;">
                                      @foreach (\App\Category::all() as $key => $category)
                                      <li class=" p-0">
                                          <a class="nav-link head" data-toggle="collapse" href=".collapse{{$category->id}}" role="button" aria-expanded="false" aria-controls="collapseExample"> 
                                             <span><i class="fa fa-minus"></i></span> {{$category->name}}
                                          </a>
                                          <div class="collapse collapse{{$category->id}}">
                                              @foreach($category->subcategories as $subcategory)
                                              <a class=" p-0">
                                                  <a class="nav-link head" data-toggle="collapse1" href="{{ url('/') }}/search?subcategory={{ $subcategory->slug }}" role="button" aria-expanded="false" aria-controls="collapseExample" style="color: rgb(72, 77, 103); padding-left: 15px;"> <span><i class="fa fa-minus"></i></span> {{$subcategory->name}}</a>
                                                  <div class="collapse collapse1 collapse{{$subcategory->id}}">
                                                      @foreach($subcategory->subsubcategories as $subsubcategory)
                                                      <a class=" p-0">
                                                          <a class="nav-link" href="{{ url('/') }}/search?subsubcategory={{ $subsubcategory->slug }}" style="color: rgb(72, 77, 103); padding-left: 45px;">{{$subsubcategory->name}}</a>
                                                      </a>
                                                      @endforeach
                                                  </div>
                                              </a>
                                              @endforeach
                                          </div>
                                      </li>
                                      @endforeach

                                  </ul>
                              </div>

                              <!-- /.col-md-12  -->
                          </div>
                      </div>
                      <!--  /.container  -->
                  </div>
              </li>
               @auth
                  <li class="nav-item d-flex align-items-center">
                     <a href="{{ route('purchase_history.index') }}" class="nav-link add-on" data-target="#nav-cart">
                        <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>Purchase History
                        <span class="mx-2"><i class="fa fa-file-text" aria-hidden="true"></i></span>
                  </a>
                  </li>

                  <li class="nav-item d-flex align-items-center">
                     <a href="{{ route('profile') }}" class="nav-link add-on" data-target="#nav-cart">
                        <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>Manage Profile
                        <span class="mx-2"><i class="fa fa-user" aria-hidden="true"></i></span>
                     </a>
                  </li>
              
                  @if (\App\BusinessSetting::where('type', 'wallet_system')->first()->value == 1)
                     <li class="nav-item d-flex align-items-center">
                           <a href="{{ route('wallet.index') }}" class="nav-link add-on" data-target="#nav-cart">
                              <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>My Wallet
                              <span class="mx-2"><i class="fa fa-dollar" aria-hidden="true"></i></span>
                           </a>
                     </li>
                  @endif

                  @if (Auth::user()->seller)       
                     <li class="nav-item d-flex align-items-center">
                           <a href="{{ route('seller.products') }}" class="nav-link add-on" data-target="#nav-cart">
                              <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>{{__('Products')}}
                              <span class="mx-2"><i class="la la-diamond" aria-hidden="true"></i></span>
                           </a>
                     </li>  
                     @php
                        $orders = DB::table('orders')
                                    ->orderBy('code', 'desc')
                                    ->join('order_details', 'orders.id', '=', 'order_details.order_id')
                                    ->where('order_details.seller_id', Auth::user()->id)
                                    ->where('orders.viewed', 0)
                                    ->select('orders.id')
                                    ->distinct()
                                    ->count();
                     @endphp    
                     <li class="nav-item d-flex align-items-center">
                           <a href="{{ route('orders.index') }}" class="nav-link add-on" data-target="#nav-cart">
                              <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>
                              {{__('Orders')}} @if($orders > 0)<span class="ml-2" style="color:green"><strong>({{ $orders }} {{ __('New') }})</strong></span></span>@endif
                              <span class="mx-2"><i class="la la-file-text" aria-hidden="true"></i></span>
                           </a>
                     </li>   
                     @php
                                 $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
                     @endphp    
                     @if ($refund_request_addon != null && $refund_request_addon->activated == 1)
                        <li class="nav-item d-flex align-items-center">
                              <a href="{{ route('vendor_refund_request') }}" class="nav-link add-on" data-target="#nav-cart">
                                 <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>
                                 {{__('Recieved Refund Request')}}
                                 <span class="mx-2"><i class="la la-file-text" aria-hidden="true"></i></span>
                              </a>
                        </li>       
                        <li class="nav-item d-flex align-items-center">
                              <a href="{{ route('customer_refund_request') }}" class="nav-link add-on" data-target="#nav-cart">
                                 <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>
                                 {{__('Sent Refund Request')}}
                                 <span class="mx-2"><i class="la la-file-text" aria-hidden="true"></i></span>
                              </a>
                        </li>
                     @endif 
                     <li class="nav-item d-flex align-items-center">
                           <a href="{{ route('shops.index') }}" class="nav-link add-on" data-target="#nav-cart">
                              <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>
                              {{__('Shop Setting')}}
                              <span class="mx-2"><i class="la la-file-text" aria-hidden="true"></i></span>
                           </a>
                     </li>                                            
                  @endif
               @endauth
               @auth
               {{-- @if(\App\BusinessSetting::where('type', 'classified_product')->first()->value == 1)
               <li class="nav-item d-flex align-items-center">
                   <a class="nav-link add-on" data-target="#nav-cart" href="{{ route('customer_products.index') }}">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>{{__('Classified Products')}}
                     <span class="mx-2"><i class="la la-diamond" aria-hidden="true"></i></span>
                   </a>
               </li>
               @endif --}}
               @endauth
               @auth
               <li class="nav-item d-flex align-items-center">
                   <a data-target="#nav-cart" href="{{ route('support_ticket.index') }}" class="nav-link add-on {{ areActiveRoutesHome(['support_ticket.index', 'support_ticket.show'])}}">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>{{__('Support Ticket')}}
                     <span class="mx-2"><i class="la la-support" aria-hidden="true"></i></span>
                   </a>
               </li>
               @endauth
               {{-- <li class="nav-item d-flex align-items-center">
                  <a class="nav-link add-on" data-toggle="modal" data-target="#nav-cart">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>Track
                     Your Order
                     <span class="mx-2"><i class="fa fa-heart-o" aria-hidden="true"></i></span>
                     <sup class="cart-items text-white">2</sup>
                  </a>
               </li>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="" role="button" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast"
                           aria-hidden="true"></i></span>Products<span class="ml-1">
                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                     </span>
                  </a>
                  <div class="dropdown-menu">
                     <div class="container d-block">
                        <div class="row">
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       29</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       27</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       39</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       4</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       2</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       3</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       4</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                        </div>
                     </div>
                     <!--  /.container  -->
                  </div>
               </li>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="" role="button" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast"
                           aria-hidden="true"></i></span>Category<span class="ml-1">
                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                     </span>
                  </a>
                  <div class="dropdown-menu">
                     <div class="container d-block">
                        <div class="row">
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       29</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       27</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       39</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       4</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       2</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       3</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       4</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                        </div>
                     </div>
                     <!--  /.container  -->
                  </div>
               </li>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="" role="button" data-toggle="dropdown"
                     aria-haspopup="true" aria-expanded="false">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>
                     Recipes<span class="ml-1">
                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                     </span>
                  </a>
                  <div class="dropdown-menu">
                     <div class="container d-block">
                        <div class="row">
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       29</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       27</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       39</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       4</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       2</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       3</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                           <div class="col-md-12">
                              <ul class="nav flex-column">
                                 <li class="nav-item">
                                    <a class="nav-link head font-weight-bold" href="under-construction.html">Heading
                                       4</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 1</a>
                                 </li>
                                 <li class="nav-item p-0">
                                    <a class="nav-link" href="under-construction.html">Item 2</a>
                                 </li>
                              </ul>
                           </div>
                           <!-- /.col-md-12  -->
                        </div>
                     </div>
                     <!--  /.container  -->
                  </div>
               </li> 
               <li class="nav-item">
                  <a class="nav-link" href="contact-us.html">
                     <span class="nav-indication mr-2"><i class="fa fa-eercast" aria-hidden="true"></i></span>
                     Contact Us</a>
               </li> --}}
            </ul>
         </div>
         <div class="modal-footer py-3">
            @auth
               <a class="w-50 text-center" href="{{route('dashboard')}}">
                  <span class="mr-2"><i class="fa fa-sign-in" aria-hidden="true"></i></span>Dashboard</a>
               <a class="w-50 text-center" href="{{route('logout')}}">
                  <span class="mr-2"><i class="fa fa-paper-plane" aria-hidden="true"></i></span>Logout</a>
            @else
               <a class="w-50 text-center" href="{{route('user.login')}}">
                  <span class="mr-2"><i class="fa fa-sign-in" aria-hidden="true"></i></span>Login</a>
               <a class="w-50 text-center" href="{{route('user.registration')}}">
                  <span class="mr-2"><i class="fa fa-paper-plane" aria-hidden="true"></i></span>Register</a>
            @endauth
         </div>
      </div>
   </div>
</div>
<!-- Mobile Nav -->
 <!--======================================================= HEADER END ======-->

 @php
   // $currency="https://api.exchangerate.host/latest";
   

   // $json_data = file_get_contents($currency);
   // $response_data = json_decode($json_data);
   // dd($response_data);
//    $req_url = 'https://api.exchangerate.host/latest';
// $response_json = file_get_contents($req_url);
// if(false !== $response_json) {
//     try {
//         $response = json_decode($response_json);
//         if($response->success === true) {
//             var_dump($response);
//         }
//     } catch(Exception $e) {
//         // Handle JSON parse error...
//     }
// }  

@endphp
  <!-- Modal -->
{{-- <div class="modal fade" id="currency" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <h5 class="modal-title" id="exampleModalLabel">Currency Converter</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
           <span aria-hidden="true">&times;</span>
         </button>
       </div>
       <div class="modal-body">
         <div class="container">
            <div class="row">
              <div class="col-md-12 col-md-offset-3">
                <div class="panel panel-primary text-center">
                  <div class="error">
                    Please enter numeric value
                  </div>
                  <div class="row">
                  <div class="panel-body col-md-12">
                    <form class="form-vertical">
          
                      <div class="form-group center">
                        <label for="">Enter Value:</label>
                        <input type="number" class="amount form-control" placeholder="Enter value" min="1">
                      </div>
                      <div class="row">
                      <div class="col-md-6">
                        <div class="form-group inline-block">
                           <label for="">From currency:</label>
                           <select class="currency-list form-control" onclick="exchangeCurrency()">
                              <option>--Select--</option>
                           @foreach ($response_data->rates as $key => $value) {
                             <option value="{{$value}}">{{$key}}</option>
                           @endforeach
                           </select>
                         </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group inline-block">
                           <label>To currency:</label>
                           <select class="currency-list form-control" onclick="exchangeCurrency()">
                             <option>--Select--</option>
                             @foreach ($response_data->rates as $key => $value) {
                              <option value="{{$value}}">{{$key}}</option>
                            @endforeach

                           </select>
                         </div>
                      </div>
                     </div>
                    </form>
                    <div class="form-group center">
                     <label for="">Result:</label>
                     
                     <p class="results">0</p>
                   </div>
                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
       </div>

     </div>
   </div>
</div> --}}


