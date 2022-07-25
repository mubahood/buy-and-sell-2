<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CropCategoryActivity extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'days_after_planting',
        'details',
    ];


    public function cetagory()
    {
        return $this->belongsTo(CropCategory::class);
    }
}   
