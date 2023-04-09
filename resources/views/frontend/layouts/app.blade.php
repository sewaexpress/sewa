<!DOCTYPE html>
@if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->rtl == 1)
<html dir="rtl" lang="en">
@else
<html lang="en">
@endif
<head>

    @php
    $seosetting = \App\SeoSetting::first();
    @endphp

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="index, follow">
    <title>@yield('meta_title', config('app.name', 'Laravel'))</title>
    <meta name="description" content="@yield('meta_description', $seosetting->description)" />
    <meta name="keywords" content="@yield('meta_keywords', $seosetting->keyword)">
    <meta name="author" content="{{ $seosetting->author }}">
    <meta name="sitemap_link" content="{{ $seosetting->sitemap_link }}">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <meta http-equiv="Content-Security-Policy" content="block-all-mixed-content">

    @yield('meta')

    @if(!isset($detailedProduct))
        <!-- Schema.org markup for Google+ -->
        <meta itemprop="name" content="{{ config('app.name', 'Laravel') }}">
        <meta itemprop="description" content="{{ $seosetting->description }}">
        <meta itemprop="image" content="{{ asset(\App\GeneralSetting::first()->logo) }}">
        <meta name="twitter:card" content="product">
        <meta name="twitter:site" content="@publisher_handle">
        <meta name="twitter:title" content="{{ config('app.name', 'Laravel') }}">
        <meta name="twitter:description" content="{{ $seosetting->description }}">
        <meta name="twitter:creator" content="@author_handle">
        <meta name="twitter:image" content="{{ asset(\App\GeneralSetting::first()->logo) }}">
        <meta property="og:title" content="{{ config('app.name', 'Laravel') }}" />
        <meta property="og:type" content="Ecommerce Site" />
        <meta property="og:url" content="{{ route('home') }}" />
        <meta property="og:image" content="{{ asset(\App\GeneralSetting::first()->logo) }}" />
        <meta property="og:description" content="{{ $seosetting->description }}" />
        <meta property="og:site_name" content="{{ env('APP_NAME') }}" />
    @endif

    <link type="image/x-icon" href="{{ asset(\App\GeneralSetting::first()->favicon) }}" rel="shortcut icon" />
    <link rel="stylesheet" href="{{ asset('frontend/assets/bootstrap-4.3.1/css/bootstrap.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/css/font-awesome.min.css') }}" type="text/css" media="none" onload="if(media!='all')media='all'">
    <link rel="stylesheet" href="{{ asset('frontend/assets/slick/slick.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/assets/slick/slick-theme.css') }}" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&family=Readex+Pro:wght@200&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/style.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/responsive.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/css/dashboard.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/css/dashboard-responsive.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/css/dashboard-two.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/style2.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/assets/countdown/css/flipclock.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/assets/swiper/drift-basic.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/assets/swiper/swiper.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('frontend/css/line-awesome.min.css') }}" type="text/css" media="none" onload="if(media!='all')media='all'">
    <link type="text/css" href="{{ asset('frontend/css/bootstrap-tagsinput.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
    <link type="text/css" href="{{ asset('frontend/css/jodit.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
    <link type="text/css" href="{{ asset('frontend/css/sweetalert2.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
    <link type="text/css" href="{{ asset('frontend/css/xzoom.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
    <link type="text/css" href="{{ asset('frontend/css/jssocials.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
    <link type="text/css" href="{{ asset('frontend/css/jssocials-theme-flat.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
    <link type="text/css" href="{{ asset('frontend/css/intlTelInput.min.css') }}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
    <link type="text/css" href="{{ asset('css/spectrum.min.css')}}" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
    <link type="text/css" href="{{ asset('frontend/css/active-shop.min.css') }}" rel="stylesheet" media="all">
    <link type="text/css" href="{{ asset('frontend/css/main.min.css') }}" rel="stylesheet" media="all">

    @if(\App\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->rtl == 1)
        <link type="text/css" href="{{ asset('frontend/css/active.rtl.css') }}" rel="stylesheet" media="all">
    @endif
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-8CNX9CMZQE"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'G-8CNX9CMZQE');
    </script>   

  <noscript><img height="1" width="1" style="display:none"
    src="https://www.facebook.com/tr?id=518595586902025&ev=PageView&noscript=1"
  /></noscript>
