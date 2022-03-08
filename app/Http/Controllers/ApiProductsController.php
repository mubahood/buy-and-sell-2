<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Product;
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
}
