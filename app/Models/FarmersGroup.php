<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FarmersGroup extends Model
{
    use HasFactory;
    public function agents()
    {
        return $this->hasMany(FarmersGroupHasAgent::class);
    }
}
