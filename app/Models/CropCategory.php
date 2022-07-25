<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CropCategory extends Model
{
    use HasFactory;

    public function activities()
    {
        return $this->hasMany(CropCategoryActivity::class);
    }

    public static function get_subcategories()
    {
        $items = [];
        foreach (CropCategory::all() as $key => $v) {
            $parent = ((int)($v->parent));
            $_name = "";
            if ($parent < 1) {
                continue; 
            }
            $_name = $v->get_name();
            $items[$v->id] = $_name;
        }
        return $items;
    }

    public function get_name()
    {
        $parent = ((int)($this->parent));
        $_name = "";
        if ($parent > 0) {
            $p = CropCategory::find($parent);
            if ($p != null) {
                $_name = $p->name . ", ";
            }
        }
        return $_name . $this->name;
    }

}
