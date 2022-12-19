@extends('frontend.layouts.app')
@section('content')
 <!-- Login Register -->

 



 <section id="login-register-wrapper" class="py-5">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-4 col-md-7 mx-auto form-wrapper">
                <form class="px-3 py-4" action="{{ route('login') }}" method="POST">
                    @csrf
                    @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                    <span>{{ __('Use country code before number') }}</span>
                    @endif
                    <div class="text-center">
                        <h2 class="font-weight-bold title my-xl-3 my-md-3 my-4">Login</h2>
                        <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                            {{-- @if (\App\Addon::where('unique_identifier', 'otp_system')->first() != null && \App\Addon::where('unique_identifier', 'otp_system')->first()->activated)
                            <input type="email"
                                class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent {{ $errors->has('email') ? ' is-invalid' : '' }}"
                                id="username" value="{{ old('email') }}" placeholder="Email" name="email">

                            <i class="fa fa-user-o" aria-hidden="true"></i>
                            @else --}}
                            <input type="email"
                                class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none bg-transparent {{ $errors->has('email') ? ' is-invalid' : '' }}"
                                id="username" value="{{ old('email') }}" placeholder="Email" name="email">
                            {{-- @endif --}}
                        </div>
                        <div class="form-group position-relative mb-xl-4 mb-md-3 mb-2">
                            <input type="password" class="form-control border-top-0 border-right-0 border-left-0 rounded-0
                                    shadow-none bg-transparent {{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" id="password" placeholder="Type Password">
                            <i class="fa fa-eye" onclick="showPassword()" aria-hidden="true" style="cursor: pointer"></i>
                        </div>
                        <div class="row my-2">
                            <div class="col-md-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="remember" name="remember" {{ old('remember') ? 'checked' : '' }} >
                                    <label class="form-check-label custom-font-size" for="defaultCheck1">
                                        Remember me
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6 text-xl-right text-lg-right text-center mt-xl-0 mt-lg-0 mt-2">
                                <a href="{{ route('password.request') }}">Forgot Password?</a>
                            </div>
                        </div>
                        <button class="btn-custom text-uppercase text-white py-2" type="submit">
                        Login
                        </button>
                        <p class="text-center mt-4 custom-font-size">
                            Don't have an account?
                            <span>
                                <a href="{{ route('user.registration') }}">Register</a>
                            </span>
                        </p>
                        @if(\App\BusinessSetting::where('type', 'google_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1 || \App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                        <div class="row mb-4 px-3 justify-content-center align-items-center">
                            <h6 class="mb-xl-0 mb-md-2 mb-2 mr-2 custom-font-size">Sign in with</h6>
                            <div class="social-media d-flex justify-content-center h-100">
                                @if (\App\BusinessSetting::where('type', 'facebook_login')->first()->value == 1)
                                <div class="facebook text-center mr-3">
                                    <a href="{{url('auth/facebook/redirect')}}" class="fa fa-facebook" aria-hidden="true"></a>

                                    {{-- <a class="fa fa-facebook" aria-hidden="true"></a> --}}
                                </div>
                                @endif
                                @if(\App\BusinessSetting::where('type', 'google_login')->first()->value == 1)
                                <div class="twitter text-center mr-3">
                                    <a href="{{url('auth/google/redirect')}}" class="fa fa-google" aria-hidden="true"></a>

                                    {{-- <a class="fa fa-google" aria-hidden="true"></a> --}}
                                </div>
                                @endif
                                @if (\App\BusinessSetting::where('type', 'twitter_login')->first()->value == 1)
                                <div class="linkedin text-center mr-3">
                                    <a href="{{ route('social.login', ['provider' => 'twitter']) }}" class="fa fa-twitter" aria-hidden="true"></a>

                                    {{-- <a class="fa fa-twitter" aria-hidden="true"></a> --}}
                                </div>
                                @endif
                            </div>
                        </div>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- Login Register Ends -->
@endsection
@section('script')
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
            var x = document.getElementById("password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
@endsection