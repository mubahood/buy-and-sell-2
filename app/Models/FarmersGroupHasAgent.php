<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FarmersGroupHasAgent extends Model
{
    use HasFactory;
    protected $fillable = [
        'administrator_id',
        'farmers_group_id',
    ];

    public function farmer_group()
    {
        return $this->belongsTo(FarmersGroup::class);
    } 
}
