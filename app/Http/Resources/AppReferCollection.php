<?php

namespace App\Http\Resources;

use App\Models\BusinessSetting;
use App\RewardAmount;
use Illuminate\Http\Resources\Json\ResourceCollection;

class AppReferCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                return [
                    'id' => (integer) $data->id,
                    'referred_to' => $data->referred_to->name,
                    'created_at' => $data->created_at
                ];
            })
        ];
    }

    public function with($request)
    {
        // $business_settings = BusinessSetting::where('type', 'app_refer_point')->first();
        return [
            // 'rate' => $business_settings->value,
            'success' => true,
            'status' => 200
        ];
    }
}
