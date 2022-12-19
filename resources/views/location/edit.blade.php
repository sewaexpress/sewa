@extends('layouts.app')

@section('content')

<div class="row">
    <div class="col-sm-12">
        <a href="{{ route('locations.index')}}" class="btn btn-rounded btn-info pull-right">{{__('View Locations')}}</a>
    </div>
</div>

<br>

<div class="panel">
    <div class="panel-heading bord-btm clearfix pad-all h-100">
        <h3 class="panel-title pull-left pad-no">{{__('Edit Location')}}</h3>
    </div>
    <div class="panel-body">
        <form class="form-horizontal" action="{{ route('locations.update', $location->id) }}" method="POST" enctype="multipart/form-data">
        	@csrf
            <input type="hidden" name="_method" value="PATCH">
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="address">{{__('Address')}}</label>
                    <div class="col-sm-9">
                        <input type="text" placeholder="{{__('Address')}}" name="address" value="{{ $location->name }}" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="delivery_charge">{{__('Delivery Charge')}}</label>
                    <div class="col-sm-9">
                        <input type="number" min="0" value="{{$location->delivery_charge}}" step="0.01" placeholder="{{__('Delivery Charge')}}" name="delivery_charge" class="form-control" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label" for="name">{{__('District')}}</label>
                    <div class="col-lg-9">
                        <select name="state" class="form-control demo-select2" required>
                            <option value="" selected>Select One</option>
                            @if (isset($districts) && !empty($districts))
                                @foreach ($districts as $a => $b)
                                    <option {{($b->id == $location->district)?'selected':''}} value="{{$b->id}}">{{$b->name}}</option>
                                @endforeach                                
                            @else
                                <option value="" disabled>District Empty</option>
                            @endif
                        </select>
                    </div>
                </div>

            </div>
            <div class="panel-footer text-right">
                <button class="btn btn-purple" type="submit">{{__('Update')}}</button>
            </div>
        </form>
    </div>
</div>
@endsection