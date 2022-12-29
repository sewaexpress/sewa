@extends('frontend.layouts.app')

@section('content')

    <section class="gry-bg py-4 profile">
        <div class="container">
            <div class="row cols-xs-space cols-sm-space cols-md-space">
                <div class="col-lg-9 mx-auto">
                    <div class="main-content">
                        <!-- Page title -->
                        <div class="page-title">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h2 class="heading heading-6 text-capitalize strong-600 mb-0">
                                        {{__('Shop Informations')}}
                                    </h2>
                                </div>
                                <div class="col-md-6">
                                    <div class="float-md-right">
                                        <ul class="breadcrumb">
                                            <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                                            <li><a href="{{ route('dashboard') }}">{{__('Dashboard')}}</a></li>
                                            <li class="active"><a href="{{ route('shops.create') }}">{{__('Create Shop')}}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form id="register-form" class="" action="{{ route('shops.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            @if(!(Auth::check()))   
                            If you are already registerd, <a href="#" data-toggle="modal" data-target="#GuestCheckout">Login</a> here

                            @endif

                            @if (!Auth::check())
                                <div class="form-box bg-white mt-4">
                                    <div class="form-box-title px-3 py-2">
                                        {{__('User Info')}}
                                    </div>
                                    <div class="form-box-content p-3">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <!-- <label>{{ __('Name') }}</label> -->
                                                    <div class="input-group input-group--style-1">
                                                        <input id="username" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" value="{{ old('name') }}" placeholder="{{ __('Name') }}" name="name">
                                                        <span class="input-group-addon">
                                                            <i class="text-md la la-user"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <!-- <label>{{ __('Phone') }}</label> -->
                                                    <div class="input-group input-group--style-1">
                                                        <input id="phone" type="number" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" value="{{ old('phone') }}" placeholder="{{ __('Phone') }}" name="phone">
                                                        <span class="input-group-addon">
                                                            <i class="text-md la la-user"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <!-- <label>{{ __('Email') }}</label> -->
                                                    <div class="input-group input-group--style-1">
                                                        <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{ __('Email') }}" name="email">
                                                        <span class="input-group-addon">
                                                            <i class="text-md la la-envelope"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <!-- <label>{{ __('Password') }}</label> -->
                                                    <div class="input-group input-group--style-1">
                                                        <input id="firstPassword" type="password" class="password form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="{{ __('Password') }}" name="password">
                                                        <span class="input-group-addon">
                                                            <i class="text-md la la-eye" onclick="showPassword()" style="cursor: pointer;line-height: 0px"></i>
                                                            {{-- <i class="text-md la la-lock"></i> --}}
                                                        </span>
                                                        <style>
                                                            #pswd_info {
                                                                position: absolute;
                                                                bottom: -160px;
                                                                bottom: -115px\9;
                                                                right: -80px;
                                                                width: 250px;
                                                                padding: 12px;
                                                                background: #fefefe;
                                                                font-size: .875em;
                                                                border-radius: 5px;
                                                                box-shadow: 0 1px 3px #ccc;
                                                                border: 1px solid #ddd;
                                                                z-index: 9;
                                                            }
                                                            #pswd_info h4 {
                                                                margin:0 0 10px 0;
                                                                padding:0;
                                                                font-weight:normal;
                                                            }
                                                            #pswd_info::before {
                                                                content: "\25B2";
                                                                position:absolute;
                                                                top:-12px;
                                                                left:45%;
                                                                font-size:14px;
                                                                line-height:14px;
                                                                color:#ddd;
                                                                text-shadow:none;
                                                                display:block;
                                                            }
                                                            .invalid {
                                                                background:url(../images/invalid.png) no-repeat 0 50%;
                                                                padding-left:22px;
                                                                line-height:24px;
                                                                color:#ec3f41;
                                                            }
                                                            .valid {
                                                                background:url(../images/valid.png) no-repeat 0 50%;
                                                                padding-left:22px;
                                                                line-height:24px;
                                                                color:#3a7d34;
                                                            }
                                                            #pswd_info {
                                                                display:none;
                                                            }
                                                        </style>
                                                        <div id="pswd_info">
                                                            <h6>Password must meet the following requirements:</h6>
                                                            <ul>
                                                                <li id="letter" class="invalid">At least <strong>one letter</strong></li>
                                                                <li id="capital" class="invalid">At least <strong>one capital letter</strong></li>
                                                                <li id="number" class="invalid">At least <strong>one number</strong></li>
                                                                <li id="length" class="invalid">Be at least <strong>8 characters</strong></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <!-- <label>{{ __('Confirm Password') }}</label> -->
                                                    <div class="input-group input-group--style-1">
                                                        <input type="password" class="password form-control" placeholder="{{ __('Confirm Password') }}" name="password_confirmation">
                                                        <span class="input-group-addon">
                                                            <i class="text-md la la-eye" onclick="showPassword()" style="cursor: pointer;line-height: 0px"></i>
                                                            {{-- <i class="text-md la la-lock"></i> --}}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Basic Info')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Shop Name')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input id="shopname" type="text" class="form-control mb-3" placeholder="{{__('Shop Name')}}" name="name" >
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Logo')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="file" name="logo" id="file-2" class="custom-input-file custom-input-file--4" data-multiple-caption="{count} files selected" accept="image/*" />
                                            <label for="file-2" class="mw-100 mb-3">
                                                <span></span>
                                                <strong>
                                                    <i class="fa fa-upload"></i>
                                                    {{__('Choose image')}}
                                                </strong>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Address')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input id="address" type="text" class="form-control mb-3" placeholder="{{__('Address')}}" name="address" >
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Pan')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input id="pan" type="text" class="form-control mb-3" placeholder="{{__('Pan')}}" name="pan" >
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Location')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            @if (count($locations)>0)
                                                <select id="location" name="location[]" class="form-control js-example-basic-multiple" multiple="multiple" >
                                                    @foreach ($locations as $location)
                                                        <option value="{{$location->name}}">{{$location->state}} > {{$location->name}}</option>    
                                                    @endforeach
                                                </select>
                                            @else
                                                <select class="form-control">
                                                    <option value="" selected disabled>No Location Available</option>
                                                </select>
                                            @endif
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                            </div>
                                            <div class="col-md-10">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-10">
                                        
                                        <div class="mt-2">                                                                                            
                                            
                                            <label>
                                                <input type="checkbox" class="" placeholder="{{__('Pan')}}" name="read" required>
                                                {{__('I have read and agreed to the ')}} 
                                                <a href="javascript:void(0);" class="view-seller-policy" data-bs-toggle="modal" data-bs-target="#exampleModal222">seller policy</a> <span class="required-star">*</span>
                                            </label>
                                        
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-right mt-4">

                                <button id="submit" type="submit" class="btn btn-styled btn-base-1">{{__('Register')}}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="exampleModal222" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Seller Policy</h5>
              {{-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> --}}
            </div>
            <div class="modal-body">
                @php
                    echo \App\Policy::where('name', 'seller_policy')->first()->content;
                @endphp
            </div>
            {{-- <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div> --}}
          </div>
        </div>
    </div>
    <div class="modal fade" id="GuestCheckout" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-zoom" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h6 class="modal-title" id="exampleModalLabel">{{ __('Vendor Login') }}</h6>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="p-3">
                    <form class="form-default" role="form" action="{{ route('login') }}" method="POST">
                        {{-- <form class="form-default" role="form" action="{{ route('seller.login') }}" method="POST"> --}}
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
                                <input id="password" type="password" name="password" class="password form-control"
                                    placeholder="{{ __('Password') }}">
                                <span class="input-group-addon">
                                    <i class="text-md la la-eye" onclick="showPassword()" style="cursor: pointer;line-height: 0px"></i>
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
            </div>
        </div>
    </div>
