@extends('frontend.layouts.app')

@section('content')



    <section id="login-register-wrapper" class="py-5">
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-xl-4 col-lg-4 col-md-7 mx-auto form-wrapper">
                    <form class="px-xl-4 px-lg-4 px-md-5 px-3 py-4" role="form" action="{{ route('register') }}" method="POST">
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
                                <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                                    <input type="number" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent {{ $errors->has('phone') ? ' is-invalid' : '' }}" value="{{ old('phone') }}" id="phone" placeholder="Phone" name="phone">
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
                                <input type="password" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent {{ $errors->has('password') ? ' is-invalid' : '' }}" id="password" placeholder="Password" name="password">
                                <span class="input-group-addon">
                                <i class="fa fa-eye" onclick="showPassword()" aria-hidden="true" style="cursor: pointer"></i>

                                </span>
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
                            <button type="submit" class="btn-custom px-5 text-uppercase ">
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
