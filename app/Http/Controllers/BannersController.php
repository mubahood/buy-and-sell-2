<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request; 
class BannersController extends Controller
{
    public function index()
    {
        return  view('metro.dashboard.banners'); 
    }

    public function edit()
    {
        return  view('metro.dashboard.users-create');
    }
}
