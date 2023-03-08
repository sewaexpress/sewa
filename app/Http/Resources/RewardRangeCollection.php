<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class RewardRangeCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                return [
                    'id' => (integer) $data->id,
                    'start_range' => (integer) $data->start_range,
                    'end_range' => (string) $data->end_range,
                    'value' => (integer) $data->value
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
