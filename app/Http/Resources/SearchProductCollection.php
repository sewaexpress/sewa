<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class SearchProductCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                $photo=[];
                $placeholder_img='frontend/images/placeholder.jpg';
                
                if(!(isset($data->photos)) && empty($data->photos)){
                    array_push($photo,$placeholder_img);
                }else{
                    // array_push($photo,$img);
                // return ($data->photos);
                    $items = json_decode($data->photos);
                    if(count(array($items)) > 0){
                        foreach($items as $key=>$img){
                            if(file_exists($img)){
                                array_push($photo,$img);
                            }else{
                                array_push($photo,$placeholder_img);
                            }
                        }
                    }
                }

                return [
                    'id' => (integer) $data->id,
                    'name' => $data->name,
                    'photos' => $photo,
                    'unit_price2' => $data->unit_price2,
                    'category_id' => $data->category_id,
                    'thumbnail_image' => file_exists($data->featured_img) ? $data->featured_img : $placeholder_img,
                    'featured_img' => file_exists($data->featured_img) ? $data->featured_img : $placeholder_img,
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
