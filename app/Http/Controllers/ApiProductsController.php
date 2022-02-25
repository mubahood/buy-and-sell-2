<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ApiProductsController 
{
    public function index(Request $request)
    {

        $items = Product::paginate(10)->withQueryString()->items();
        return $items;
    }
}
