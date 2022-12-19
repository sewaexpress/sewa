<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Location extends Model
{
    use SoftDeletes;
    protected $fillable = ['name','district', 'created_by', 'deleted_at'];

    
    public function districts(){
    	return $this->belongsTo(State::class,'district','id');
    }
}