</div>

@endsection
@section('script')
<script>
    $(document).ready(function() {$('#firstPassword').keyup(function() {
            var pswd = $(this).val();
            //validate the length
            if ( pswd.length < 8 ) {
                $('#length').removeClass('valid').addClass('invalid');
            } else {
                $('#length').removeClass('invalid').addClass('valid');
            }
            //validate letter
            if ( pswd.match(/[A-z]/) ) {
                $('#letter').removeClass('invalid').addClass('valid');
            } else {
                $('#letter').removeClass('valid').addClass('invalid');
            }

            //validate capital letter
            if ( pswd.match(/[A-Z]/) ) {
                $('#capital').removeClass('invalid').addClass('valid');
            } else {
                $('#capital').removeClass('valid').addClass('invalid');
            }

            //validate number
            if ( pswd.match(/\d/) ) {
                $('#number').removeClass('invalid').addClass('valid');
            } else {
                $('#number').removeClass('valid').addClass('invalid');
            }
        }).focus(function() {
            $('#pswd_info').show();
        }).blur(function() {
            $('#pswd_info').hide();
        });
        $('#submit').click(function(e){
            // console.log('1');
            e.stopImmediatePropagation();
           var name = $('#username').val();
           var email = $('#email').val();
           var pswd = $('#firstPassword').val();
           var phone = $('#phone').val();
           var shopname = $('#shopname').val();
           var address = $('#address').val();
           var location = $('#location').val();
           var pan = $('#pan').val();
            if(name== ''){
              showFrontendAlert('danger','Name cannot be Empty')
              return false;
            }
            if(phone== ''){
                showFrontendAlert('danger','Phone number cannot be Empty')
                return false;
            }
            if(phone.length < 10){
                showFrontendAlert('danger','Phone number format not correct')
                return false;
            }
            if(email== ''){
               showFrontendAlert('danger','Email cannot be Empty')
               return false;
            }
            if(IsEmail(email)==false){
                showFrontendAlert('danger','Email Format not correct')
                return false;
            }
            if(pswd== ''){
                showFrontendAlert('danger','Password cannot be Empty')
                return false;
            }
            if ( pswd.length < 8 ) {
                showFrontendAlert('danger','Password should at least be of 8 characters')
                return false;
            }

            //validate capital letter
            if(!containsUppercase(pswd)){
                showFrontendAlert('danger','Password should contain a capital letter')
                return false;
            }

            //validate number
            if(!containsNumbers(pswd)){
                showFrontendAlert('danger','Password should contain a number')
                return false;
            }
            if(pan== ''){
              showFrontendAlert('danger','Pan cannot be Empty')
              return false;
            }
            if(shopname== ''){
              showFrontendAlert('danger','Shop Name cannot be Empty')
              return false;
            }
            if(address== ''){
              showFrontendAlert('danger','Address cannot be Empty')
              return false;
            }
            if(location== ''){
              showFrontendAlert('danger','Location cannot be Empty')
              return false;
            }
            $('#register-form').submit();
          });
          function containsUppercase(str) {
            return /[A-Z]/.test(str);
            }
            function containsNumbers(str) {
            return /\d/.test(str);
            }
      function IsEmail(email) {
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if(!regex.test(email)) {
           return false;
        }else{
           return true;
        }
      }
        $('#phone').on('keypress', function(e) {
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
        $('.js-example-basic-multiple').select2({
            placeholder:"Select Locations"
        });
    });
</script>
<script type="text/javascript">
    function autoFillSeller(){
        $('#email').val('seller@example.com');
        $('#password').val('123456');
    }
    function autoFillCustomer(){
        $('#email').val('customer@example.com');
        $('#password').val('123456');
    }

    
    function showPassword() {
        var x = $('.password');
        // console.log(x);
        if('password' == x.attr('type')){
            x.prop('type', 'text');
        }else{
            x.prop('type', 'password');
        }
    }
</script>
@endsection
