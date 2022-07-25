<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Garden extends Model
{
    use HasFactory;

    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y');
    }

    public function getPlantDateAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y');
    }

    public function getLocationNameAttribute()
    {
        $loc = Location::find($this->location_id);
        if ($loc != null) {
            return $loc->name;
        } else {
            return "-";
        }
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

    public function sector()
    {
        $o = CropCategory::find($this->crop_category_id);
        if($o == null){
            $this->crop_category_id = 1;
            $this->save();
        }
        return $this->belongsTo(CropCategory::class,'crop_category_id');
    }

    public function getCropCategoryNameAttribute()
    {
        if ($this->crop_category != null) {
            return $this->crop_category->name;
        } else {
            return "-";
        }
    }

    public function getProductionActivitiesAllAttribute()
    {
        return GardenActivity::where('garden_id', $this->id)->count();
    }

    public function getProductionActivitiesDoneAttribute()
    {
        return GardenActivity::where([
            'garden_id' => $this->id,
            'is_done' => 1
        ])->count();
    }
 
    public function getProductionActivitiesRemainingAttribute()
    {
        return GardenActivity::where([
            'garden_id' => $this->id,
            'is_done' => 0
        ])->count();
    }

    protected $appends = [
        'crop_category_name',
        'production_activities_all', 
        'production_activities_done',
        'production_activities_remaining',
        'location_name',
    ];

    public function crop_category()
    {
        return $this->belongsTo(CropCategory::class, 'crop_category_id');
    }

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
                        $g_activity->garden_id = $g->id;
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

        self::creating(function ($model) {
            $my_colors = [
                '#BA0A1E',
                '#EE2908',
                '#542889',
                '#35A9B9',
                '#273A85',
                '#35A9B9',
                '#273988',
                '#219847',
                '#FE9F23',
                '#7C00FF',
                '#FC4E51',
                '#AA2754',
                '#186986',
                '#FFAE00',
                '#44372E',
                '#000000',
                '#3E51A1',
            ];
            shuffle($my_colors);

            $model->color = $my_colors[0];
            return $model;
        });

        self::deleting(function ($model) {
            // ... code here
        });

        self::deleted(function ($model) {
            // ... code here
        });
    }
}
