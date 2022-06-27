<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Farm extends Model 
{
    use HasFactory;

    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y');
    }

    public function owner()
    {
        $o = Administrator::find($this->administrator_id);
        if($o == null){
            $this->administrator_id = 1;
            $this->save();
        }
        return $this->belongsTo(Administrator::class,'administrator_id');
    }
    

    public function location()
    {
        $o = Location::find($this->location_id);
        if($o == null){
            $this->location_id = 1;
            $this->save();
        }
        return $this->belongsTo(Location::class,'location_id');
    }

}