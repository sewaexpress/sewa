@extends('layouts.app')

@section('content')
    <div class="panel">
    	<div class="panel-body">
    		<div class="invoice-masthead">
    			<div class="invoice-text">
    				<h3 class="h1 text-thin mar-no text-primary">{{ __('Order Details') }}</h3>
    			</div>
    		</div>

			<?php 
				$seller_id=\App\OrderDetail::where('order_id',$order->id)->pluck('seller_id');
				$admin_id=\App\User::where('user_type','admin')->pluck('id');
			?>
			{{-- @if ($seller_id==$admin_id) --}}
				
            <div class="row">
                @php
                    $delivery_status = $order->orderDetails->first()->delivery_status;
                    $payment_status = $order->orderDetails->first()->payment_status;
                @endphp
				
                <div class="col-lg-3">
					<div class="row no-print">
						<a href="javascript:void(0);" data-id="{{($order->id) }}" class="btn btn-default print-invoice">
							<i class="demo-pli-printer icon-lg"></i>
						</a>
						<a href="{{ route('seller.invoice.download', $order->id) }}" class="btn btn-default">
							<i class="fa fa-download icon-lg"></i>
						</a>
					</div>
                </div>
                <div class="col-lg-offset-6 col-lg-3">
                    <label for="update_payment_status">{{__('Payment Status')}}</label>
                    <select class="form-control demo-select2"  data-minimum-results-for-search="Infinity" id="update_payment_status">
                        <option value="paid" @if ($payment_status == 'paid') selected @endif>{{__('Paid')}}</option>
                        <option value="unpaid" @if ($payment_status == 'unpaid') selected @endif>{{__('Unpaid')}}</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <label for="update_delivery_status">{{__('Delivery Status')}}</label>
                    <select class="form-control demo-select2"  data-minimum-results-for-search="Infinity" id="update_delivery_status">
                        <option value="pending" @if ($delivery_status == 'pending') selected @endif>{{__('Pending')}}</option>
                        <option value="on_review" @if ($delivery_status == 'on_review') selected @endif>{{__('On review')}}</option>
                        <option value="on_delivery" @if ($delivery_status == 'on_delivery') selected @endif>{{__('On delivery')}}</option>
                        <option value="delivered" @if ($delivery_status == 'delivered') selected @endif>{{__('Delivered')}}</option>
						<option value="cancel" @if ($delivery_status == 'cancel') selected @endif>{{__('Cancel')}}</option>
                    </select>
                </div>
            </div>
            <hr>
			{{-- @endif --}}

    		<div class="invoice-bill row">
    			<div class="col-sm-6 text-xs-center">
    				<address>
        				<strong class="text-main">
        				    
        				</strong><br>
                         {{ json_decode($order->shipping_address)->phone }}<br>
        				 {{ json_decode($order->shipping_address)->address }}, {{ json_decode($order->shipping_address)->city }}, {{ json_decode($order->shipping_address)->country }}
                    </address>
                    @if ($order->manual_payment && is_array(json_decode($order->manual_payment_data, true)))
                        <br>
                        <strong class="text-main">{{ __('Payment Information') }}</strong><br>
                        Name: {{ json_decode($order->manual_payment_data)->name }}, Amount: {{ single_price(json_decode($order->manual_payment_data)->amount) }}, TRX ID: {{ json_decode($order->manual_payment_data)->trx_id }}
                        <br>
                        <a href="{{ asset(json_decode($order->manual_payment_data)->photo) }}" target="_blank"><img src="{{ asset(json_decode($order->manual_payment_data)->photo) }}" alt="" height="100"></a>
                    @endif
    			</div>
    			<div class="col-sm-6 text-xs-center">
    				<table class="invoice-details">
    				<tbody>
    				<tr>
    					<td class="text-main text-bold">
    						{{__('Order #')}}
    					</td>
    					<td class="text-right text-info text-bold">
    						{{ $order->code }}
    					</td>
    				</tr>
    				<tr>
    					<td class="text-main text-bold">
    						{{__('Order Status')}}
    					</td>
                        @php
                            $status = $order->orderDetails->first()->delivery_status;
                        @endphp
    					<td class="text-right">
                            @if($status == 'delivered')
                                <span class="badge badge-success">{{ ucfirst(str_replace('_', ' ', $status)) }}</span>
                            @else
                                <span class="badge badge-info">{{ ucfirst(str_replace('_', ' ', $status)) }}</span>
                            @endif
    					</td>
    				</tr>
    				<tr>
    					<td class="text-main text-bold">
    						{{__('Order Date')}}
    					</td>
    					<td class="text-right">
    						{{ date('d-m-Y h:i A', $order->date) }} (UTC)
    					</td>
    				</tr>
                    <tr>
    					<td class="text-main text-bold">
    						{{__('Total amount')}}
    					</td>
    					<td class="text-right">
    						{{ single_price($order->orderDetails->sum('price') + $order->orderDetails->sum('tax')) }}
    					</td>
    				</tr>
                    <tr>
    					<td class="text-main text-bold">
    						{{__('Payment method')}}
    					</td>
    					<td class="text-right">
    						{{ ucfirst(str_replace('_', ' ', $order->payment_type)) }}
    					</td>
    				</tr>
    				</tbody>
    				</table>
    			</div>
    		</div>
    		<hr class="new-section-sm bord-no">
    		<div class="row">
    			<div class="col-lg-12 table-responsive">
    				<table class="table table-bordered invoice-summary">
        				<thead>
            				<tr class="bg-trans-dark">
                                <th class="min-col">#</th>
                                <th width="10%">
            						{{__('Photo')}}
            					</th>
								<th class="text-uppercase">
									{{__('Seller')}}
								</th>
            					<th class="text-uppercase">
            						{{__('Description')}}
            					</th>
                                <th class="text-uppercase">
            						{{__('Delivery Type')}}
            					</th>
            					<th class="min-col text-center text-uppercase">
            						{{__('Qty')}}
            					</th>
            					<th class="min-col text-center text-uppercase">
            						{{__('Price')}}
            					</th>
            					<th class="min-col text-right text-uppercase">
            						{{__('Total')}}
            					</th>
            				</tr>
        				</thead>
        				<tbody>
                            @php
                                // $admin_user_id = \App\User::where('user_type', 'admin')->first()->id;
                            @endphp
                            {{-- @foreach ($order->orderDetails->where('seller_id', $admin_user_id) as $key => $orderDetail) --}}
							@foreach($order->orderDetails as $key => $orderDetail)
							{{-- {{dd($orderDetail->product)}} --}}
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td>
                                        @if ($orderDetail->product != null)
                    						<a href="{{ route('product', $orderDetail->product->slug) }}" target="_blank">
												@if (!empty($orderDetail->product->featured_img))
													@if (file_exists($orderDetail->product->featured_img))
														<img height="50" src={{ asset($orderDetail->product->featured_img) }}></a>	
													@else
														<img height="50" src={{ asset('frontend/images/placeholder.jpg') }}></a>	
													@endif
												@else
													<img height="50" src={{ asset('frontend/images/placeholder.jpg') }}></a>	
												@endif
                                        @else
                                            <strong>{{ __('N/A') }}</strong>
                                        @endif
                                    </td>
									<td>
										@if ($orderDetail->shop != null)
											<strong>													
												{{-- <a href="{{ route('product', $orderDetail->product->slug) }}" target="_blank"> --}}
													{{ $orderDetail->shop->name }}
												{{-- </a> --}}
											</strong>
											{{-- <small>{{ $orderDetail->variation }}</small> --}}
										@else
											<strong>{{ __('Shop Unavailable') }}</strong>
										@endif
									</td>
                					<td>
                                        @if ($orderDetail->product != null)
                    						<strong><a href="{{ route('product', $orderDetail->product->slug) }}" target="_blank">{{ $orderDetail->product->name }}</a></strong>
                    						<small>{{ $orderDetail->variation }}</small>
                                        @else
                                            <strong>{{ __('Product Unavailable') }}</strong>
                                        @endif
                					</td>
                                    <td>
                                        @if ($orderDetail->shipping_type != null && $orderDetail->shipping_type == 'home_delivery')
                                            {{ __('Home Delivery') }}
                                        @elseif ($orderDetail->shipping_type == 'pickup_point')
                                            @if ($orderDetail->pickup_point != null)
                                                {{ $orderDetail->pickup_point->name }} ({{ __('Pickup Point') }})
                                            @else
                                                {{ __('Pickup Point') }}
                                            @endif
                                        @endif
                                    </td>
                					<td class="text-center">
                						{{ $orderDetail->quantity }}
                					</td>
                					<td class="text-center">
                						{{ single_price($orderDetail->price/$orderDetail->quantity) }}
                					</td>
                                    <td class="text-center">
                						{{ single_price($orderDetail->price) }}
                					</td>
                				</tr>
                            @endforeach
        				</tbody>
    				</table>
    			</div>
    		</div>
    		<div class="clearfix">
    			<table class="table invoice-total">
    			<tbody>
    			<tr>
    				<td>
    					<strong>{{__('Sub Total')}} :</strong>
    				</td>
    				<td>
						{{ single_price($order->orderDetails->sum('price')) }}

    					{{-- {{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('price')) }} --}}


    				</td>
    			</tr>
    			<tr>
    				<td>
    					<strong>{{__('Tax')}} :</strong>
    				</td>
    				<td>
    					{{ single_price($order->orderDetails->sum('tax')) }}

    					{{-- {{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('tax')) }} --}}
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<strong>{{__('Delivery Charge')}} :</strong>
    				</td>
    				<td>
    					{{ single_price($order->location_charge) }}

    					{{-- {{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('tax')) }} --}}
    				</td>
    			</tr>
                <tr>
    				<td>
    					<strong>{{__('Total Shipping')}} :</strong>
    				</td>
    				<td>
						@php
							//shipping charges of either flat or product wise
							$shipping = $order->orderDetails->sum('shipping_cost');
							$shipping += $order->location_charge;
						@endphp
    					{{ single_price($shipping) }}

    					{{-- {{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('shipping_cost')) }} --}}
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<strong>{{__('TOTAL')}} :</strong>
    				</td>
    				<td class="text-bold h4">
    					{{ single_price($order->grand_total) }}

    					{{-- {{ single_price($order->orderDetails->where('seller_id', $admin_user_id)->sum('price') + $order->orderDetails->where('seller_id', $admin_user_id)->sum('tax') + $order->orderDetails->where('seller_id', $admin_user_id)->sum('shipping_cost')) }} --}}
    				</td>
    			</tr>
    			</tbody>
    			</table>
    		</div>
			@if (!empty($order->note))
				<div class="text-left no-print">
					Order Note : {{($order->note) }}
				</div>					
			@endif
    		{{-- <div class="text-right no-print">
				<a href="javascript:void(0);" data-id="{{($order->id) }}" class="btn btn-default print-invoice">
					print invoice
				</a>

    			<a href="{{ route('seller.invoice.download', $order->id) }}" class="btn btn-default"><i class="demo-pli-printer icon-lg"></i></a>
    		</div> --}}
    	</div>
    </div>
    <div class="panel no-print">
    	<div class="panel-body">				
            <div class="row">
                <div class="col-lg-12">
					<h2>Tracking Code Bar Code</h2>
					<img alt='Tracking code Bar' src='https://barcode.tec-it.com/barcode.ashx?data={{ $order->code }}&code=Code128&translate-esc=on'/>
                </div>
                <div class="col-lg-12">
					<h2>Shipping Address QR Code</h2>
					<img alt='Tracking code Bar' src='https://qrcode.tec-it.com/API/QRCode?data={{ json_decode($order->shipping_address)->address }}, {{ json_decode($order->shipping_address)->city }}, {{ json_decode($order->shipping_address)->country }}&moduleSize=5&errorCorrectionLevel=L'/>
                </div>
                {{-- <div class="col-lg-12">
					<h2>Shipping Address Bar Code</h2>
					<img alt='Tracking code Bar' src='https://barcode.tec-it.com/barcode.ashx?data={{ json_decode($order->shipping_address)->address }}, {{ json_decode($order->shipping_address)->city }}, {{ json_decode($order->shipping_address)->country }}&code=Code128&translate-esc=on'/>
                </div> --}}
            </div>
    	</div>
    </div>
