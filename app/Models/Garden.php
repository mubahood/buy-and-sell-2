<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Garden extends Model
{
    use HasFactory;
    public static function boot()
    {
        parent::boot();


        self::created(function ($g) {
            $cat = CropCategory::find($g->crop_category_id);
            if ($cat != null) {
                if ($cat->activities != null) {
                    foreach ($cat->activities as $key => $v) {
                        $g_activity = new GardenActivity();
                        $g_activity->name = $v->name;
                        $g_activity->details = $v->details;
                        $g_activity->administrator_id = $g->administrator_id;
                        $g_activity->person_responsible = $g->administrator_id;
                        $g_activity->done_by = 0;
                        $g_activity->done_details = "";
                        $g_activity->done_images = "";
                        $g_activity->done_status = "Not done.";
                        $g_activity->is_generated = 1;
                        $g_activity->is_done = 0;
                        $g_activity->position = 0;
                        $plant_date = Carbon::parse($g->plant_date);
                        $g_activity->due_date = $plant_date->addDays($v->days_after_planting);
                        $g_activity->save();
                    }
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
