<?php

namespace App\Models;

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
                if ($g->administrator_id != null) {
                    $m->administrator_id = $g->administrator_id;
                }
            }
            return $m;
        });
    }
}
