@extends('layouts.app')
@section('content')
    @php
    $refund_request_addon = \App\Addon::where('unique_identifier', 'refund_request')->first();
    @endphp
    <!-- Basic Data Tables -->
    <!--===================================================-->
    <div class="panel">
        <div class="panel-heading bord-btm clearfix pad-all h-100">
            <h3 class="panel-title pull-left pad-no">{{ __('Orders') }}</h3>
            <div class="pull-right clearfix">
                <form class="" id="sort_orders" action="" method="GET">
                    <div class="box-inline pad-rgt pull-left">
                        <div class="select" style="min-width: 300px;">
                            <select class="form-control demo-select2" name="payment_type" id="payment_type"
                                onchange="sort_orders()">
                                <option value="">{{ __('Filter by Payment Status') }}</option>
                                <option value="paid" @isset($payment_status) @if ($payment_status == 'paid') selected @endif @endisset>
                                    {{ __('Paid') }}</option>
                                <option value="unpaid" @isset($payment_status) @if ($payment_status == 'unpaid') selected @endif
                                    @endisset>{{ __('Un-Paid') }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="box-inline pad-rgt pull-left">
                        <div class="select" style="min-width: 300px;">
                            <select class="form-control demo-select2" name="delivery_status" id="delivery_status"
                                onchange="sort_orders()">
                                <option value="">{{ __('Filter by Deliver Status') }}</option>
                                <option value="pending" @isset($delivery_status) @if ($delivery_status == 'pending') selected @endif
                                    @endisset>{{ __('Pending') }}</option>
                                <option value="on_review" @isset($delivery_status) @if ($delivery_status == 'on_review') selected @endif
                                    @endisset>{{ __('On review') }}</option>
                                <option value="on_delivery" @isset($delivery_status) @if ($delivery_status == 'on_delivery') selected @endif
                                    @endisset>{{ __('On delivery') }}</option>
                                <option value="delivered" @isset($delivery_status) @if ($delivery_status == 'delivered') selected @endif
                                    @endisset>{{ __('Delivered') }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="box-inline pad-rgt pull-left">
                        <div class="" style="min-width: 200px;">
                            <input type="text" class="form-control" id="search" name="search"
                                @isset($sort_search) value="{{ $sort_search }}" @endisset
                                placeholder="Type Order code & hit Enter">
                        </div>
                    </div>
                </form>
                <button class="btn btn-primary" id="bulkDelBtn" onclick="deleteBulkData();">Delete</button>
                <button class="btn btn-primary" id="bulkDownloadBtn" onclick="downloadBulkInvoice();">Download
                    Invoice</button>
            </div>
        </div>
        <div class="panel-body">
            <form class="" id="sort_orders2" action="" method="GET">
                <input type="hidden" id="delivery_status2" name="delivery_status">
                <ul class="nav nav-pills">
                    <li role="presentation" class="sort_order2_li @if (!@isset($delivery_status)) active @endif"><a
                            href="javascript:void(0);">All</a></li>
                    <li role="presentation"
                        class="sort_order2_li @isset($delivery_status) @if ($delivery_status == 'pending') active @endif @endisset"
                        value="pending"><a href="javascript:void(0);">Pending</a></li>
                    <li role="presentation"
                        class="sort_order2_li @isset($delivery_status) @if ($delivery_status == 'on_review') active @endif @endisset"
                        value="on_review"><a href="javascript:void(0);">On Review</a></li>
                    <li role="presentation"
                        class="sort_order2_li @isset($delivery_status) @if ($delivery_status == 'on_delivery') active @endif @endisset"
                        value="on_delivery"><a href="javascript:void(0);">On Delivery</a></li>
                    <li role="presentation"
                        class="sort_order2_li @isset($delivery_status) @if ($delivery_status == 'delivered') active @endif @endisset"
                        value="delivered"><a href="javascript:void(0);">Delivered</a></li>
                </ul>
            </form>
            <table class="table table-striped res-table mar-no" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="checkAll"></th>
                        <th>#</th>
                        <th>{{ __('Order Code') }}</th>
                        <th>{{ __('Num. of Products') }}</th>
                        <th>{{ __('Customer') }}</th>
                        <th>{{ __('Amount') }}</th>
                        <th>{{ __('Delivery Status') }}</th>
                        <th>{{ __('Payment Method') }}</th>
                        <th>{{ __('Payment Status') }}</th>
                        @if ($refund_request_addon != null && $refund_request_addon->activated == 1)
                            <th>{{ __('Refund') }}</th>
                        @endif
                        <th width="10%">{{ __('Options') }}</th>
                    </tr>
                </thead>
                <tbody>

                    @foreach ($orders as $key => $order_id)
                        @php
                            $order = \App\Order::find($order_id->id);
                            // dd($order);
                            
                        @endphp
                        
                        @if ($order != null)
                            <tr>
                                <td><input type="checkbox" value="{{ $order->id }}" data-id="{{ $order->id }}"
                                        name="orderID[]" class="rowCheck"></td>
                                <td>
                                    {{ $key + 1 + ($orders->currentPage() - 1) * $orders->perPage() }}
                                </td>
                                <td>
                                    {{ $order->code }} @if ($order->viewed == 0) <span class="pull-right badge badge-info">{{ __('New') }}</span> @endif
                                </td>
                                <td>
                                    {{ count($order->orderDetails->whereIn('seller_id', (array)$admin_user_id)) }}
                                </td>
                                <td>
                                    @if ($order->user != null)
                                        {{ $order->user->name }}
                                    @else
                                        Guest ({{ $order->guest_id }})
                                    @endif
                                </td>
                                <td>
                                    {{ single_price($order->grand_total) }}

                                    {{-- {{ single_price($order->orderDetails->whereIn('seller_id', (array)$admin_user_id)->sum('price') + $order->orderDetails->whereIn('seller_id', (array)$admin_user_id)->sum('tax')) }} --}}
                                </td>
                                <td>
                                    @php
                                        $status = $order->orderDetails->first()->delivery_status;
                                    @endphp
                                    {{ ucfirst(str_replace('_', ' ', $status)) }}
                                </td>
                                <td>
                                    {{ ucfirst(str_replace('_', ' ', $order->payment_type)) }}
                                </td>
                                <td>
                                    <span class="badge badge--2 mr-4">
                                        @if ($order->payment_status == 'paid')
                                            <i class="bg-green"></i> Paid
                                        @else
                                            <i class="bg-red"></i> Unpaid
                                        @endif
                                    </span>
                                </td>
                                @if ($refund_request_addon != null && $refund_request_addon->activated == 1)
                                    <td>
                                        @if (count($order->refund_requests) > 0)
                                            {{ count($order->refund_requests) }} Refund
                                        @else
                                            No Refund
                                        @endif
                                    </td>
                                @endif
                                <td>
                                    <div class="btn-group dropdown">
                                        <button class="btn btn-primary dropdown-toggle dropdown-toggle-icon"
                                            data-toggle="dropdown" type="button">
                                            {{ __('Actions') }} <i class="dropdown-caret"></i>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right">
                                            <li><a
                                                    href="{{ route('orders.show', encrypt($order->id)) }}">{{ __('View') }}</a>
                                            </li>
                                            <li><a
                                                    href="{{ route('seller.invoice.download', $order->id) }}">{{ __('Download Invoice') }}</a>
                                            </li>
                                            <li><a
                                                    onclick="confirm_modal('{{ route('orders.destroy', $order->id) }}');">{{ __('Delete') }}</a>
                                            </li>
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
                    {{ $orders->appends(request()->input())->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script type="text/javascript">
        function sort_orders(el) {
            $('#sort_orders').submit();
        }
        $("#checkAll").click(function() {
            $(".rowCheck").prop('checked', $(this).prop('checked'));
        });

        function deleteBulkData() {
            var allIds = [];
            $(".rowCheck:checked").each(function() {
                allIds.push($(this).val());
            });
            if (allIds.length <= 0) {
                alert("Please select row.");
            } else {
                var check = confirm("Are you sure you want to perform bulk delete?");
                if (check == true) {
                    var join_checked_values = allIds.join(",");
                    $.ajax({
                        url: "{{ route('orders.bulkDelete') }}",
                        type: 'get',
                        data: {
                            'ids': join_checked_values
                        },
                        beforeSend: function() {
                            $(".myoverlay").css('display', 'block');
                        },
                        success: function(data) {
                            if (data['success']) {
                                $(".rowCheck:checked").each(function() {
                                    $(this).parents("tr").remove();
                                });
                                $(".myoverlay").css('display', 'none');
                                alert(data['success']);
                                
                               
                            } else if (data['error']) {
                                alert(data['error']);
                            } else {
                                alert('Whoops something went wrong');
                            }
                        },
                        error: function(data) {
                            alert(data.responseText);
                        },
                        complete: function() {

                        }
                    });
                    $.each(allIds, function(index, value) {
                        $('table tr').filter("[data-row-id='" + value + "']").remove();
                    });
                }
            }
        }



        function downloadBulkInvoice() {
            var allIds = [];
            $(".rowCheck:checked").each(function() {
                allIds.push($(this).val());
            });
            if (allIds.length <= 0) {
                alert("Please select row.");
            } else {
                var check = confirm("Are you sure you want to perform bulk download?");
                if (check == true) {
                    var join_checked_values = allIds.join(",");
                    $.ajax({
                        url: "{{ route('orders.downloadInvoice') }}",
                        type: 'get',
                        data: {
                            'ids': join_checked_values
                        },
                        xhrFields: {
                            responseType: 'blob',
                        },
                        beforeSend: function() {
                            $(".myoverlay").css('display', 'block');
                        },
                        success: function(data) {
                            var blob = new Blob([data], {
                                type: 'application/pdf'
                            });
                            console.log(blob);
                            var link = document.createElement('a');
                            link.href = window.URL.createObjectURL(blob);
                            link.download = "OrderInvoices.pdf";
                            link.click();
                           
                            $(".myoverlay").css('display', 'none');
                            alert('Invoice has been downloaded successfully');
                            $(".rowCheck").prop('checked', false);
                        },
                        error: function(data) {

                        }
                    });

                }
            }
        }

        function downloadFile(response) {
            var blob = new Blob([response], {
                type: 'application/pdf'
            })
            var url = URL.createObjectURL(blob);
            location.assign(url);
        }

        function downloadPdf(response) {
            var blob = new Blob([response]);
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = "Sample.pdf";
            link.click();
        }
        $(document).ready(function() {
            $('.sort_order2_li').on('click', function() {
                $('#delivery_status2').val($(this).attr('value'));
                $('#sort_orders2').submit();
            })
        })
    </script>
@endsection
