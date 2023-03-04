<?php

namespace App\Http\Resources;

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
                return [
                    'id' => (integer) $data->id,
                    'product' => (isset($product))?$product->name:'Empty',
                    'featured_image' => file_exists($product->featured_img) ? $product->featured_img : $placeholder_img,
                    'variation' => $data->variation,
                    'price' => (integer) $data->price,
                    'tax' => (integer) $data->tax,
                    'shipping_cost' => (integer) $data->shipping_cost,
                    'quantity' => (integer) $data->quantity,
                    'payment_status' => (string) $data->payment_status,
                    'delivery_status' => (string) $data->delivery_status
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
