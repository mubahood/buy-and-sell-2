<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Category;
use App\Models\Product;
use App\Models\Utils;
use Illuminate\Http\Request;

class ApiProductsController 
{
    public function index(Request $request)
    {
        $per_page = (int) ($request->per_page ? $request->per_page:15);

        $items = Product::paginate($per_page)->withQueryString()->items();
        return $items;
    }
    
    public function banners(Request $request)
    {
        $items = Banner::paginate(100)->withQueryString()->items();
        return $items;
    }
    
    public function locations(Request $request)
    {
        return Utils::get_locations();
    }
    
    public function categories(Request $request)
    {
        $per_page = (int) ($request->per_page ? $request->per_page:1000);   
        $items = Category::paginate($per_page)->withQueryString()->items();

        $_items = [];
        foreach ($items as $key => $value) {
            $_attributes = $value->attributes;
            $attributes = [];
            foreach ($_attributes as $_key => $_value) {
                $attributes[] = json_encode($_value);
            }
            $value->attributes = null;
            unset($value->attributes);
            $value->attributes =  $attributes;
            $_items[] = $value;
        }
        

        return $items;
    }
}
