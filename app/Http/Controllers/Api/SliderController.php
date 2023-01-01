<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\SliderCollection;
use App\Models\Slider;

class SliderController extends Controller
{
    public function index()
    {
        return new SliderCollection(Slider::all());
    }
    public function pop(){
        $generalsetting = \App\GeneralSetting::first();
        $data = [
            'status' => $generalsetting->app_pop_status,
            'url' => $generalsetting->app_pop_url,
            'image' => $generalsetting->app_pop_image,
        ];
        return response()->json([
            'status'=>200,
            'data' => $data
        ], 200);
    }
}
