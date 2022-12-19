@extends('layouts.app')

@section('content')

<div class="row">
    <div class="col-sm-12">
        <a data-toggle="modal" data-target="#exampleModal" class="btn btn-rounded btn-info pull-right">{{__('Send New Notification')}}</a>
    </div>
</div>

<br>

<!-- Basic Data Tables -->
<!--===================================================-->
<div class="panel">
    <div class="panel-heading bord-btm clearfix pad-all h-100">
        <h3 class="panel-title pull-left pad-no">{{__('Notification')}}</h3>
        <div class="pull-right clearfix">
            <form class="" id="sort_flash_deals" action="" method="GET">
                <div class="box-inline pad-rgt pull-left">
                    <div class="" style="min-width: 200px;">
                        <input type="text" class="form-control" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder=" Type name & Enter">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel-body">
        <table class="table res-table table-responsive mar-no" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>#</th>
                    <th>{{__('To')}}</th>
                    <th>{{ __('Message') }}</th>
                    <th>{{ __('Sent At') }}</th>
                </tr>
            </thead>
            <tbody>
               @foreach ($blog as $blogs )
               <tr>
                    <td>{{ $loop->iteration ++ }}</td>
                   <td>{{ ($blogs->user)?$blogs->user->name:'All' }}</td>
                   <td>{{ $blogs->message }}</td>
                   <td>{{ date('D , d M, Y',strtotime($blogs->created_at)) }}</td>
                </tr>
               @endforeach
            </tbody>
        </table>

    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Send Notification</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form action="{{route('notifications.store')}}" method="post">
            @csrf
            <div class="modal-body">
                <div class="row">
                    <div class="form-group">
                        <label for="user_id">Send To</label>
                        <select class="form-control select2" name="user_id" id="user_id" required>
                            <option value="all">All Users</option>
                            @foreach ($users as $key => $user)
                                <option value="{{$user->id}}">{{$user->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea class="form-control" name="message" id="message" cols="30" rows="10" required></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Send</button>
            </div>
        </form>
      </div>
    </div>
@endsection


@section('script')
    <script type="text/javascript">
       function update_blog_published(el){
        if(el.checked){
            var status = 1;
        }
        else{
            var status = 0;
        }
    }
    </script>
@endsection


