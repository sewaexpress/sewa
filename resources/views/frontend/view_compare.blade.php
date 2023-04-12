@extends('frontend.layouts.app')

@section('content')
    {{-- <section id="breadcrumb-wrapper" class="position-relative">
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
    </section> --}}
    <!-- Breadcrumbs Ends -->
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
                        <a href="#" class="text-dark">
                            Compare</a>
                    </li>
                    
                    </ol>
                </nav>
            </div>
        </div>
        </div>
    </section>
    
    <section id="compare" class="py-3" style="background-color: white;">
        <div class="container">
            <div class="text-right">
                <a href="{{ route('compare.reset') }}" style="text-decoration: none;" class="btn btn-link btn-base-5 btn-sm font-weight-bold">{{__('Reset Compare List')}}</a>
            </div>
           <div class="row py-xl-5 py-md-3 py-0">
  <style>
    .compare-card{
        border: 3px solid #258aff;
        border-radius: 20px;
        box-shadow: 0px 1px 4px #258aff;
    }
  </style>
              <div class="col-md-12 compare-card m-auto">
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
                                            
                                            @php
                                            $filepath = $product->featured_img;
                                        @endphp
                                            <tr class='lext-left'>
                                                <td class="cart-image text-left text-dark">
                                                    <strong>Image</strong>
                                                </td>
                                                @foreach (Session::get('compare') as $key => $item)                                                 
                                                @php
                                                    $product = \App\Product::find($item);
                                                    $filepath = $product->featured_img;
                                                @endphp
                                                    <td class="cart-image text-left text-dark">
                                                        <a class="entry-thumbnail text-left" href="{{ route('product', $product->slug) }}">   

                                                        @if (!empty($product->thumbnail_img) && $product->thumbnail_img != 'null' && file_exists($product->thumbnail_img))
                                                            <img class="pic-1 img-fit lazyload" src="{{ asset($product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                                                        @else   
                                                            @if (!empty($product->photos) && count(json_decode($product->photos)) > 0 && file_exists(json_decode($product->photos)[0]))
                                                                <img class="pic-1 img-fit lazyload" src="{{ asset(json_decode($product->photos)[0]) }}" alt="{{ __($product->name) }}">
                                                            @else           
                                                                @if(!empty($filepath))
                                                                    @if (file_exists(public_path($filepath)))
                                                                        <img src="{{ asset($filepath) }}" alt="{{ $product->name }}" alt="{{ $product->name }}" class="img-fluid pic-1">
                                                                    @else
                                                                        <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $product->name }}" alt="{{ $product->name }}" class="img-fluid pic-1">
                                                                    @endif
                                                                @else
                                                                    <img src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ $product->name }}" data-src="{{ asset('uploads/No_Image.jpg') }}" class="img-fluid pic-1">
                                                                @endif
                                                            @endif
                                                        @endif

                                                        {{-- @else <img class="pic-1 img-fit lazyload" src="{{ asset('uploads/No_Image.jpg') }}"  alt="{{ __($product->name) }}"> --}}
                                                        {{-- @endif --}}
                                                    {{-- @else                                                        
                                                        @if (!empty($product->photos))
                                                            @if (count(json_decode($product->photos)) > 0)
                                                                @if (file_exists(json_decode($product->photos)[0]))
                                                                    <img class="pic-1 img-fit lazyload" src="{{ asset(json_decode($product->photos)[0]) }}" alt="{{ __($product->name) }}">
                                                                @else
                                                                    <img class="pic-1 img-fit lazyload" src="{{ asset('uploads/No_Image.jpg') }}"  alt="{{ __($product->name) }}">
                                                                @endif
                                                            @else
                                                                <img class="pic-1 img-fit lazyload" src="{{ asset('uploads/No_Image.jpg') }}"  alt="{{ __($product->name) }}">
                                                            @endif
                                                        @else
                                                            <img class="pic-1 img-fit lazyload" src="{{ asset('uploads/No_Image.jpg') }}"  alt="{{ __($product->name) }}">
                                                        @endif
                                                        <img class="pic-1 img-fit lazyload" src="{{ asset('uploads/No_Image.jpg') }}" alt="{{ __($product->name) }}">
                                                    @endif --}}

                                                        {{-- @php
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
                                                        @endif --}}
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
                                                            -
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
                                                <td class="cart-image text-left text-dark">
                                                    <strong> Colors Available</strong>
                                                </td>
                                                
                                                @foreach (Session::get('compare') as $key => $item)
                                                    <td class="cart-image text-left text-dark">
                                                            @php
                                                                $product = \App\Product::find($item);
                                                                $colors = json_decode($product->color_images);
                                                            @endphp
                                                            @if (!empty($colors))
                                                                @foreach ($colors as $item)  
                                                                    <?php echo $item->name; ?>
                                                                    <label class="radio m-0" style="background: {{ $item->code }};" >
                                                                        <input type="radio" disabled>
                                                                        <span style="background:{{$item->code}}; border:{{$item->code}}"></span> 
                                                                    </label>
                                                                    <br>
                                                                @endforeach   
                                                            @else
                                                                No Variations Available                                                     
                                                            @endif   
                                                    </td>    
                                                @endforeach
                                                {{-- @foreach (Session::get('compare') as $key => $item)
                                                    @php
                                                        $product = \App\Product::find($item);
                                                        $colors = json_decode($product->color_images);
                                                    @endphp

                                                    @if (!empty($colors))
                                                        @foreach ($colors as $item)
                                                            <td class="cart-image text-left text-dark">
                                                                <label class="radio m-0" style="background: {{ $item->code }};" >
                                                                    <input type="radio" disabled>
                                                                    <span style="background:{{$item->code}}; border:{{$item->code}}"></span> 
                                                                </label>
                                                            </td>                                                            
                                                        @endforeach                                                        
                                                    @endif
                                                @endforeach --}}
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
