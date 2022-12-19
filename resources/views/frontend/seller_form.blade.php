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
                        <form class="" action="{{ route('shops.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            If you are already registerd, <a href="#" data-toggle="modal" data-target="#GuestCheckout">Login</a> here

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
                                                        <input type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" value="{{ old('name') }}" placeholder="{{ __('Name') }}" name="name">
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
                                                        <input type="number" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" value="{{ old('phone') }}" placeholder="{{ __('Phone') }}" name="phone">
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
                                                        <input type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" value="{{ old('email') }}" placeholder="{{ __('Email') }}" name="email">
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
                                                        <input type="password" class="password form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="{{ __('Password') }}" name="password">
                                                        <span class="input-group-addon">
                                                            <i class="text-md la la-eye" onclick="showPassword()" style="cursor: pointer;line-height: 0px"></i>
                                                            {{-- <i class="text-md la la-lock"></i> --}}
                                                        </span>
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
                                            <input type="text" class="form-control mb-3" placeholder="{{__('Shop Name')}}" name="name" required>
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
                                            <input type="text" class="form-control mb-3" placeholder="{{__('Address')}}" name="address" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Pan')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control mb-3" placeholder="{{__('Pan')}}" name="pan" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">
                                            <label>{{__('Location')}} <span class="required-star">*</span></label>
                                        </div>
                                        <div class="col-md-10">
                                            @if (count($locations)>0)
                                                <select name="location[]" class="form-control js-example-basic-multiple" multiple="multiple" required>
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
                                            <input type="checkbox" class="" placeholder="{{__('Pan')}}" name="read" required>
                                            <label>{{__('I have read and agreed to the ')}} <a href="javascript:void(0);" class="view-seller-policy" data-bs-toggle="modal" data-bs-target="#exampleModal222">seller policy</a> <span class="required-star">*</span></label>
                                        
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-right mt-4">

                                <button type="submit" class="btn btn-styled btn-base-1">{{__('Save')}}</button>
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
    $(document).ready(function() {
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
