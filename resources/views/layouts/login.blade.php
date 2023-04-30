<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link name="favicon" type="image/x-icon" href="{{asset('img/favicon.png')}}" rel="shortcut icon" />

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">

    <!--Bootstrap Stylesheet [ REQUIRED ]-->
    {{-- {{ config(‘app.asset_url’) }} --}}
    <link href="{{ config("app.url") }}css/bootstrap.min.css" rel="stylesheet">
    {{-- <link href="{{ asset('css/bootstrap.min.css')}}" rel="stylesheet"> --}}

    <!--Font Awesome [ OPTIONAL ]-->
    <link href="{{ config("app.url") }}plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!--active-shop Stylesheet [ REQUIRED ]-->
    <link href="{{ config("app.url") }}css/active-shop.min.css" rel="stylesheet">

    <!--active-shop Premium Icon [ DEMONSTRATION ]-->
    <link href="{{ config("app.url") }}css/demo/active-shop-demo-icons.min.css" rel="stylesheet">

    <!--Demo [ DEMONSTRATION ]-->
    <link href="{{ config("app.url") }}css/demo/active-shop-demo.min.css" rel="stylesheet">

    <!--Theme [ DEMONSTRATION ]-->
    <link href="{{ config("app.url") }}css/themes/type-c/theme-navy.min.css" rel="stylesheet">

    <link href="{{ config("app.url") }}css/custom.css" rel="stylesheet">

</head>
<body>
    @php
        $generalsetting = \App\GeneralSetting::first();
    @endphp
    <div id="container" class="blank-index"
        {{-- @if ($generalsetting->admin_login_background != null)
            style="background-image:url('{{ asset($generalsetting->admin_login_background) }}');"
        @else
            style="background-image:url('{{ asset('img/bg-img/login-bg.jpg') }}');"
        @endif --}}
        >
        <div class="cls-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="panel">
                            <div class="panel-body pad-no">
                                @yield('content')
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--JAVASCRIPT-->
    <!--=================================================-->

    <!--jQuery [ REQUIRED ]-->
    <script src="{{ config("app.url") }}js/jquery.min.js"></script>


    <!--BootstrapJS [ RECOMMENDED ]-->
    <script src="{{ config("app.url") }}js/bootstrap.min.js"></script>


    <!--active-shop [ RECOMMENDED ]-->
    <script src="{{ config("app.url") }}js/active-shop.min.js"></script>

    <!--Alerts [ SAMPLE ]-->
    <script src="{{ config("app.url") }}js/demo/ui-alerts.js"></script>

    @yield('script')

</body>
</html>
