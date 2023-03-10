<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\ResourceCollection;

class PurchaseHistoryCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                $placeholder_img='frontend/images/placeholder.jpg';
                return [
                    'order_id' => (integer) $data->id,
                    'code' => $data->code,
                    'user' => [
                        'name' => $data->user->name,
                        'email' => $data->user->email,
                        'avatar' =>file_exists($data->user->avatar) ? $data->user->avatar : $placeholder_img,
                        'avatar_original' => file_exists($data->user->avatar_original) ? $data->user->avatar_original : $placeholder_img
                    ],
                    'shipping_address' => json_decode($data->shipping_address),
                    'payment_type' => str_replace('_', ' ', $data->payment_type),
                    'payment_status' => $data->payment_status,
                    'grand_total' => (double) $data->grand_total,
                    'coupon_discount' => (double) $data->coupon_discount,
                    'shipping_cost' => (double) ($data->orderDetails->sum('shipping_cost')+($data->location_charge)),
                    'subtotal' => (double) $data->orderDetails->sum('price'),
                    'tax' => (integer) $data->orderDetails->sum('tax'),
                    'date' => Carbon::createFromTimestamp($data->date)->format('d-m-Y'),
                    'links' => [
                        'details' => route('purchaseHistory.details', $data->id)
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
