<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class BannerCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                return [
                    'photo' => $data->app_photo,
                    'url' => $data->url,
                    'position' => (integer) $data->position,
                    'app_pop_url' => (string) $data->app_pop_url,
                    'app_point_link' => (integer) $data->app_point_link
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
