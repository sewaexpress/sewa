
<!DOCTYPE html>
<html>
<head>
	<title>Shipping Information</title>
	<style>
		table {
			border-collapse: collapse;
			width: 100%;
		}
		td, th {
			border: 1px solid #ddd;
			padding: 8px;
			text-align: left;
			font-size: 14px;
		}
		th {
			background-color: #f2f2f2;
		}
		.logo {
			width: 150px;
			height: auto;
		}
		.qr {
			/* width: 100px; */
			height: 140px;
			padding: 10px;
		}
		@media print {
            /* Hide the header and footer */
            @page {
                margin-top: 0;
                margin-bottom: 0;
            }

            body {
                margin-top: 0;
                margin-bottom: 0;
            }
        }
	</style>
</head>
<body>

    @php
        $generalsetting = \App\GeneralSetting::first();
        $quantity = 0;
        $shipping_address = json_decode($order->shipping_address);
    @endphp
    @foreach ($order->orderDetails as $key => $orderDetail)
        @if ($orderDetail->product != null)
            @php
                $quantity += $orderDetail->quantity
            @endphp
        @endif
    @endforeach
	<table>
		<thead>
			<tr>
				<th style="text-align: center;" colspan="2">
					<img class="" src="https://barcode.tec-it.com/barcode.ashx?data=20230224-00361477">
				</th>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">Tracking Code : 1234567890</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="text-align: center;"><img class="logo" src="https://sewaexpress.com/uploads/admin_login_sidebar/ZUZGqHbMsCxqcg81Ro8QUgXhK4QVsxIgLXEbQnOQ.jpg"></td>
				<td>
					<p><b>{{ $generalsetting->site_name }}</p>
					<p><b>Product Quantity : </b> {{$quantity}}</p>
					<p><b>Bill To : </b> {{ (isset($shipping_address->name))?$shipping_address->name:$user['name'] }}</p>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;"><img class="qr" src="https://qrcode.tec-it.com/API/QRCode?data=20230224-00361477"></td>
				<td>
					<p><b>Shipping Location:</b> {{ $shipping_address->address }}, {{ $shipping_address->city }}, {{ $shipping_address->country }}</p>
					<p><b>Shipping Email:</b> {{ (isset($shipping_address->name))?$shipping_address->email:$user['email'] }}</p>
					<p><b>Shipping Phone:</b> {{ $shipping_address->phone }}</p>
				</td>
			</tr>
			<tr>
				<td><b>Label Printed Date:</b> {{date('Y-m-d')}}</td>
				<td><b>Order Date:</b> {{ date('Y-m-d',strtotime($order->created_at)) }}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>