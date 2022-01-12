<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\User;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;
use Encore\Admin\Widgets\InfoBox;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->title('Dashboard')
            ->description('Description...') 
            ->row(function (Row $row) {

                   $row->column(4, new InfoBox(
                    "All users",
                    'wpforms',
                    'blue',
                    admin_url('/users'),
                    User::count() . " - Users"
                ));
            
            
                   $row->column(4, new InfoBox(
                    "All Products",
                    'wpforms',
                    'blue',
                    admin_url('/products'),
                    Product::count() . " - Products"
                ));
            
            
            });
    }
}
