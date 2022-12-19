{{-- <a href="{{ route('compare') }}" class="nav-box-link">
    <img data-toggle="tooltip" data-placement="top" title="Compare" src="{{asset('frontend/images/coma.svg')}}" alt="cart-logo" class="img-fluid img_sag">
    @if(Session::has('compare'))
        <sup class="nav-box-number">{{ count(Session::get('compare'))}}</sup>
    @else
        <sup class="nav-box-number">0</sup>
    @endif
</a> --}}

<a href="{{ route('compare') }}" class="position-relative">
    <img data-toggle="tooltip" data-placement="top" title="" data-original-title="Compare"
       src="{{asset('./frontend/assets/images/logo/compare.svg')}}" class="img-fluid" alt="" />
       @if(Session::has('compare'))
       <sup class="sub_block">{{ count(Session::get('compare'))}}</sup>
    @else
       <sup class="sub_block">0</sup>
 @endif
</a>