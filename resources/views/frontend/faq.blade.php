@extends('frontend.layouts.app')


@section('content')
<style>
#accordionExample .card-header {
    background:#258aff;
 
}
#accordionExample .card-header button {
    color: #fff; 
}

</style>
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col">
                <ul class="breadcrumb">
                    <li><a href="{{ route('home') }}">{{__('Home')}}</a></li>
                    <li>FAQ</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<section class="gry-bg py-4">
    <div class="container sm-px-0">
        <div class="row">
            <div class="accordion w-100" id="accordionExample">
                @if (isset($faq) && !($faq->isEmpty()))
                @foreach ($faq as $a => $item)
                    <div class="card mb-3">
                        <div class="card-header py-1" id="{{$a}}">
                            <h2 class="mb-0">
                                <button class="btn btn-link w-100 text-left p-0" type="button" data-toggle="collapse" data-target="#collapse{{$a}}" aria-expanded="true" aria-controls="collapse{{$a}}">
                                    {{$item->title}}
                                </button>
                            </h2>
                        </div>

                        <div id="collapse{{$a}}" class="collapse {{($a == 0)?'show':''}}" aria-labelledby="heading{{$a}}" data-parent="#accordionExample">
                            <div class="card-body">
                                {!!($item->description)!!}
                            </div>
                        </div>
                    </div>
                @endforeach

                @else
                <p>Nothing to show!</p>
                @endif
            </div>
        </div>
    </div>
</section>
@endsection