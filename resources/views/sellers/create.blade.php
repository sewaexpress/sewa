@extends('layouts.app')

@section('content')

<div class="col-lg-6 col-lg-offset-3">
    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">{{__('Seller Information')}}</h3>
        </div>

        <!--Horizontal Form-->
        <!--===================================================-->
        <form class="form-horizontal" action="{{ route('sellers.store') }}" method="POST" enctype="multipart/form-data">
        	@csrf
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="name">{{__('Name')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{__('Name')}}" id="name" name="name" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="shop-name">{{__('Shop Name')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{__('Shop Name')}}" id="name" name="shop_name" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="email">{{__('Email Address')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{__('Email Address')}}" id="email" name="email" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="password">{{__('Password')}}</label>
                    <div class="col-sm-9">
                        <input type="password" placeholder="{{__('Password')}}" id="password" name="password" class="form-control" required>
                    </div>
                </div>
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">{{__('Category Commissions')}}</h3>
            </div>
            <div class="panel-body">
                @foreach (\App\Category::orderBy('created_at', 'desc')->get() as $key => $category)
                
                <div class="form-group">
                    <input type="hidden" name="arr[{{ $key }}][id]" value="{{ $category->id }}">
                    <label class="col-sm-3 control-label" for="{{$category->name}}">{{$category->name}}</label>
                    <div class="col-sm-7">
                        <input type="number" min="0" step="0.01" class="form-control" name="arr[{{ $key }}][commission_rate]" value="">
                    </div>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" value="%">
                    </div>
                </div>
                @endforeach
            </div>
            <div class="panel-footer text-right">
                <button class="btn btn-purple" type="submit">{{__('Save')}}</button>
            </div>
        </form>
        <!--===================================================-->
        <!--End Horizontal Form-->

    </div>
</div>

@endsection