<style>
    .multi-level{
        min-height: 70vh!important;
    }
    section#category_section{
        margin-bottom: 0!important;
    }
    section#productlist .grid-item {
        margin: 3px!important;
    /* box-shadow: 0 0 2px 0 rgb(1 1 1 / 30%); */
        /* border: 0.5px solid rgb(1 1 1 / 8%); */
    }
    section#productlist .product-grid-item .product-grid-image img {
        width: 100%!important;
        object-fit: contain!important;
    }
    section#category_section{
        margin-bottom: 0!important;
    }
    .pb-15{
        padding-bottom: 15px!important;
    }
    .min-height-20{
        min-height: 20px!important;
    }
    .d-table-cell .btn-styled::before{
        background: #258aff !important;

    }
    .d-table-cell .btn-styled::hover{
        color: #ffffff!important;
    }
    .total-amount-seller{
        background: #f78035;
    }
    .title{
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 200px;
    }
    /* preloader */
    #loading {
        position: fixed;
        width: 100%;
        height: 100vh;
        background: #fff;
        background-size: 50px;
        background-repeat: no-repeat;
        background-position: center;
        z-index: 99999;
        background-image: url('{{asset("frontend/preloader/2.gif")}}');
        background-color: #f7f7f7;

    }
    .hidden{
        display: none;
    }
    .custom-close {
    position: absolute;
    right: 25px;
    }
    .height-100vh{
        height: 100vh;
        object-fit: contain;
    }
    #loading div img {
        max-height: 100px;
        min-height: 100px;
        object-fit: contain;
        object-position: center;
    }
    .fa-search{
        color: white;
    }
    .category_title_top{
        margin: auto;
    }
    .cus-price{
        color: #ff6300!important;
        font-size: 20px!important;
    }
    #search-content .title{
        width: 100%;
        text-align: center;
    }
    #search-content li{
        text-align: center;
    }
    .slider_feature .product-grid-item{
        margin: 2px;
    }

    .product-grid-item .category-title .category a{
        color: rgb(74 67 67) !important;
    }
    .product-grid-item .category-title .title a{
        color: #ff6707 !important;
    }
    .img-responsive {
        max-width: 100;
        height: auto;
    }

    .swiper-container {
        width: 100%;
        height: 300px;
        margin-left: auto;
        margin-right: auto;
    }

    .swiper-slide {
        background-size: cover;
        background-position: center;
    }

    .gallery-top {
        height: 80%;
        width: 100%;
    }

    .gallery-thumbs {
        height: 20%;
        box-sizing: border-box;
        padding: 10px 0;
    }

    .gallery-thumbs .swiper-slide {
        width: 25%;
        height: 100%;
        opacity: 0.4;
    }

    .gallery-thumbs .swiper-slide-thumb-active {
        opacity: 1;
    }

    /* Swiper Slider Ends */

    .product-carousel .swiper-button-next.swiper-button-white,
    .product-carousel .swiper-button-prev.swiper-button-white {
        color: white;
        background-color: var(--theme_color);
    }
    .xzoom-preview{
        z-index: 99999;
    }
    .xzoom-source{
        z-index: 99999;
    }
    /* mobile smart search */
    .type-search-box {
        position: absolute;
        top: 100%;
        border: 1px solid #eceff1;
        box-shadow: 0 5px 25px 0 rgba(123, 123, 123, 0.15);
        background: #fff;
        width: 100%;
        height: auto;
        transition: all 0.3s;
        -webkit-transition: all 0.3s;
        -ms-webkit-transition: all 0.3s;
        min-height: 200px;
        z-index: 999999;
        margin-left: -24px;
    }

    .type-search-box .search-preloader {
        position: absolute;
        top: 0;
        left: 0;
        height: 100%;
        width: 100%;
        z-index: 1;
    }

    .type-search-box .search-preloader .loader {
        position: absolute;
        top: 0px;
        left: 50%;
        transform: translateX(-18px);
        -webkit-transform: translateX(-18px);
    }

    .type-search-box .search-nothing {
        position: absolute;
        top: 50%;
        left: 0;
        transform: translateY(-50%);
        -webkit-transform: translateY(-50%);
        font-size: 15px;
        text-align: center;
        width: 100%;
        padding: 5px 20px;
    }

    .type-search-box .title {
        background: #ddd;
        font-size: 10px;
        text-align: right;
        opacity: 0.5;
        padding: 3px 15px 4px;
        text-transform: uppercase;
        line-height: 1;
        width: 100%;
    }

    .type-search-box ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .type-search-box ul a {
        display: block;
        padding: 5px 15px;
        color: #525252;
    }

    .type-search-box ul a:hover {
        background: #f7f7f7;
    }

    .type-search-box .search-product .image {
        width: 50px;
        min-width: 50px;
        background-color: #ffffff;
        background-size: cover;
        height: 50px;
        background-position: center;
    }

    .type-search-box .product a {
        padding: 8px 15px;
    }

    .type-search-box .search-product .product-name {
        margin-bottom: 5px;
        font-size: 13px;
        font-weight: 600;
        margin-left: 20px;
    }

    .type-search-box .search-product .price-box {
        margin-left: 20px;
    }
</style>
</head>
@php
// dd(session()->get('cart'));
@endphp

