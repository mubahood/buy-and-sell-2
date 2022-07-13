<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PricingItem extends Model
{
    use HasFactory;

    protected $fillable = ['pricing_id', 'market_id', 'price_date', 'price'];

    public function pricing()
    {
        return $this->belongsTo(Pricing::class);
    }
}
