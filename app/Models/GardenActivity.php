<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GardenActivity extends Model
{
    use HasFactory;

    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y');
    }

    public static function boot()
    {
        parent::boot();


        self::created(function ($m) {
            $acts = GardenActivity::where('administrator_id', $m->administrator_id)->orderBy('due_date', 'Asc')->get();
            $position = 0;
            if ($acts != null) {
                foreach ($acts as $key => $value) {
                    $position++;
                    $value->position = $position;
                    $value->save();
                }
            }
        });

        self::updating(function ($model) {
            // ... code here

        });

        self::updated(function ($model) {
            // ... code here
        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }
}
