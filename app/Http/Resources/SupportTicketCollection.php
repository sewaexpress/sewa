<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use SebastianBergmann\Environment\Console;

class SupportTicketCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return [
            'data' => $this->collection->map(function($data) {
                return [
                    'id' => (integer) $data->id,
                    'code' => (integer) $data->code,
                    'subject' => (string) $data->subject,
                    'details' => (string) $data->details,
                    'files' => json_decode($data->files),
                    'status' => (string) $data->status,
                    'client_viewed' =>(integer) $data->client_viewed,
                    'admin_viewed' =>(integer) $data->admin_viewed,
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
