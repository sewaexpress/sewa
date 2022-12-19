@extends('frontend.layouts.app')

@section('content')
<section id="breadcrumb_item" class="pb-0 breadcrumb mb-0">
    <div class="container">
       <div class="row">
          <div class="col-md-12 m-auto">
             <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                   <li class="breadcrumb-item font-weight-bold">
                      <a href="/"><span><i class="fa fa-home" aria-hidden="true"></i></span>
                      HOME</a>
                   </li>
                   <li class="breadcrumb-item font-weight-bold" aria-current="page">
                      <a href="" class="text-dark">
                      Wishlist</a>
                   </li>
                  
                </ol>
             </nav>
          </div>
       </div>
    </div>
 </section>
    <section class="gry-bg py-4 profile">
        <section class="gry-bg py-4 profile">
        <div class="container">
            <div class="row cols-xs-space cols-sm-space cols-md-space">
                <div class="col-lg-3 d-none d-lg-block">
                    @if(Auth::user()->user_type == 'seller')
                        @include('frontend.inc.seller_side_nav')
                    @elseif(Auth::user()->user_type == 'customer')
                        @include('frontend.inc.customer_side_nav')
                    @endif
                </div>

                <div class="col-lg-9">
                    <div class="main-content">
                        <!-- Page title -->
                        <div class="page-title">
                            <div class="row align-items-center">
                                <div class="col-md-6 col-12">
                                    <h2 class="heading heading-6 text-capitalize strong-600 mb-0">
                                        {{__('Wishlist')}}
                                    </h2>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="float-md-right">
                                        <ul class="breadcrumb">
                                            <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                                            <li><a href="{{ route('dashboard') }}">{{__('Dashboard')}}</a></li>
                                            <li class="active"><a href="{{ route('wishlists.index') }}">{{__('Wishlist')}}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Wishlist items -->

                        <div class="row shop-default-wrapper shop-cards-wrapper shop-tech-wrapper mt-4">
                            @foreach ($wishlists as $key => $wishlist)
                                @if ($wishlist->product != null)
                                    <div class="col-xl-4 col-6" id="wishlist_{{ $wishlist->id }}">
                                        <div class="card card-product mb-3 product-card-2">
                                            <div class="card-body p-3">
                                                <div class="card-image">
                                                    <a href="{{ route('product', $wishlist->product->slug) }}" class="d-block">
                                                        @if ($wishlist->product->thumbnail_img != '')
                                                            @if (file_exists($wishlist->product->thumbnail_img))
                                                                <img style="width: 100%;object-fit: contain;" src="{{ asset($wishlist->product->thumbnail_img) }}" alt="{{ __($wishlist->product->name) }}" class="img-fluid img lazyload">
                                                            @else
                                                                <img style="width: 100%;object-fit: contain;" src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ __($wishlist->product->name) }}" class="img-fluid img lazyload">
                                                            @endif
                                                        @else
                                                            <img style="width: 100%;object-fit: contain;" src="{{ asset('frontend/images/placeholder.jpg') }}" alt="{{ __($wishlist->product->name) }}" class="img-fluid img lazyload">
                                                        @endif
                                                    </a>
                                                </div>

                                                <h2 class="heading heading-6 strong-600 mt-2 text-truncate-2 d-flex justify-content-between">
                                                    <a href="{{ route('product', $wishlist->product->slug) }}">{{ $wishlist->product->name }}</a> <span>       <a href="#" class="link link--style-3" data-toggle="tooltip" data-placement="top" title="Remove from wishlist" onclick="removeFromWishlist({{ $wishlist->id }})">
                                                                <i class="la la-trash dashboard-wishlist-trash"></i>
                                                            </a></span>
                                                </h2>
                                                <div class="star-rating star-rating-sm mb-1">
                                                    {{ renderStarRating($wishlist->product->rating) }}
                                                </div>
                                                <div class="mt-2">
                                                    <div class="price-box">
                                                        @if(home_base_price($wishlist->product->id) != home_discounted_base_price($wishlist->product->id))
                                                            <del class="old-product-price strong-400">{{ home_base_price($wishlist->product->id) }}</del>
                                                        @endif
                                                        <span class="product-price strong-600">{{ home_discounted_base_price($wishlist->product->id) }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-footer p-3">
                                                <div class="product-buttons">
                                                    <div class="row align-items-center">
                                                        <div class="col-8 mx-auto">
                                                                <button type="button" class="btn btn-block btn-base-1 btn-circle btn-icon-left dashboard-wishlist-cart-btn" onclick="showAddToCartModal({{ $wishlist->product->id }})">
                                                                    <i class="la la-shopping-cart mr-2"></i>{{__('Add to cart')}}
                                                                </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            @endforeach
                        </div>

                        <div class="pagination-wrapper py-4">
                            <ul class="pagination justify-content-end">
                                {{ $wishlists->links() }}
                            </ul>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </section>

     <!-- Breadcrumbs -->
   {{-- <section id="breadcrumb-wrapper" class="position-relative">
    <div class="image">
       <img src="frontend/assets/images/banner/1.jpg" alt="breadcrumb-image" class="img-fluid">
    </div>
    <div class="overlay position-absolute">
       <div class="title p-lg-4 p-md-3 p-3">
          <!-- <a class="mr-3" href="index.html">Home</a>
                                                                   <a class="mr-3" href="product-details.html">Product Detail</a> -->
          <ol class="breadcrumb p-0 bg-transparent p-0 m-0">
             <li class="breadcrumb-item">
                <a href="{{ route('home') }}">Home</a>
             </li>
             <li class="breadcrumb-item">
                <a href="{{ route('wishlists.index') }}">Wishlist</a>
             </li>
          </ol>
       </div>
    </div>
 </section> --}}
 <!-- Breadcrumbs Ends -->
 {{-- <section id="cart-wrapper" class="py-3">
    <div class="container">
       <div class="row py-xl-5 py-md-3 py-0">
          <div class="col-xl-3 col-lg-4 col-12 mb-xl-0 mb-lg-0 mb-3">
            @if(Auth::user()->user_type == 'seller')
            @include('frontend.inc.seller_side_nav')
        @elseif(Auth::user()->user_type == 'customer')
            @include('frontend.inc.customer_side_nav')
        @endif
          </div>
          <div class="col-xl-9 col-lg-8 col-md-12 col-12 " style="background: white;">
             <div class="profile-side-detail-edit">
                <div class="dashboard-content d-flex align-items-center h-100">
                   <div class="shopping-cart">
                      <div class="shopping-cart-table">
                         <div class="table-responsive-lg">
                            <table class="table">
                               <thead>
                                  <tr>
                                     <th class="th_size">Image</th>
                                     <th class="th_size">Product Name</th>
                                     <th class="th_size">Quantity</th>
                                     <th class="th_size">Total</th>
                                     <th class="remove_block_last">Remove</th>
                                     <th class="th_size"></th>

                                  </tr>
                               </thead>
                               <!-- /thead -->
                               <tbody>
                                @foreach ($wishlists as $key => $wishlist)
                                @if ($wishlist->product != null)
                                  <tr>
                                     <td class="text-center">
                                        <a class="img_men_cart" href="{{ route('product', $wishlist->product->slug) }}">
                                           <img
                                              src={{ asset(json_decode($wishlist->product->photos)[0]) }}
                                              class="img-fluid"
                                              alt="{{ __($wishlist->product->name) }}"
                                              >
                                        </a>
                                     </td>
                                     <td class="text-center">
                                        {{ $wishlist->product->name }}
                                     </td>
                                     <td class="text-center">
                                        <div class="input_b m-auto">
                                           <b onclick="decreaseValue()" value="Decrease Value" class="minus_b">-</b>
                                           <input type="number" id="numbers" value="0" class="count_b disabled="
                                              name=" qty">
                                           <b class="plus_b " onclick="increaseValue()" value="Increase Value">+</b>
                                        </div>
                                     </td>
                                     <td class="text-center">
                                        @if(home_base_price($wishlist->product->id) != home_discounted_base_price($wishlist->product->id))
                                        <del class="cart-grand-total-price">{{ home_base_price($wishlist->product->id) }}</del>
                                    @endif
                                    <span class="cart-grand-total-price">{{ home_discounted_base_price($wishlist->product->id) }}</span>
                                      
                                     </td>

                                     <td class="text-center"><a href="#" title="cancel" class="icon"><i
                                              class="fa fa-trash-o"></i></a>
                                     </td>
                                     <td class="text-center">
                                        <button onclick="showAddToCartModal({{ $wishlist->product->id }})" class="btn-custom rounded-0">Add to Cart</button>
                                     </td>

                                  </tr>
                                
                                @endif
                                @endforeach
                              
                               </tbody>
                               <!-- /tbody -->
                            </table>

                         </div>
                      </div>

                   </div>
                </div>
             </div>
          </div>
       </div>
    </div>
 </section>

    <div class="modal fade" id="addToCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-zoom product-modal" id="modal-size" role="document">
            <div class="modal-content position-relative">
                <div class="c-preloader">
                    <i class="fa fa-spin fa-spinner"></i>
                </div>
                <button type="button" class="close absolute-close-btn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div id="addToCart-modal-body">

                </div>
            </div>
        </div>
    </div> --}}

@endsection

@section('script')
    <script type="text/javascript">
        function removeFromWishlist(id){
            $.post('{{ route('wishlists.remove') }}',{_token:'{{ csrf_token() }}', id:id}, function(data){
                $('#wishlist').html(data);
                $('#wishlist_'+id).hide();
                showFrontendAlert('success', 'Item has been renoved from wishlist');
            })
        }
    </script>
@endsection
