@extends('frontend.layouts.app')

@section('content')
    <section class="gry-bg py-4 profile" id='affiliate_section'>
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
                                <div class="col-md-6 col-12 d-flex align-items-center">
                                    <h2 class="heading heading-6 text-capitalize strong-600 mb-0">
                                        {{__('App Referrals')}}
                                    </h2>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="float-md-right">
                                        <ul class="breadcrumb">
                                            <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                                            <li><a href="{{ route('dashboard') }}">{{__('Dashboard')}}</a></li>
                                            <li class="active"><a href="{{ route('customer.app.refer') }}">{{__('App Referrals')}}</a></li>
                                        </ul>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <div class="card no-border mt-3">
                                    <div class="card-header py-3" style="display: flex;justify-content: space-between;">
                                        <h4 class="mb-0 h6">{{__('Affiliate payment history')}}</h4>
                                        {{-- <h4 class="mb-0 h6">{{'Total Referrals : '.count($list)}}</h4> --}}
                                    </div>
                                    <div class="card-body table-responsive">
                                        <table class="table table-sm  mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>{{ __('Date') }}</th>
                                                    <th>{{__('Referred To')}}</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @if(count($list) > 0)
                                                    @foreach ($list as $key => $affiliate_payment)
                                                        <tr>
                                                            <td>{{ $key+1 }}</td>
                                                            <td>{{ date('Y-m-d', strtotime($affiliate_payment['created_at'])) }}</td>
                                                            <td>{{ ucfirst(isset($affiliate_payment['referred_to']['name'])?$affiliate_payment['referred_to']['name']:'User Not Found') }}</td>
                                                        </tr>
                                                    @endforeach
                                                @else
                                                    <tr>
                                                        <td class="text-center pt-5 h4" colspan="100%">
                                                            <i class="la la-meh-o d-block heading-1 alpha-5"></i>
                                                        <span class="d-block">{{ __('No history found.') }}</span>
                                                        </td>
                                                    </tr>
                                                @endif
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 col-sm-12">
                                <div class="card no-border mt-3">
                                    <div class="card-body table-responsive">
                                        <input type="hidden" value="{{$referral_code}}" id="referral-code">
                                        <p>Referral Code : {{$referral_code}} </p>
                                        <p>Total Refers Points : {{count($list)}}</p>
                                        {{-- <i class="fa fa-copy copy-link" data-link="{{$referral_code}}"></i> --}}

                                        <span onclick="copyToClipboard('{{$referral_code}}')" style="cursor: pointer;" id="ref-cpurl-btn" class="btn btn-success" data-referral="{{$referral_code}} " data-attrcpy="{{__('Copied')}}">{{__('Copy Code')}}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection


@section('script')
@endsection
