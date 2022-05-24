<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GardenProductionRecord extends Model
{
    use HasFactory;


    public function getGardenNameAttribute()
    {
        $g = Garden::find($this->garden_id);
        if ($g == null) {
            return "-";
        }
        return $g->name;
    }

    protected $appends = [
        'garden_name',
    ];
}
