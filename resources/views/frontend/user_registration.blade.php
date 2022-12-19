@extends('frontend.layouts.app')

@section('content')



    <section id="login-register-wrapper" class="py-5">
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-xl-4 col-lg-4 col-md-7 mx-auto form-wrapper">
                    <form id="register-form" class="px-xl-4 px-lg-4 px-md-5 px-3 py-4" role="form" action="{{ route('register') }}" method="POST">
                        @csrf
                        <div class="text-center">
                            <h2 class="font-weight-bold my-xl-3 my-md-3 my-4">Register</h2>
                            <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                                <input type="text" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent {{ $errors->has('name') ? ' is-invalid' : '' }}" value="{{ old('name') }}" id="username" placeholder="Fullname" name="name">
                                <span class="input-group-addon">
                                    <i class="fa fa-user-o" ></i>
                                </span>
                                @if ($errors->has('name'))
                                <script> $('.input-group-addon').hide(); </script>
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                            {{-- @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                                <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                                    <input type="tel" id="phone-code" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent{{ $errors->has('phone') ? ' is-invalid' : '' }}" value="{{ old('phone') }}" placeholder="{{ __('Mobile Number') }}" name="phone">
                                    <span class="input-group-addon">
                                        <i class="text-md la la-phone"></i>
                                    </span>
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('phone') }}</strong>
                                    </span>
                                </div>

                                <input type="hidden" name="country_code" value="">

                                <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                                    <input type="email" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent {{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" id="email" placeholder="Email" name="email">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope-o" ></i>
                                    </span>
                                    @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                    @endif
                                </div>

                                <div class="form-group">
                                    <button class="btn btn-link p-0" type="button" onclick="toggleEmailPhone(this)">Use Email Instead</button>
                                </div>
                            @else --}}
                                <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                                    <input  type="email" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent {{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" id="email" placeholder="Email" name="email">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope-o" ></i>
                                    </span>
                                    @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                                    <input  type="number" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent {{ $errors->has('phone') ? ' is-invalid' : '' }}" value="{{ old('phone') }}" id="phone" placeholder="Phone" name="phone">
                                    <span class="input-group-addon">
                                        <i class="fa fa-phone" ></i>
                                    </span>
                                    @if ($errors->has('phone'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('phone') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            {{-- @endif --}}
                            <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                                <input id="firstPassword" type="password" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent {{ $errors->has('password') ? ' is-invalid' : '' }}" id="password" placeholder="Password" name="password">
                                <span class="input-group-addon">
                                <i class="fa fa-eye" onclick="showPassword()" aria-hidden="true" style="cursor: pointer"></i>

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
                                @if ($errors->has('password'))
                                <script> $('.input-group-addon').hide(); </script>
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                                @endif
                            </div>
                            <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                                <input type="password" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent" id="password_confirm" placeholder="Re-type Password" name="password_confirmation">
                                <span class="input-group-addon">
                                <i class="fa fa-eye" onclick="showConfirmPassword()" aria-hidden="true" style="cursor: pointer"></i>

                                </span>
                            </div>
                            <!-- <div class="row my-2">
                                    <div class="col-md-6">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                            <label class="form-check-label" for="defaultCheck1">
                                        Remember me
                                    </label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 text-xl-right text-lg-right text-center mt-xl-0 mt-lg-0 mt-2">
                                        <a href="#">Forgot Password?</a>
                                    </div>
                                </div> -->
                            <button id="submit" type="submit" class="btn-custom px-5 text-uppercase ">
                                Create an Account
                            </button>
                            <p class="text-center mt-4 custom-font-size">
                                Already have an account?
                                <span>
                                    <a href="{{ route('user.login') }}">Login</a>
                                </span>
                            </p>
                            <div class="row mb-4 px-3 justify-content-center align-items-center">
                                <h6 class="mb-xl-0 mb-md-2 mb-2 mr-2 custom-font-size">Sign in with</h6>
                                @if(\App\BusinessSetting::where('type', 'google_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                <div class="social-media d-flex justify-content-center h-100">
                                    @if (\App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1)
                                    <div class="facebook text-center mr-3">
                                        <a href="{{url('auth/facebook/redirect')}}" class="fa fa-facebook" ></a>
                                    </div>
                                    @endif
                                    @if(\App\BusinessSetting::where('type', 'google_login')->first()->value == 1)
                                    <div class="twitter text-center mr-3">
                                        <a href="{{url('auth/google/redirect')}}" class="fa fa-google" ></a>
                                    </div>
                                    @endif
                                    @if (\App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                        <div class="linkedin text-center mr-3">
                                            <a href="{{ route('social.login', ['provider' => 'twitter']) }}" class="fa fa-twitter" >
                                            </a>
                                        </div>
                                    @endif
                                </div>
                                @endif
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection

@section('script')

    <script type="text/javascript">
        $('#firstPassword').keyup(function() {
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
           var phone = $('#phone').val();
           if(name== ''){
              showFrontendAlert('danger','Name cannot be Empty')
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
            if(phone== ''){
                showFrontendAlert('danger','Phone number cannot be Empty')
                return false;
            }
            if(phone.length < 10){
                showFrontendAlert('danger','Phone number format not correct')
                return false;
            }
            var pswd = $('#firstPassword').val();
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
        var isPhoneShown = true;

        var input = document.querySelector("#phone-code");
        var iti = intlTelInput(input, {
            separateDialCode: true,
            preferredCountries: []
        });

        var countryCode = iti.getSelectedCountryData();


        input.addEventListener("countrychange", function() {
            var country = iti.getSelectedCountryData();
            $('input[name=country_code]').val(country.dialCode);
        });

        $(document).ready(function(){
            $('.email-form-group').hide();
        });

        function autoFillSeller(){
            $('#email').val('seller@example.com');
            $('#password').val('123456');
        }
        function autoFillCustomer(){
            $('#email').val('customer@example.com');
            $('#password').val('123456');
        }

        function toggleEmailPhone(el){
            if(isPhoneShown){
                $('.phone-form-group').hide();
                $('.email-form-group').show();
                isPhoneShown = false;
                $(el).html('Use Phone Instead');
            }
            else{
                $('.phone-form-group').show();
                $('.email-form-group').hide();
                isPhoneShown = true;
                $(el).html('Use Email Instead');
            }
        }

        function showPassword() {
            var x = document.getElementById("password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
        function showConfirmPassword() {
            var x = document.getElementById("password_confirm");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
@endsection
