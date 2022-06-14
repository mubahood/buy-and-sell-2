<?php

namespace App\Models;

use Carbon\Carbon;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FinancialRecord extends Model
{
    use HasFactory;
    public static function boot()
    {
        parent::boot();

        self::creating(function ($m) {
            $g = Garden::find($m->garden_id);
            if ($g != null) {
                if ($m->created_date != null) {
                    if (strlen($m->created_date) > 4) {
                        $m->created_at = $m->created_date;
                    }
                }
                if ($g->administrator_id != null) {
                    $m->administrator_id = $g->administrator_id;
                }
            }
            return $m;
        });
        self::updating(function ($m) {
            $g = Garden::find($m->garden_id);
            if ($g != null) {
                if ($m->created_date != null) {
                    if (strlen($m->created_date) > 4) {
                        $m->created_at = $m->created_date;
                    }
                }
                if ($g->administrator_id != null) {
                    $m->administrator_id = $g->administrator_id;
                }
            }
            return $m;
        });
    }



    public function owner()
    {
        $o = Administrator::find($this->administrator_id);
        if ($o == null) {
            $this->administrator_id = 1;
            $this->save();
        }
        return $this->belongsTo(Administrator::class, 'administrator_id');
    }


    public function creator()
    {
        $o = Administrator::find($this->created_by);
        if ($o == null) {
            $this->created_by = 1;
            $this->save();
        }
        return $this->belongsTo(Administrator::class, 'created_by');
    }

    public function enterprise()
    {
        $o = Garden::find($this->garden_id);
        if ($o == null) {
            $this->garden_id = 1;
            $this->save();
        }
        return $this->belongsTo(Garden::class, 'garden_id');
    }


    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->format('d-m-Y g:i A');
    }


    public function getAmountTextAttribute()
    {
        return "UGX " . number_format($this->amount);
    }
    protected $appends = ['amount_text'];
}
