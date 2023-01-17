@extends('layouts.app')

@section('content')


<div class="row">
    <div class="col-lg-9">
        <div class="panel">
            <div class="panel-heading bord-btm">
                <h3 class="panel-title">{{__('App Referrers List')}}</h3>
            </div>
            @php
                if(\App\BusinessSetting::where('type', 'app_refer_point')->count() > 0){
                    $app_refer_point = \App\BusinessSetting::where('type', 'app_refer_point')->first()->value;
                }else{
                    $app_refer_point = 0;
                }
            @endphp
            <div class="panel-body">
                <table class="table table-striped table-bordered demo-dt-basic" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{{__('Referred By')}}</th>
                            <th>{{__('Refers')}}</th>
                            <th>{{__('Earnings')}}</th>
                            <th width="10%">{{__('Options')}}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @isset($list)
                            @foreach($list as $key => $attribute)
                                <tr>
                                    <td>{{$key+1}}</td>
                                    <td>{{$attribute['referred_by']['name']}}</td>
                                    <td>{{$attribute['count']}}</td>
                                    <td>{{$attribute['count']*$app_refer_point}}</td>
                                    <td>
                                        <button data-id="{{$attribute['referred_by']['id']}}" type="button" class="btn btn-primary get-list" data-toggle="modal" data-target=".bd-example-modal-lg">View</button>
                                       
                                        {{-- <div class="btn-group dropdown">
                                            <button class="btn btn-primary dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                                                {{__('Actions')}} <i class="dropdown-caret"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <li><a href="{{route('attributes.edit', encrypt($attribute->id))}}">{{__('Edit')}}</a></li>
                                            </ul>
                                        </div> --}}
                                    </td>
                                </tr>
                            @endforeach
                            
                        @endisset
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="panel">
            <div class="panel-heading bord-btm">
                <h3 class="panel-title">{{__('App Refer Point Cost')}}</h3>
            </div>
            <form action="{{ route('app_referral.update') }}" method="POST" enctype="multipart/form-data">
            <div class="panel-body">
                @csrf
                <input type="hidden" name="type" value="app_refer_point">
                <div class="form-group">
                    <div class="col-lg-12">
                        <input class="form-control" type="number" name="app_refer_point" value="{{ $app_refer_point }}">
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <button class="btn btn-primary" type="submit">{{__('Update')}}</button>
            </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Referrers List</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body referrers-list">
        </div>
      </div>
    </div>
  </div>

@endsection
@section('script')

<script>
    $('.get-list').on('click',function(){
        var url = "{{ route('get_referrers_list') }}";
        $.ajax({
            url: url,
            type: 'POST',
            data: {
                'cid': $(this).data('id')
            },
            success: function(response) {
                // console.log('asd');
                $('.referrers-list').html(response);
                // if (Object.keys(response).length > 0) {
                //     $.each(response, function(key, value) {
                //         $option = $('<option></option>').val(key).html(value);
                //         if (key == '{{ old('state_id') }}')
                //             $option = $option.attr("selected", "selected");
                //         $("#state").append($option);
                //     });
                // } else {
                //     $("#state").html('<option value="">Select State</option>');
                // }
            }
        });

    });
  </script>
@endsection
