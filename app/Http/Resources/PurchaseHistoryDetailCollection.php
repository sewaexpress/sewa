<?php

namespace App\Http\Resources;

use App\Models\Order;
use Illuminate\Http\Resources\Json\ResourceCollection;
use App\Models\Product;

class PurchaseHistoryDetailCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                $placeholder_img='frontend/images/placeholder.jpg';
                $product = Product::where('id',$data->product_id)->first();
                $order = Order::where('id',$data->order_id)->first();
                return [
                    'id' => (integer) $data->id,
                    'product_id' => (isset($product))?$product->id:'Empty',
                    'product' => (isset($product))?$product->name:'Empty',
                    'featured_image' => file_exists($product->featured_img) ? $product->featured_img : $placeholder_img,
                    'variation' => $data->variation,
                    'price' => (integer) $data->price,
                    'tax' => (integer) $data->tax,
                    'shipping_cost' => (integer) $data->shipping_cost,
                    'quantity' => (integer) $data->quantity,
                    'payment_status' => (string) $order->payment_status,
                    'delivery_status' => (string) $data->delivery_status,
                    'payment_type' => (string) $order->payment_type,
                    'location_charge' => (integer) $order->location_charge,
                    'total_coupon_discount' => (string) $order->coupon_discount,
                ];
            })
        ];
    }

    public function with($request)
    {
        return [
            'success' => true,
            'status' => 200
        ];
    }
}
