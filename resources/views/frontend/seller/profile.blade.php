@extends('frontend.layouts.app')

@section('content')

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
                                        {{__('Manage Profile')}}
                                    </h2>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="float-md-right">
                                        <ul class="breadcrumb">
                                            <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                                            <li><a href="{{ route('dashboard') }}">{{__('Dashboard')}}</a></li>
                                            <li class="active"><a href="{{ route('profile') }}">{{__('Manage Profile')}}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form class="" action="{{ route('seller.profile.update') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Basic info')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Your Name')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3" placeholder="{{__('Your Name')}}" name="name" value="{{ Auth::user()->name }}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Your Email')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="email" class="form-control mb-3" placeholder="{{__('Your Email')}}" name="email" value="{{ Auth::user()->email }}" disabled>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Photo')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="file" name="photo" id="file-3" class="custom-input-file custom-input-file--4" data-multiple-caption="{count} files selected" accept="image/*" />
                                            <label for="file-3" class="mw-100 mb-3">
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
                                            <label>{{__('Old Password')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="password" class="form-control mb-3" placeholder="{{__('Old Password')}}" name="old_password">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Your Password')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input id="firstPasswordPofile" type="password" class="form-control mb-3" placeholder="{{__('New Password')}}" name="new_password">
                                            
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
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Confirm Password')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="password" class="form-control mb-3" placeholder="{{__('Confirm Password')}}" name="confirm_password">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Addresses')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row gutters-10">
                                        @php
                                            $existing_addresses = \App\Address::where('user_id',Auth::user()->id)->count()
                                        @endphp

                                        @if($existing_addresses > 0)
                                            @foreach (Auth::user()->addresses as $key => $address)
                                                @php
                                                    $delivery_location = 'empty';
                                                    if($address->delivery_location){
                                                        $delivery_location1  = \App\Location::where('id', $address->delivery_location)->first();
                                                        $delivery_location = $delivery_location1->name;
                                                        $delivery_disctrict = $delivery_location1->district;
                                                        $district  = \App\State::where('id', $delivery_disctrict)->first();
                                                    }
                                                @endphp
                                                <div class="col-lg-6">
                                                    <div class="border p-3 pr-5 rounded mb-3 position-relative">
                                                        <div>
                                                            <span class="alpha-6">Delivery Location:</span>
                                                            <span class="strong-600 ml-2">{{ isset($address)?$delivery_location:'' }}</span>
                                                        </div>
                                                        <div>                                                       
                                                            <span class="alpha-6">Country:</span>
                                                            <span class="strong-600 ml-2">{{ isset($address)?$address->country:'' }}</span>
                                                        </div>
                                                        <div>
                                                            <span class="alpha-6">District:</span>
                                                            <span class="strong-600 ml-2">                                                       
                                                                {{ isset($district)?$district->name:'' }}
                                                            </span>
                                                        </div>
                                                        <div>
                                                            <span class="alpha-6">Address:</span>
                                                            <span class="strong-600 ml-2">{{ $address->address }}</span>
                                                        </div>
                                                        {{-- <div>
                                                            <span class="alpha-6">Postal Code:</span>
                                                            <span class="strong-600 ml-2">{{ $address->postal_code }}</span>
                                                        </div> --}}
                                                        <div>
                                                            <span class="alpha-6">City:</span>
                                                            <span class="strong-600 ml-2">{{ $address->city }}</span>
                                                        </div>
                                                        <div>
                                                            <span class="alpha-6">Phone:</span>
                                                            <span class="strong-600 ml-2">{{ $address->phone }}</span>
                                                        </div>
                                                        @if ($address->set_default)
                                                            <div class="position-absolute right-0 bottom-0 pr-2 pb-3">
                                                                <span class="badge badge-primary bg-base-1">Default</span>
                                                            </div>
                                                        @endif
                                                        <div class="dropdown position-absolute right-0 top-0">
                                                            <button class="btn bg-gray px-2" type="button" data-toggle="dropdown">
                                                                <i class="la la-ellipsis-v"></i>
                                                            </button>
                                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                                                                @if (!$address->set_default)
                                                                    <a class="dropdown-item" href="{{ route('addresses.set_default', $address->id) }}">Make This Default</a>
                                                                @endif
                                                                {{-- <a class="dropdown-item" href="">Edit</a> --}}
                                                                <a class="dropdown-item" href="{{ route('addresses.destroy', $address->id) }}">Delete</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        @endif
                                        @if($existing_addresses >= 3)
                                        @else
                                            <div class="col-lg-6 mx-auto" onclick="add_new_address()">
                                                <div class="border p-3 rounded mb-3 c-pointer text-center bg-light">
                                                    <i class="la la-plus la-2x"></i>
                                                    <div class="alpha-7">Add New Address</div>
                                                </div>
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="form-box bg-white mt-4">
                                <div class="form-box-title px-3 py-2">
                                    {{__('Payment Setting')}}
                                </div>
                                <div class="form-box-content p-3">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Cash Payment')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <label class="switch mb-3">
                                                <input value="1" name="cash_on_delivery_status" type="checkbox" @if (Auth::user()->seller->cash_on_delivery_status == 1) checked @endif>
                                                <span class="slider round"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Bank Payment')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <label class="switch mb-3">
                                                <input value="1" name="bank_payment_status" type="checkbox" @if (Auth::user()->seller->bank_payment_status == 1) checked @endif>
                                                <span class="slider round"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Bank Name')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3" placeholder="{{__('Bank Name')}}" value="{{ Auth::user()->seller->bank_name }}" name="bank_name">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Bank Account Name')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3" placeholder="{{__('Bank Account Name')}}" value="{{ Auth::user()->seller->bank_acc_name }}" name="bank_acc_name">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Bank Account Number')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3" placeholder="{{__('Bank Account Number')}}" value="{{ Auth::user()->seller->bank_acc_no }}" name="bank_acc_no">
                                        </div>
                                    </div>
                                    {{-- <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Bank Routing Number')}}</label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="number" class="form-control mb-3" placeholder="{{__('Bank Routing Number')}}" value="{{ Auth::user()->seller->bank_routing_no }}" name="bank_routing_no">
                                        </div>
                                    </div> --}}
                                </div>
                            </div>
                            <div class="text-right mt-4">
                                <button  id="submit-user-profile" class="btn btn-styled btn-base-1 color-white">{{__('Update Profile')}}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="modal fade" id="new-address-modal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-zoom" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title" id="exampleModalLabel">{{__('New Address')}}</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form class="form-default" role="form" action="{{ route('addresses.store') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="p-3">
                            <div class="row">
                                <div class="col-md-2">
                                    <label>{{__('Country')}}</label>
                                </div>
                                <div class="col-md-10">
                                    <div class="mb-3">
                                        <select class="form-control mb-3 selectpicker" data-placeholder="{{__('Select your country')}}" name="country" required>
                                            @foreach (\App\Country::where('status', 1)->get() as $key => $country)
                                                <option value="{{ $country->name }}">{{ $country->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label>{{__('District')}}</label>
                                </div>
                                <div class="col-md-10">
                                    <div class="mb-3">
                                        <select class="form-control mb-3 selectpicker address-district" data-placeholder="{{__('Select your district')}}" name="district.
                                        " required>
                                        <option selected>Choose a District</option>
                                            @foreach (\App\State::where('country_id','154')->get() as $key => $country)
                                                <option value="{{ $country->id }}">{{ $country->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label>{{__('Location')}}</label>
                                </div>
                                <div class="col-md-10">
                                    <div class="mb-3">
                                        <select class="form-control mb-3 selectpicker address-location" data-placeholder="{{__('Select your location')}}" name="delivery_location" required>
                                            {{-- @foreach (\App\Location::get() as $key => $country)
                                                <option value="{{ $country->id }}">{{ $country->name }}</option>
                                            @endforeach --}}
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label>{{__('Address')}}</label>
                                </div>
                                <div class="col-md-10">
                                    <textarea class="form-control textarea-autogrow mb-3" placeholder="{{__('Your Address')}}" rows="1" name="address" required></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label>{{__('City')}}</label>
                                </div>
                                <div class="col-md-10">
                                    <input type="text" class="form-control mb-3" placeholder="{{__('Your City')}}" name="city" value="" required>
                                </div>
                            </div>
                            {{-- <div class="row">
                                <div class="col-md-2">
                                    <label>{{__('Postal code')}}</label>
                                </div>
                                <div class="col-md-10">
                                    <input type="text" class="form-control mb-3" placeholder="{{__('Your Postal Code')}}" name="postal_code" value="" required>
                                </div>
                            </div> --}}
                            <div class="row">
                                <div class="col-md-2">
                                    <label>{{__('Phone')}}</label>
                                </div>
                                <div class="col-md-10">
                                    <input id="phone2" type="number" class="form-control mb-3" placeholder="{{__('+9801234567')}}" name="phone" value="" maxlength="10" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-base-1 color-white">{{ __('Save') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script type="text/javascript">
        $('#phone2').on('keypress', function(e) {
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
        function add_new_address(){
            $('#new-address-modal').modal('show');
        }
    </script>
<script type="text/javascript">
    $('#firstPasswordPofile').keyup(function() {
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
    
    function containsUppercase(str) {
            return /[A-Z]/.test(str);
            }
            function containsNumbers(str) {
            return /\d/.test(str);
            }
    $('#submit-user-profile').click(function(e){
            console.log('1');
            exit;
            e.stopImmediatePropagation();
            var pswd = $('#firstPasswordPofile').val();
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
            exit;
            $('#register-form').submit();
          });
</script>
@endsection
