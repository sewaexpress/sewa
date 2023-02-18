<?php

namespace App\Http\Resources;

use App\Location;
use Illuminate\Http\Resources\Json\ResourceCollection;
use SebastianBergmann\Environment\Console;

class AddressCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {               
                return [
                    'id'=> (integer) $data->id,
                    'user_id'=> (integer) $data->user_id, 
                    'address'=> (string) $data->address, 
                    'country'=> (string) $data->country, 
                    'delivery_location'=> (integer) $data->delivery_location, 
                    'delivery_location_details' => (Location::where('id',$data->delivery_location)->count() > 0)?Location::where('id',$data->delivery_location)->first():null,
                    'city'=> (string) $data->city, 
                    'postal_code'=> (integer) $data->postal_code, 
                    'phone'=> (integer) $data->phone, 
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
