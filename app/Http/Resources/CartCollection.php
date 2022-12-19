<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class CartCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                $placeholder_img='frontend/images/placeholder.jpg';

                return [
                    'id' => (integer) $data->id,
                    'product' => [
                        'name' => $data->product->name,
                        'image' =>file_exists($data->product->featured_img) ? $data->product->featured_img : $placeholder_img,
                        'available_stock' => (integer) $data->product->current_stock,
                    ],
                    'variation' => $data->variation,
                    'price' => (integer) $data->price,
                    'tax' => (double) $data->tax,
                    'shipping_cost' => (double) $data->shipping_cost,
                    'quantity' => (integer) $data->quantity,
                    'product_id' => $data->product->id,
                    'date' => $data->created_at->diffForHumans(),
                    
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
