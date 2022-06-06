<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Controllers\ModelForm;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;

class ProductsCategoryController extends Controller
{
    use HasResourceActions;

    public function index()
    {
        return Admin::content(function (Content $content) {
            $content->header('Categories');
            $content->body(Category::tree(function ($tree) {
                $tree->query(function ($model) {
                    return $model->where('type', 'product');
                });
            }));
        });
    }
}
