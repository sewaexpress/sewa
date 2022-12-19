<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class WishlistCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                $placeholder_img='frontend/images/placeholder.jpg';
                return [
                    'id' => (integer) $data->id,
                    'product' => [
                        'product_id' => $data->product_id,
                        'name' => $data->product->name,
                        'thumbnail_image' =>file_exists($data->product->featured_img) ? $data->product->featured_img : $placeholder_img,
                        'base_price' => (double) homeBasePrice($data->product->id),
                        'base_discounted_price' => (double) homeDiscountedBasePrice($data->product->id),
                        'unit_price' => $data->product->unit_price,
                        'unit' => $data->product->unit,
                        'rating' => (double) $data->product->rating,
                        'links' => [
                            'details' => route('products.show', $data->product->id),
                            'reviews' => route('api.reviews.index', $data->product->id),
                            'related' => route('products.related', $data->product->id),
                            'top_from_seller' => route('products.topFromSeller', $data->product->id)
                        ]
                    ]
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