@endsection

@section('script')
    <script type="text/javascript">
		$('.print-invoice').click(function() {
			var cid = $(this).attr('data-id');
			$.ajax({
			url: '/orders/'+cid+'/invoice',
			type: 'GET',
			success: function(response) {
				var printWindow = window.open('', 'Print', 'height=600,width=800');
        printWindow.document.write(response);

        // Wait for the window to finish loading before printing
		setTimeout(function() {
			printWindow.focus();
			printWindow.print();
			printWindow.onbeforeunload = function() {
				printWindow.close();
			};
			// console.log('1');
            // printWindow.onload = function() {
            //     printWindow.focus();
            //     printWindow.close();
            // };
        }, 1000); // Add a delay of 1 second (1000 ms)
			},error: function(){
				console.log('error');
			}
			});
		});
        $('#update_delivery_status').on('change', function(){
            var order_id = {{ $order->id }};
            var status = $('#update_delivery_status').val();
            $.post('{{ route('orders.update_delivery_status') }}', {_token:'{{ @csrf_token() }}',order_id:order_id,status:status}, function(data){
                showAlert('success', 'Delivery status has been updated');
            });
        });

        $('#update_payment_status').on('change', function(){
            var order_id = {{ $order->id }};
            var status = $('#update_payment_status').val();
            $.post('{{ route('orders.update_payment_status') }}', {_token:'{{ @csrf_token() }}',order_id:order_id,status:status}, function(data){
                showAlert('success', 'Payment status has been updated');
            });
        });
    </script>
@endsection
