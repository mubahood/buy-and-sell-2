<?php

namespace App\Models;

use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\AdminBuilder;


class Banner extends Model
{
    use HasFactory; 
    use ModelTree, AdminBuilder; 
    protected $table = 'banners';

}
