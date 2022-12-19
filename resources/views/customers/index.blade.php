@extends('layouts.app')

@section('content')

<div class="row">
    <div class="col-sm-12">
        <!-- <a href="{{ route('sellers.create')}}" class="btn btn-info pull-right">{{__('add_new')}}</a> -->
    </div>
</div>

<br>

<!-- Basic Data Tables -->
<!--===================================================-->
<div class="panel">
    <div class="panel-heading bord-btm clearfix pad-all h-100">
        <h3 class="panel-title pull-left pad-no">{{__('Customers')}}</h3>
        <div class="pull-right clearfix">
            <form class="" id="sort_customers" action="" method="GET">
                <div class="box-inline pad-rgt pull-left">
                    <div class="" style="min-width: 200px;">
                        <input type="text" class="form-control" id="search" name="search"@isset($sort_search) value="{{ $sort_search }}" @endisset placeholder=" Type email or name & Enter">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel-body">
        <table class="table table-striped res-table mar-no" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>#</th>
                    <th>{{__('Name')}}</th>
                    <th>{{__('Email Address')}}</th>
                    <th>{{__('Phone')}}</th>
                    {{-- <th>{{__('Package')}}</th> --}}
                    {{-- <th>{{__('Wallet Balance')}}</th> --}}
                    <th width="10%">{{__('Options')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($customers as $key => $customer)
                    @if ($customer->user != null)
                        <tr>
                            <td>{{ ($key+1) + ($customers->currentPage() - 1)*$customers->perPage() }}</td>
                            <td>{{$customer->user->name}}</td>
                            <td>{{$customer->user->email}}</td>
                            <td>{{$customer->user->phone}}</td>
                            {{-- <td>
                                @if ($customer->user->customer_package != null)
                                    {{$customer->user->customer_package->name}}
                                @endif
                            </td> --}}
                            {{-- <td>{{single_price($customer->user->balance)}}</td> --}}
                            <td>
                                <div class="btn-group dropdown">
                                    <button class="btn btn-primary dropdown-toggle dropdown-toggle-icon" data-toggle="dropdown" type="button">
                                        {{__('Actions')}} <i class="dropdown-caret"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li><a onclick="confirm_verify('{{route('user.verify', $customer->user->id)}}');">{{__('Verify User')}}</a></li>

                                        <li><a onclick="confirm_modal('{{route('customers.destroy', $customer->id)}}');">{{__('Delete')}}</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    @endif
                @endforeach
            </tbody>
        </table>
        <div class="clearfix">
            <div class="pull-right">
                {{ $customers->appends(request()->input())->links() }}
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="confirm-verify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                {{-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> --}}
                <h4 class="modal-title" id="myModalLabel">{{__('Confirmation')}}</h4>
            </div>

            <div class="modal-body">
                <p>{{__('Are you sure?')}}</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{{__('Cancel')}}</button>
                <a id="verify_link" class="btn btn-danger btn-ok">{{__('Verify')}}</a>
            </div>
        </div>
    </div>
</div>
@endsection
@section('script')
    <script type="text/javascript">
    
        function confirm_verify(delete_url)
        {
            jQuery('#confirm-verify').modal('show', {backdrop: 'static'});
            document.getElementById('verify_link').setAttribute('href' , delete_url);
        }
        function sort_customers(el){
            $('#sort_customers').submit();
        }
    </script>
@endsection
