<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AppReferList extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'name',
        'description',
        'image',
        'created_by',
        'updated_at',
    ];
    public function referred_by(){
        return $this->belongsTo(User::class, 'referrer_user_id');
    }
    public function referred_to(){
        return $this->belongsTo(User::class, 'referred_user_id');
    }
}
