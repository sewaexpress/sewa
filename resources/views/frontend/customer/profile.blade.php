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
                      Profile</a>
                   </li>
                  
                </ol>
             </nav>
          </div>
       </div>
    </div>
</section>

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
                    <form class="" action="{{ route('customer.profile.update') }}" method="POST" enctype="multipart/form-data">
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
                                        <label>{{__('Your Phone')}}</label>
                                    </div>
                                    <div class="col-md-10">
                                        <input type="phone" class="form-control mb-3" placeholder="{{__('Your Phone')}}" name="phone" value="{{ Auth::user()->phone }}">
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
                                        <input type="password" class="form-control mb-3" placeholder="{{__('New Password')}}" name="new_password">
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

                        <div class="text-right mt-4">
                            <button type="submit" class="btn btn-styled btn-base-1 color-white">{{__('Update Profile')}}</button>
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
                                            <div class="col-lg-6">
                                                <div class="border p-3 pr-5 rounded mb-3 position-relative">
                                                    @php
                                                        $delivery_location = 'empty';
                                                        if($address->delivery_location){
                                                            $delivery_location1  = \App\Location::where('id', $address->delivery_location)->first();
                                                            $delivery_location = $delivery_location1->name;
                                                            $delivery_disctrict = $delivery_location1->district;
                                                            $district  = \App\State::where('id', $delivery_disctrict)->first();
                                                        }
                                                    @endphp
                                                    <div class='mb-2'>
                                                        <span class="alpha-6">Delivery Location:</span>
                                                        <span class="strong-600 ml-2">{{ isset($address)?$delivery_location:'' }}</span>
                                                    </div>
                                                    <div class='mb-2'>
                                                        <span class="alpha-6">Country:</span>
                                                        <span class="strong-600 ml-2">{{ isset($address)?$address->country:'' }}</span>
                                                    </div>
                                                    <div class='mb-2'>
                                                        <span class="alpha-6">District:</span>
                                                        <span class="strong-600 ml-2">                                                       
                                                            {{ isset($district)?$district->name:'' }}
                                                        </span>
                                                    </div>
                                                    <div class='mb-2'>
                                                        <span class="alpha-6">Address:</span>
                                                        <span class="strong-600 ml-2">{{ isset($address)?$address->address:'' }}</span>
                                                    </div>
                                                    {{-- <div class='mb-2'>
                                                        <span class="alpha-6">Postal Code:</span>
                                                        <span class="strong-600 ml-2">{{ isset($address)?$address->postal_code:''  }}</span>
                                                    </div> --}}
                                                    <div class='mb-2'>
                                                        <span class="alpha-6">City:</span>
                                                        <span class="strong-600 ml-2">{{ isset($address)?$address->city:''  }}</span>
                                                    </div>
                                                    <div class='mb-2'>
                                                        <span class="alpha-6">Phone:</span>
                                                        <span class="strong-600 ml-2">{{ isset($address)?$address->phone:''  }}</span>
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
                                            <option value="{{ $country->name }}" {{($country->name == 'Nepal')?'selected':''}}>{{ $country->name }}</option>
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
                                    <select class="form-control mb-3 selectpicker address-location" data-placeholder="{{__('Select your country')}}" name="delivery_location" required>
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
                                <input type="number" class="form-control mb-3" placeholder="{{__('9801234567')}}" name="phone" value="" maxlength="10" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required>
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
    function add_new_address(){
        $('#new-address-modal').modal('show');
    }
</script>
@endsection