<body onload="myFunction()">

    {{-- @php
        echo '<pre>';
        dd(Auth::check());
        echo '</pre>';
    @endphp --}}
    <div id="loading">
        <div class="d-flex justify-content-center align-items-center h-75"> <img src="{{asset('frontend/preloader/logo.jpg')}}" alt=""></div>
    </div>
    @php
        $generalsetting = \App\GeneralSetting::first();
    @endphp
    @if ($generalsetting->pop_status == 1 && isset($page) && $page == 'index')
    @php
    $popUpStatus = 1;
    if (!session('modal_shown')) {
        session(['modal_shown' => true]);
        $popUpStatus = 0;
    }
    // $popUpStatus = session('popUpStatus');
    // if(!$popUpStatus != 1){
    //     session(['popUpStatus' => 1]);
    //     $popUpStatus = 1;
    // }

    @endphp
        {{-- @if($popUpStatus == 0) --}}
            <div class="modal fade coming-soon-modal" id="abc" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="z-index: 99999;">    
                <div class="modal-dialog modal-lg" role="document" style="max-width: 600px">
                    <div class="modal-content">
                        <div class="p-0 modal-header w-100">
                            <button style="    z-index: 9;
                            background: #ff00008a;
                            padding: 0px 5px 0 5px;
                            top: 7px;" type="button" class="close m-0 custom-close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body p-0">
                            
                            <a href="{{($generalsetting->pop_url)}}">
                                <img src="{{asset($generalsetting->pop_img)}}" class="w-100  pop-up-modal-image">
                                {{-- height-100vh --}}
                            </a>
                        </div>


                    </div>
                </div>
            </div>
        {{-- @endif --}}
    @endif
    <!-- MAIN WRAPPER -->
    <div class="body-wrap shop-default shop-cards shop-tech">

        <!-- Header -->
        @include('frontend.inc.nav')

        @yield('content')

        @include('frontend.inc.footer')

        @include('frontend.partials.modal')

                {{-- @if (\App\BusinessSetting::where('type', 'facebook_chat')->first()->value == 1)
                    <div id="fb-root"></div>
                    <!-- Your customer chat code -->
                    <div id="fb-customer-chat" class="fb-customerchat"
                    attribution=setup_tool
                    page_id="442591509240170">
                    </div>
                @endif --}}
                {{-- <script>
                    var chatbox = document.getElementById('fb-customer-chat');
                    chatbox.setAttribute("page_id", "PAGE-ID");
                    chatbox.setAttribute("attribution", "biz_inbox");
                  </script> --}}
                  <!-- Your SDK code -->
                {{-- <script>
                    window.fbAsyncInit = function() {
                    FB.init({
                        xfbml            : true,
                    });
                    };
            
                    (function(d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s); js.id = id;
                    js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
                    fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));
                </script> --}}
                <div class="modal fade" id="addToCart">
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
            </div>
        </div>


    </div><!-- END: body-wrap -->

    <div class="modal fade otp-input-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
              <div class="modal-content">
                <div class="row" style="text-align: center">
                    <div class="col-md-12 title">
                        Verify OTP
                      </div>
                    <form class="col-md-12 otp-form" action="{{route('verify.otp')}}" method="post" id="form">
                        @csrf
                        <div class="code-input">
                            <input required type="number" maxlength="1" pattern="[0-9]*" class="code-input__digit">
                            <input required type="number" maxlength="1" pattern="[0-9]*" class="code-input__digit">
                            <input required type="number" maxlength="1" pattern="[0-9]*" class="code-input__digit">
                            <input required type="number" maxlength="1" pattern="[0-9]*" class="code-input__digit">
                            <input required type="number" maxlength="1" pattern="[0-9]*" class="code-input__digit">
                            <input required type="hidden" name="otp" id="code" />
                        </div>
                        <button type="submit" class="btn btn-success submit-otp" style="background:var(--theme_color);margin-bottom:15px;">Submit</button>
                    </form>
                    <div class="col-md-12">
                        <a class="resend-otp">Resend OTP Mail</a>
                      </div>

                </div>
              </div>
            </div>
          </div>
    <div class="modal fade" id="GuestCheckout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-zoom" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">{{ __('Login') }}</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="p-3">
                        <form class="form-default" role="form" action="{{ route('cart.login.submit') }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <div class="input-group input-group--style-1">
                                    <input type="email" name="email" class="form-control"
                                        placeholder="{{ __('Email') }}">
                                    <span class="input-group-addon">
                                        <i class="text-md la la-user" style="line-height: 0px"></i>
                                    </span>
                                </div>
                            </div>
    
                            <div class="form-group">
                                <div class="input-group input-group--style-1">
                                    <input type="password" name="password" class="form-control"
                                        placeholder="{{ __('Password') }}" autocomplete="current-password">
                                    <span class="input-group-addon">
                                        <i class="text-md la la-lock" style="line-height: 0px"></i>
                                    </span>
                                </div>
                            </div>
    
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <a href="{{ route('password.request') }}"
                                        class="link link-xs link--style-3">{{ __('Forgot password?') }}</a>
                                </div>
                                <div class="col-md-6 text-right">
                                    <button type="submit"
                                        class="btn btn-styled btn-base-1 px-4">{{ __('Sign in') }}</button>
                                </div>
                            </div>
                        </form>
    
                    </div>
                    <div class="text-center pt-3">
                        <p class="text-md">
                            {{ __('Need an account?') }} <a href="{{ route('user.registration') }}"
                                class="strong-600">{{ __('Register Now') }}</a>
                        </p>
                    </div>
                    @if (\App\BusinessSetting::where('type', 'google_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                        <div class="or or--1 my-3 text-center">
                            <span>or</span>
                        </div>
                        <div class="p-3 pb-0">
                            @if (\App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1)
                                <a href="{{url('auth/facebook/redirect')}}"
                                    class="btn btn-styled btn-block btn-facebook btn-icon--2 btn-icon-left px-4 mb-3">
                                    <i class="icon fa fa-facebook"></i> {{ __('Login with Facebook') }}
                                </a>
                            @endif
                            @if (\App\BusinessSetting::where('type', 'google_login')->first()->value == 1)
                                <a href="{{url('auth/google/redirect')}}"
                                    class="btn btn-styled btn-block btn-google btn-icon--2 btn-icon-left px-4 mb-3">
                                    <i class="icon fa fa-google"></i> {{ __('Login with Google') }}
                                </a>
                            @endif
                            @if (\App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                <a href="{{ route('social.login', ['provider' => 'twitter']) }}"
                                    class="btn btn-styled btn-block btn-twitter btn-icon--2 btn-icon-left px-4 mb-3">
                                    <i class="icon fa fa-twitter"></i> {{ __('Login with Twitter') }}
                                </a>
                            @endif
                        </div>
                    @endif
                    {{-- @if (\App\BusinessSetting::where('type', 'guest_checkout_active')->first()->value == 1)
                        <div class="or or--1 mt-0 text-center">
                            <span>or</span>
                        </div>
                        <div class="text-center">
                            <a href="{{ route('checkout.shipping_info') }}"
                                class="btn btn-styled btn-base-1">{{ __('Guest Checkout') }}</a>
                        </div>
                    @endif --}}
                </div>
            </div>
        </div>
    </div>
    <!-- SCRIPTS -->
    <!-- <a href="#" class="back-to-top btn-back-to-top"></a> -->
    <!-- jQuery -->
    <script src="{{ asset('frontend/assets/jquery-3.5.1/jquery-3.5.1.js') }}"></script>
    <!-- Popper -->
    <script src="{{ asset('frontend/assets/popper/popper.min.js') }}"></script>
    <!-- Popper Ends-->
    <!-- 3rd Bootstrap Js Link Starts -->
    <script src="{{ asset('frontend/assets/bootstrap-4.3.1/js/bootstrap.min.js') }}"></script>
    {{-- <script src="{{ asset('frontend/assets/bootstrap-4.3.1/js/bootstrap.min.js.map') }}"></script> --}}
    <!-- Bootstrap Js Link Ends -->
    <!-- Slick Js -->
    <script src="{{ asset('frontend/assets/slick/slick.min.js') }}"></script>
    <!-- Slick Js Ends-->
    <!-- Magnific Popup -->
    <script src="{{ asset('frontend/assets/magnific-popup/jquery.magnific-popup.min.js') }}"></script>
    <!-- Magnific Popup Ends-->
    <!-- Countdown start -->
    <script src="{{ asset('frontend/assets/countdown/js/flipclock.js') }}"></script>

    <!-- Custom Js Starts -->

    
    <script src="{{ asset('frontend/assets/swiper/drift.min.js') }}"></script>

    <script src="{{ asset('frontend/assets/swiper/swiper.min.js') }}"></script>
    <script src="{{ asset('frontend/assets/js/main.min.js') }}"></script>


    <script src="{{ asset('frontend/assets/js/secondary.min.js') }}"></script>



    {{-- <script src="https://k1ngzed.com/dist/swiper/swiper.min.js"></script>
    <script src="https://k1ngzed.com/dist/EasyZoom/easyzoom.js"></script> --}}

    <!-- Core -->
    {{-- <script src="{{ asset('frontend/js/vendor/popper.min.js') }}"></script> --}}
    {{-- <script src="{{ asset('frontend/js/vendor/bootstrap.min.js') }}"></script> --}}

    <!-- Plugins: Sorted A-Z -->
    <script src="{{ asset('frontend/js/jquery.countdown.min.js') }}"></script>
    <script src="{{ asset('frontend/js/select2.min.js') }}"></script>
    <script src="{{ asset('frontend/js/nouislider.min.js') }}"></script>
    <script src="{{ asset('frontend/js/sweetalert2.min.js') }}"></script>
    {{-- <script src="{{ asset('frontend/js/slick.min.js') }}"></script> --}}
    <script src="{{ asset('frontend/js/jssocials.min.js') }}"></script>
    <script src="{{ asset('frontend/js/bootstrap-tagsinput.min.js') }}"></script>
    <script src="{{ asset('frontend/js/jodit.min.js') }}"></script>
    <script src="{{ asset('frontend/js/xzoom.min.js') }}"></script>
    <!-- <script src="{{ asset('frontend/js/fb-script.js') }}"></script> -->
    <script src="{{ asset('frontend/js/lazysizes.min.js') }}"></script>
    <script src="{{ asset('frontend/js/intlTelInput.min.js') }}"></script>
    <!-- rating star -->
    <script src="{{asset('plugins/rating/rating.js')}}"></script>

    {{-- <script src="https://use.fontawesome.com/f90dcc1da9.js"></script> --}}
    <script src="https://use.fontawesome.com/79d6e010ae.js"></script>


    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- App JS -->
    <script src="{{ asset('frontend/js/active-shop.min.js') }}"></script>
    <script src="{{ asset('frontend/js/main.min.js') }}"></script>

    {{-- script-new js --}}
    {{-- <script src="{{ asset('frontend/js/script-new.js') }}"></script> --}}
    <script src="https://khalti.s3.ap-south-1.amazonaws.com/KPG/dist/2020.12.17.0.0.0/khalti-checkout.iffe.js"></script>

    @if ($generalsetting->pop_status == 1)
    <script type="text/javascript">
        $(window).on('load', function() {
            // Get the modal and the image
            // var modal = $(".coming-soon-modal");
            // var img = $(".pop-up-modal-image");

            // When the image is loaded, set the modal size to the image size
            // img.on("load", function() {
            //     modal.css({
            //     "width": this.width + "px",
            //     "height": this.height + "px",
            //     "display": "block"
            //     });
            // });

            $('.coming-soon-modal').modal('show');
        });
    </script>
    @endif

    <script>
        function showFrontendAlert(type, message) {
            if (type == 'danger') {
                type = 'error';
            }
            swal({
                position: 'top-end',
                type: type,
                title: message,
                showConfirmButton: false,
                timer: 3000
            });
        }
    </script>

    @foreach (session('flash_notification', collect())->toArray() as $message)
    <script>
        showFrontendAlert('{{ $message['level'] }}', '{{ $message['message'] }}');
    </script>
    @endforeach
    <script>
        $(document).ready(function () {
        function loadLazyImages() {
            var lazyImages = document.querySelectorAll('img[data-lazy]');
            lazyImages.forEach(function(lazyImage) {
                lazyImage.src = lazyImage.dataset.lazy;
                lazyImage.removeAttribute('data-lazy');
            });
        }

        window.addEventListener('load', loadLazyImages);
        $('.delivery').select2();
        $(document).on('click','.delete-address',function(e){
            e.preventDefault();
            var red = $(this).data('src');
            Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                // console.log(result.value);
                if (result.isConfirmed) {
                }  else if (result.dismiss === Swal.DismissReason.cancel) {
                }else{
                    window.location.href = red;
                }
            });
        });
        
        $(document).on('click','.removeFromCartView',function(e){
            var key = $(this).attr('data-key');
            e.preventDefault();
            removeFromCart(key);
        });
    $(document).on('click','.new-address',function(e){
        $('#new-address-modal').modal('show');
    });
            $('.removeFromWishlist').on('click',function(){
                var cid = $(this).data('id');
            $.post('{{ route('wishlists.remove') }}',{_token:'{{ csrf_token() }}', id:cid}, function(data){
                $('#wishlist').html(data);
                $('#wishlist_'+cid).hide();
                showFrontendAlert('success', 'Item has been renoved from wishlist');
            })

            });
            function removeFromWishlist(id){
                $.post('{{ route('wishlists.remove') }}',{_token:'{{ csrf_token() }}', id:id}, function(data){
                    $('#wishlist').html(data);
                    $('#wishlist_'+id).hide();
                    showFrontendAlert('success', 'Item has been renoved from wishlist');
                })
            }
            function show_wallet_modal(){
                $('#wallet_modal').modal('show');
            }

            function show_make_wallet_recharge_modal(){
                $.post('{{ route('offline_wallet_recharge_modal') }}', {_token:'{{ csrf_token() }}'}, function(data){
                    $('#offline_wallet_recharge_modal_body').html(data);
                    $('#offline_wallet_recharge_modal').modal('show');
                });
            }
            // product Gallery and Zoom
            // activation carousel plugin
            var galleryThumbs = new Swiper(".gallery-thumbs", {
                spaceBetween: 10,
                slidesPerView: 4,
                freeMode: true,
                watchSlidesVisibility: true,
                watchSlidesProgress: true,
            });
            var galleryTop = new Swiper(".gallery-top", {
                spaceBetween: 10,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
                thumbs: {
                    swiper: galleryThumbs,
                },
            });
            $(document).on('click','.change-image',function(){
                console.log('a');
                // $('.change-image').on('click',function(){
                // Get the index of the active slide
                var colorPointTo = $(this).data('colorpointto');
                // console.log(colorPointTo);
                var colorIndex = $('.'+colorPointTo).data('indexval')
                //   const activeIndex = galleryThumbs.activeIndex;
                // console.log(colorIndex);
                // console.log(galleryThumbs);
                // Set the next slide as  the active slide
                //   galleryThumbs.slideTo(activeIndex + 1);
                galleryTop.slideTo(colorIndex);
                // galleryThumbs.slideTo(1);
            });

            var paneContainer = document.querySelector(".zoom");

            $(".swiper-slide").each(function () {
                new Drift($(this).find("img")[0], {
                    paneContainer: paneContainer,
                    inlinePane: false,
                });
            });
            
            // var demoTrigger = document.querySelector(".img-responsive");
            // var paneContainer = document.querySelector(".zoom");

            // $(".swiper-slide").each(function () {0
            //     new Drift(demoTrigger, {
            //         paneContainer: paneContainer,
            //         inlinePane: false,
            //     });
            // });
        });

        $(document).ready(function() {
            $('.view-seller-policy').on('click',function(){
                $('#exampleModal222').modal('show');
            });
            $('.multi-level').css('min-height','50vh!important');

            $('.category-nav-element').each(function(i, el) {
                $(el).on('mouseover', function() {
                    if (!$(el).find('.sub-cat-menu').hasClass('loaded')) {
                        $.post('{{ route('category.elements') }}', {
                                _token: '{{ csrf_token()}}',
                                id: $(el).data('id')
                            },
                            function(data) {
                                $(el).find('.sub-cat-menu').addClass('loaded').html(data);
                            });
                    }
                });
            });
            if ($('#lang-change').length > 0) {
                $('#lang-change .dropdown-item a').each(function() {
                    $(this).on('click', function(e) {
                        e.preventDefault();
                        var $this = $(this);
                        var locale = $this.data('flag');
                        $.post('{{ route('language.change') }}', {
                                _token: '{{ csrf_token() }}',
                                locale: locale
                            },
                            function(data) {
                                location.reload();
                            });

                    });
                });
            }

            if ($('#currency-change').length > 0) {
                $('#currency-change .dropdown-item a').each(function() {
                    $(this).on('click', function(e) {
                        e.preventDefault();
                        var $this = $(this);
                        var currency_code = $this.data('currency');
                        $.post('{{ route('currency.change')     }}', {
                                _token: '{{ csrf_token() }}',
                                currency_code: currency_code
                            },
                            function(data) {
                                location.reload();
                            });

                    });
                });
            }
            $('.address_id').on('change',function(e){    
    var location_id = $(this).data('location')
    var taxTotal = $('.tax-total').text();
    var subTotal = $('.sub-total').text();
    var shippingBeforeLocation = $('.shipping-before-location').text();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var ajaxurl = '/location/getLocationCharge';
    $.ajax({
        type: 'POST',
        url: ajaxurl,
        data: {
            "deliveryLocation": location_id,
            "taxTotal": taxTotal,
            "subTotal": subTotal,
            "shippingBeforeLocation": shippingBeforeLocation,
        },
        dataType: 'json',
        beforeSend: function() {},
        success: function(data) {

            if (data != 'false') {
                console.log(data);
                $('.delivery-charge-span').text('Rs.'+data.location_charge);
                $('.shipping-total-span').text('Rs.'+data.total_shipping);
                $('.grand-total-span').text('Rs.'+data.total);
                // optionLoop = '';
                // options = data;
                // options.forEach(function(index) {
                //     optionLoop +=
                //         '<option value="'+index.id+'">'+index.name+'</option>';
                // });
            } 
            // else {
            //     optionLoop = '<option disabled>No Locations</option>';
            // }
            // $(".address-location").html(optionLoop);

        },
        error: function(data) {
            showFrontendAlert('error',data.responseText);
        }
    });
});
$(".flash_feature").slick({
    infinite: true,
    autoplay: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    arrows: true,
    dots: false,
    responsive: [
        {
            breakpoint: 1400,
            settings: {
                slidesToShow: 4,
                slidesToScroll: 1,
            },
        },
        {
            breakpoint: 1080,
            settings: {
                slidesToShow: 4,
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
$('.address-district').on('change',function(e){
    var district_id = $(this).val();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    var ajaxurl = '/location/getLocation';
    $.ajax({
        type: 'POST',
        url: ajaxurl,
        data: {
            "district_id": district_id,
        },
        dataType: 'json',
        beforeSend: function() {},
        success: function(data) {

            if (data != 'false') {
                optionLoop = '';
                options = data;
                options.forEach(function(index) {
                    optionLoop +=
                        '<option value="'+index.id+'">'+index.name+'</option>';
                });
            } else {
                optionLoop = '<option disabled>No Locations</option>';
            }
            $(".address-location").html(optionLoop);

        },
        error: function(data) {
            showFrontendAlert('error',data.responseText);
        }
    });
});
        });

        $('#search').on('keyup', function() {
            search();
        });

        $('#search').on('focus', function() {
            search();
        });

        $('#search_mob').on('keyup', function(){
            MobSearch();
        });

        $('#search_mob').on('focus', function(){
            MobSearch();
        });

        function search() {
            var search = $('#search').val();
            if (search.length > 0) {
                $('body').addClass("typed-search-box-shown");

                $('.typed-search-box').removeClass('d-none');
                $('.search-preloader').removeClass('d-none');
                $.post('{{ route('search.ajax') }}', {
                        _token: '{{ @csrf_token() }}',
                        search: search
                    },
                    function(data) {
                        if (data == '0') {
                            // $('.typed-search-box').addClass('d-none');
                            $('#search-content').html(null);
                            $('.typed-search-box .search-nothing').removeClass('d-none').html('Sorry, nothing found for <strong>"' + search + '"</strong>');
                            $('.search-preloader').addClass('d-none');

                        } else {
                            $('.typed-search-box .search-nothing').addClass('d-none').html(null);
                            $('#search-content').html(data);
                            $('.search-preloader').addClass('d-none');
                        }
                    });
            } else {
                $('.typed-search-box').addClass('d-none');
                $('body').removeClass("typed-search-box-shown");
            }
        }

        function MobSearch(){
        var search = $('#search_mob').val();
        
        if(search.length > 0){
            $('body').addClass("type-search-box-shown");

            $('.type-search-box').removeClass('d-none');
            $('.search-preloader').removeClass('d-none');
            $.post('{{ route('search.ajax') }}', { _token: '{{ @csrf_token() }}', search:search}, function(data){
                if(data == '0'){
                    // $('.type-search-box').addClass('d-none');
                    $('#mob_search-content').html(null);
                    $('.type-search-box .search-nothing').removeClass('d-none').html('Sorry, nothing found for <strong>"'+search+'"</strong>');
                    $('.search-preloader').addClass('d-none');

                }
                else{
                    $('.type-search-box .search-nothing').addClass('d-none').html(null);
                    $('#mob_search-content').html(data);
                    $('.search-preloader').addClass('d-none');
                }
            });
        }
        else {
            $('.type-search-box').addClass('d-none');
            $('body').removeClass("type-search-box-shown");
        }
    }

        function updateNavCart() {
            $.post('{{ route('cart.nav_cart') }}', {
                    _token: '{{ csrf_token() }}'
                },
                function(data) {
                    $('#cart_items').html(data);
                });
        }

        function removeFromCart(key) {
            $.post('{{ route('cart.removeFromCart') }}', {
                    _token: '{{ csrf_token() }}',
                    key: key
                },
                function(data) {
                    updateNavCart();
                    $('#cart-summary').html(data);
                    showFrontendAlert('success', 'Item has been removed from cart');
                    $('#cart_items_sidenav').html(parseInt($('#cart_items_sidenav').html()) - 1);
                });
        }

        function addToCompare(id) {
            $.post('{{ route('compare.addToCompare') }}', {
                    _token: '{{ csrf_token() }}',
                    id: id
                },
                function(data) {
                    if(data == 'false'){
                        showFrontendAlert('error', 'Products to compare must be of same category. Or you can reset compare list.');

                    }else{
                        $('#compare').html(data);
                        showFrontendAlert('success', 'Item has been added to compare list');
                        $('#compare_items_sidenav').html(parseInt($('#compare_items_sidenav').html()) + 1);

                    }
                });
        }

        function addToWishList(id) {
            @if(Auth::check() && (Auth::user() -> user_type == 'customer' || Auth::user() -> user_type == 'seller'))
            $.post('{{ route('wishlists.store') }}', {
                    _token: '{{ csrf_token() }}',
                    id: id
                },
                function(data) {
                    if (data != 0) {
                        $('#wishlist').html(data);
                        showFrontendAlert('success', 'Item has been added to wishlist');
                    } else {
                        showFrontendAlert('warning', 'Please login first');
                    }
                });
            @else
            showFrontendAlert('warning', 'Please login first');
            @endif
        }

        function showAddToCartModal(id) {
            if (!$('#modal-size').hasClass('modal-lg')) {
                $('#modal-size').addClass('modal-lg');
            }
            $('#addToCart-modal-body').html(null);
            $('#addToCart').modal();
            $('.c-preloader').show();
            $.post('{{ route('cart.showCartModal') }}', {
                    _token: '{{ csrf_token() }}',
                    id: id
                },
                function(data) {
                    $('.c-preloader').hide();
                    $('#addToCart-modal-body').html(data);
                    $('.xzoom, .xzoom-gallery').xzoom({
                        Xoffset: 20,
                        bg: true,
                        tint: '#000',
                        defaultScale: -1
                    });
                    getVariantPrice();
                });
        }

        $('#option-choice-form input').on('change', function() {
            getVariantPrice();
        });

        function getVariantPrice() {
            if ($('#option-choice-form input[name=quantity]').val() > 0 && checkAddToCartValidity()) {
                $.ajax({
                    type: "POST",
                    url: '{{ route('products.variant_price') }}',
                    data: $('#option-choice-form').serializeArray(),
                    success: function(data) {
                        $('#option-choice-form #chosen_price_div').removeClass('d-none');
                        $('#option-choice-form #chosen_price_div #chosen_price').html(data.price);
                        $('#available-quantity').html(data.quantity);
                        $('.input-number').prop('max', data.quantity);
                        //console.log(data.quantity);
                        if (parseInt(data.quantity) < 1 && data.digital != 1) {
                            $('.buy-now').hide();
                            $('.add-to-cart').hide();
                        } else {
                            $('.buy-now').show();
                            $('.add-to-cart').show();
                        }
                    }
                });
            }
        }

        function checkAddToCartValidity() {
            var names = {};
            $('#option-choice-form input:radio').each(function() { // find unique names
                names[$(this).attr('name')] = true;
            });
            var count = 0;
            $.each(names, function() { // then count them
                count++;
            });

            if ($('#option-choice-form input:radio:checked').length == count) {
                return true;
            }

            return false;
        }

        function addToCart() {
            if (checkAddToCartValidity()) {
                $('#addToCart').modal();
                $('.c-preloader').show();
                $.ajax({
                    type: "POST",
                    url: '{{ route('cart.addToCart') }}',
                    data: $('#option-choice-form').serializeArray(),
                    success: function(data) {
                        $('#addToCart-modal-body').html(null);
                        $('.c-preloader').hide();
                        $('#modal-size').removeClass('modal-lg');
                        $('#addToCart-modal-body').html(data);
                        updateNavCart();
                        $('#cart_items_sidenav').html(parseInt($('#cart_items_sidenav').html()) + 1);
                    }
                });
            } else {
                showFrontendAlert('warning', 'Please choose all the options');
            }
        }

        function buyNow() {
            if (checkAddToCartValidity()) {
                $('#addToCart').modal();
                $('.c-preloader').show();
                $.ajax({
                    type: "POST",
                    url: '{{ route('cart.addToCart') }}',
                    data: $('#option-choice-form').serializeArray(),
                    success: function(data) {
                        //$('#addToCart-modal-body').html(null);
                        //$('.c-preloader').hide();
                        //$('#modal-size').removeClass('modal-lg');
                        //$('#addToCart-modal-body').html(data);
                        updateNavCart();
                        $('#cart_items_sidenav').html(parseInt($('#cart_items_sidenav').html()) + 1);
                        window.location.replace("{{ route('cart') }}");
                    }
                });
            } else {
                showFrontendAlert('warning', 'Please choose all the options');
            }
        }

        function confirmRedeem(type, message) {
            Swal.fire({
            title: 'Confirm ?',
            text: "This action will convert your remaining refer points to reward amount.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
            }).then((result) => {
                console.log(result);
                if (result.isConfirmed) {   
                }else{             
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });
                    var ajaxurl = '/redeemReward';
                    $.ajax({
                        type: 'POST',
                        url: ajaxurl,
                        data: {
                        },
                        dataType: 'json',
                        beforeSend: function() {},
                        success: function(data) {

                            if (data.success != false) {
                                showFrontendAlert('success','Refer Points Redeemed.');
                                location.reload();
                            }else{
                                showFrontendAlert('error',data.message);
                            }
                        },
                        error: function(data) {
                            showFrontendAlert('error',data.responseText);
                        }
                    });

                }
            })
        }
        function show_reward_policy() {
            $.get('{{ route('rewardPolicy') }}', {
                  
                },
                function(data) {
                    $('#order-details-modal-body').html(data);
                    $('#order_details').modal();
                    $('.c-preloader').hide();
                });
        }
        function show_purchase_history_details(order_id) {
            $('#order-details-modal-body').html(null);

            if (!$('#modal-size').hasClass('modal-lg')) {
                $('#modal-size').addClass('modal-lg');
            }

            $.post('{{ route('purchase_history.details') }}', {
                    _token: '{{ @csrf_token() }}',
                    order_id: order_id
                },
                function(data) {
                    $('#order-details-modal-body').html(data);
                    $('#order_details').modal();
                    $('.c-preloader').hide();
                });
        }

        function show_order_details(order_id) {
            $('#order-details-modal-body').html(null);

            if (!$('#modal-size').hasClass('modal-lg')) {
                $('#modal-size').addClass('modal-lg');
            }

            $.post('{{ route('orders.details') }}', {
                    _token: '{{ @csrf_token() }}',
                    order_id: order_id
                },
                function(data) {
                    $('#order-details-modal-body').html(data);
                    $('#order_details').modal();
                    $('.c-preloader').hide();
                });
        }

        function cartQuantityInitialize() {
            $('.btn-number').click(function(e) {
                e.preventDefault();

                fieldName = $(this).attr('data-field');
                type = $(this).attr('data-type');
                var input = $("input[name='" + fieldName + "']");
                var currentVal = parseInt(input.val());

                if (!isNaN(currentVal)) {
                    if (type == 'minus') {

                        if (currentVal > input.attr('min')) {
                            input.val(currentVal - 1).change();
                        }
                        if (parseInt(input.val()) == input.attr('min')) {
                            $(this).attr('disabled', true);
                        }

                    } else if (type == 'plus') {

                        if (currentVal < input.attr('max')) {
                            input.val(currentVal + 1).change();
                        }
                        if (parseInt(input.val()) == input.attr('max')) {
                            $(this).attr('disabled', true);
                        }

                    }
                } else {
                    input.val(0);
                }
            });

            $('.input-number').focusin(function() {
                $(this).data('oldValue', $(this).val());
            });

            $('.input-number').change(function() {

                minValue = parseInt($(this).attr('min'));
                maxValue = parseInt($(this).attr('max'));
                valueCurrent = parseInt($(this).val());

                name = $(this).attr('name');
                if (valueCurrent >= minValue) {
                    $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
                } else {
                    alert('Sorry, the minimum value was reached');
                    $(this).val($(this).data('oldValue'));
                }
                if (valueCurrent <= maxValue) {
                    $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
                } else {
                    alert('Sorry, the maximum value was reached');
                    $(this).val($(this).data('oldValue'));
                }


            });
            $(".input-number").keydown(function(e) {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
                    // Allow: Ctrl+A
                    (e.keyCode == 65 && e.ctrlKey === true) ||
                    // Allow: home, end, left, right
                    (e.keyCode >= 35 && e.keyCode <= 39)) {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            });
        }

        function imageInputInitialize() {
            $('.custom-input-file').each(function() {
                var $input = $(this),
                    $label = $input.next('label'),
                    labelVal = $label.html();

                $input.on('change', function(e) {
                    var fileName = '';

                    if (this.files && this.files.length > 1)
                        fileName = (this.getAttribute('data-multiple-caption') || '').replace('{count}', this.files.length);
                    else if (e.target.value)
                        fileName = e.target.value.split('\\').pop();

                    if (fileName)
                        $label.find('span').html(fileName);
                    else
                        $label.html(labelVal);
                });

                // Firefox bug fix
                $input
                    .on('focus', function() {
                        $input.addClass('has-focus');
                    })
                    .on('blur', function() {
                        $input.removeClass('has-focus');
                    });
            });
        }




        //Calculate and output the new amount

        function exchangeCurrency() {
            var amount = $(".amount").val();
            var rateFrom = $(".currency-list")[0].value;
            //    console.log(rateFrom);
            var rateTo = $(".currency-list")[1].value;
            if ((amount - 0) != amount || ('' + amount).trim().length == 0) {
                //    console.log('hi');
                $(".results").html("0");
                $(".error").show()
            } else {

                $(".error").hide()
                if (amount == undefined || rateFrom == "--Select--" || rateTo == "--Select--") {
                    $(".results").html("0");

                } else {
                    $(".results").html((amount * (rateTo * (1 / rateFrom))).toFixed(5));
                }
            }
        }

        $("#categories-list").hover(
            function() {
                $('.category-list').collapse('show');
            },
            function() {
                $('.category-list').collapse('hide');
            }
        );
        //  $(".multi-level").hover(
        //   function () {
        //     $('.category-list').collapse('show');
        //   },
        //   function () {
        //     $('.category-list').collapse('hide');
        //   }
        // );
        function copyToClipboard(text) {
            var sampleTextarea = document.createElement("textarea");
            document.body.appendChild(sampleTextarea);
            sampleTextarea.value = text; //save main text in it
            sampleTextarea.select(); //select textarea contenrs
            document.execCommand("copy");
            document.body.removeChild(sampleTextarea);
            showFrontendAlert('success', 'Copied to clipboard');
        }
    </script>
<script type="text/javascript">

    $('#dashboard-phone2').on('keypress', function(e) {
        var $this = $(this);
        var regex = new RegExp("^[0-9\b]+$");
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        // for 10 digit number only
        if ($this.val().length > 9) {
            e.preventDefault();
            return false;
        }
        if (e.charCode < 57 && e.charCode > 47) {
            if ($this.val().length == 0) {
                e.preventDefault();
                return false;
            } else {
                return true;
            }
        }
        if (regex.test(str)) {
            return true;
        }
        e.preventDefault();
        return false;
    });
    $('.customer-dashboard-address').click(function(e){
    // console.log('1');
        e.stopImmediatePropagation();
        var phone = $('#dashboard-phone2').val();
        if(phone== ''){
            showFrontendAlert('danger','Phone number cannot be Empty')
            return false;
        }
        if(phone.length < 10){
            showFrontendAlert('danger','Phone number format not correct')
            return false;
        }
        $('#dashboard-customer-address-form').submit();
    });
    $('#dashboard-phone').on('keypress', function(e) {
        var $this = $(this);
        var regex = new RegExp("^[0-9\b]+$");
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        // for 10 digit number only
        if ($this.val().length > 9) {
            e.preventDefault();
            return false;
        }
        if (e.charCode < 57 && e.charCode > 47) {
            if ($this.val().length == 0) {
                e.preventDefault();
                return false;
            } else {
                return true;
            }
        }
        if (regex.test(str)) {
            return true;
        }
        e.preventDefault();
        return false;
    });
    function add_new_address_dashboard(){
        $('#new-address-modal').modal('show');
    }
</script>
    @yield('script')

</body>

</html>