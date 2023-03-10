<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Seller extends Model
{
  protected $fillable = ['admin_to_pay','pan'];
  
  public function user(){
  	return $this->belongsTo(User::class);
  }

  public function payments(){
  	return $this->hasMany(Payment::class);
  }
}
