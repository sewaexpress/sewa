<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class SearchProductCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                $placeholder_img='frontend/images/placeholder.jpg';

                return [
                    'id' => (integer) $data->id,
                    'name' => $data->name,
                    'unit_price2' => $data->unit_price2,
                    'category_id' => $data->category_id,
                    'thumbnail_image' => file_exists($data->featured_img) ? $data->featured_img : $placeholder_img,
                    'base_price' => (double) homeBasePrice($data->id),
                    'unit_price' => number_format(intval($data->unit_price)),
                    'base_discounted_price' => number_format(intval(homeDiscountedBasePrice($data->id))),
                    'rating' => (double) $data->rating,
                    'links' => [
                        'details' => route('products.show', $data->id),
                        'reviews' => route('api.reviews.index', $data->id),
                        'related' => route('products.related', $data->id),
                        'top_from_seller' => route('products.topFromSeller', $data->id)
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
