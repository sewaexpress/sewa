<tr>
    @foreach ($order_details as $details)
    <td class="cart-product-order-id">
        <span>{{$details->order_id}}</span>
    </td>
    <td class="cart-product-order-date">
        <span>{{ date('d/m/Y', strtotime($details->created_at)) }}</span>
    </td>

    <td class="cart-image">
        <a class="entry-thumbnail" href="{{ route('product', $details->product->slug) }}">
            <img src="{{asset($details->product->featured_img)}}" class="img-fluid" style="height:60px;">
        </a>
    </td>
    <td class="cart-product-name-info">
        <h4 class="cart-product-description"><a href="{{ route('product', $details->product->slug) }}">{{$details->product->name}}</a></h4>
        <div class="row">
            <div class="col-4">
                <div class="rating rateit-small"></div>
            </div>
        </div>
        <!-- /.row -->
    </td>
    <td class="cart-product-quantity">
        <div class="quant-input">
            <span>{{$details->quantity}}</span>
        </div>
    </td>
    <td class="cart-product-grand-total"><span class="cart-grand-total-price">Rs{{$details->order->grand_total}}</span>
    </td>
    <td class="cart-product-order-date">
        @if ($details->delivery_status == 'delivered')
            <span class="bg-success text-white px-3 py-2">{{$details->delivery_status}}</span>
        @elseif ($details->delivery_status == 'pending')
            <span class="bg-warning text-white px-3 py-2">{{$details->delivery_status}}</span>
            @else
            <span class="bg-danger text-white px-3 py-2">{{$details->delivery_status}}</span>
        @endif
        
        
    </td>
    <td class="view-item"><a href="{{ route('product', $details->product->slug) }}" title="cancel" class="icon">
            View</a>
    </td>
    @endforeach
</tr>