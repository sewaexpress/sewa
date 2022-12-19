<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Recommend extends Model
{
    protected $fillable = [
        'user_id',
        'product_id'
    ];
}
