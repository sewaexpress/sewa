@extends('frontend.layouts.app')

@section('content')
    <section id="breadcrumb-wrapper" class="position-relative">
        <div class="image">
            <img src="{{asset('frontend/assets/images/banner/1.jpg')}}" alt="breadcrumb-image" class="img-fluid">
        </div>
        <div class="overlay position-absolute">
            <div class="title p-4">
                <ol class="breadcrumb p-0 bg-transparent p-0 m-0">
                    <li class="breadcrumb-item">
                        <a href="{{ route('home') }}">Home</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="#">Compare</a>
                    </li>
                </ol>
            </div>
        </div>
    </section>
    <!-- Breadcrumbs Ends -->
    
    <section id="compare" class="py-3" style="background-color: white;">
        <div class="container">
            <div class="text-right">
                <a href="{{ route('compare.reset') }}" style="text-decoration: none;" class="btn btn-link btn-base-5 btn-sm font-weight-bold">{{__('Reset Compare List')}}</a>
            </div>
           <div class="row py-xl-5 py-md-3 py-0">
  
              <div class="col-md-10 m-auto">
                 <div class="profile-side-detail-edit">
                    <div class="dashboard-content d-flex align-items-center h-100">
                       <div class="shopping-cart">
                          <div class="shopping-cart-table">
                            @if(Session::has('compare'))
                                @if(count(Session::get('compare')) > 0)
                                    <div class="table-responsive-lg">
                                        <table class="table">
                                        <thead>
                                            <tr class='lext-left'>
                                                <th class="cart-description item text-left font-weight-bold text-primary">Name</th>
                                                @foreach (Session::get('compare') as $key => $item)
                                                    @php
                                                        $product = \App\Product::find($item);
                                                    @endphp
                                                    <th class="cart-product-name item text-left font-weight-bold">
                                                        <a href="{{ route('product', $product->slug) }}">{{ $product->name }}</a>
                                                    </th>
                                                @endforeach
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class='lext-left'>
                                                <td class="cart-image text-left text-dark">
                                                    <strong>Image</strong>
                                                </td>
                                                @foreach (Session::get('compare') as $key => $item)
                                                    <td class="cart-image text-left text-dark">
                                                        <a class="entry-thumbnail text-left" href="{{ route('product', $product->slug) }}">                                                        
                                                        @php
                                                            $product = \App\Product::find($item);
                                                            $filepath = $product->featured_img;
                                                        @endphp
                                                        @if(isset($filepath))
                                                            @if (file_exists(public_path($filepath)))
                                                                <img src="{{ asset($product->featured_img) }}" alt="{{ $product->name }}" alt="{{ $product->name }}" class="img-fluid pic-1">
                                                            @else
                                                                <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $product->name }}" alt="{{ $product->name }}" class="img-fluid pic-1">
                                                            @endif
                                                        @else
                                                            <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $product->name }}" data-src="{{ asset('uploads/No_Image.jpg') }}" class="img-fluid pic-1">
                                                        @endif
                                                        {{-- <img src="{{ asset(json_decode($product->photos)[0]) }}" alt="{{ $product->name }}" class="img-fluid"> --}}
                                                    </td>
                                                @endforeach
                                            </tr>
                                            <tr class='lext-left'>
                                                <td class="cart-image text-left text-dark">
                                                    <strong> Price</strong>
                                                </td>
                                                @foreach (Session::get('compare') as $key => $item)
                                                    @php
                                                        $product = \App\Product::find($item);
                                                    @endphp
                                                    <td class="cart-image text-left text-dark">{{ single_price($product->unit_price) }}</td>
                                                @endforeach
                                                {{-- <td class="cart-image text-left">
                                                    Rs900.00
                                                </td>
                                                <td class="cart-image text-left">
                                                    Rs900.00
                                                </td> --}}
                                            </tr>
                                            <tr class='lext-left'>
                                                <td class="cart-image text-left text-dark">
                                                    <strong> Brand</strong>
                                                </td>
                                                @foreach (Session::get('compare') as $key => $item)
                                                    @php
                                                        $product = \App\Product::find($item);
                                                    @endphp
                                                    <td class="cart-image text-left text-dark" >
                                                        @if ($product->brand != null)
                                                            {{ $product->brand->name }}
                                                        @else
                                                            Empty
                                                        @endif
                                                    </td>
                                                @endforeach
                                                {{-- <td class="cart-image text-left">
                                                    SMC
                                                </td>
                                                <td class="cart-image text-left">
                                                    SMC
                                                </td> --}}
                                            </tr>
                                            <tr class='lext-left'>
                                                <td class="cart-image text-left text-dark">
                                                    <strong>Category</strong>
                                                </td>
                                                @foreach (Session::get('compare') as $key => $item)
                                                    @php
                                                        $product = \App\Product::find($item);
                                                    @endphp
                                                    <td class="cart-image text-left text-dark">
                                                        @if ($product->subsubcategory != null)
                                                            {{ $product->subsubcategory->name }}
                                                        @elseif ($product->subcategory != null)
                                                            {{ $product->subcategory->name }}
                                                        @elseif ($product->category != null)
                                                            {{ $product->category->name }}
                                                        @endif
                                                        {{-- @else
                                                        Empty --}}
                                                    </td>
                                                @endforeach
                                                {{-- <td class="cart-image text-left">
                                                    Green Tea
                                                </td>
                                                <td class="cart-image text-left">
                                                    Green Tea
                                                </td> --}}
                                            </tr>
                                            <tr class='lext-left'>
                                                <td class="cart-image text-left text-dark">
                                                    <strong> Description</strong>
                                                </td>
                                                @foreach (Session::get('compare') as $key => $item)
                                                    @php
                                                        $product = \App\Product::find($item);
                                                    @endphp
                                                    <td class="cart-image text-left text-dark"><?php echo $product->description; ?></td>
                                                @endforeach
                                                {{-- <td class="cart-image text-left">
                                                    In publishing and graphic design, Lorem ipsum is a placeholder text commonly
                                                    used to demonstrate the visual form of a document or a typeface without
                                                </td>
                                                <td class="cart-image text-left">
                                                    In publishing and graphic design, Lorem ipsum is a placeholder text commonly
                                                    used to demonstrate the visual form of a document or a typeface without
                                                </td> --}}
                                            </tr>
                                            <tr class='lext-left'>
                                                <td class="cart-image text-left"></td>
                                                @foreach (Session::get('compare') as $key => $item)
                                                    @php
                                                        $product = \App\Product::find($item);
                                                    @endphp
                                                    <td class="cart-image text-left">
                                                        <button type="button" class="btn-custom" onclick="showAddToCartModal({{ $item }})">
                                                            {{-- <i class="icon ion-android-cart"></i> --}}
                                                            {{__('Add to cart')}}
                                                        </button>
                                                    </td>
                                                @endforeach
                                                {{-- <td class="cart-image text-left" colspan="2">
                                                    <button type="button" class="btn-custom">Add to Cart</button>
                                                </td>
                                                <td class="cart-image text-left" colspan="2">
                                                    <button type="button" class="btn-custom">Add to Cart</button>
                                                </td> --}}
        
                                            </tr>
        
                                        </tbody>
                                        <!-- /tbody -->
                                        </table>
        
                                    </div>
                                @endif
                            @else
                                <div class="table-responsive-lg">
                                    <table class="table">
                                    Your Comparison list is empty
                                    </table>
    
                                </div>
                            @endif
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
    </div>

@endsection
