<?php

use App\Http\Controllers\ApiProductsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;//new staff


Route::get('products', [ApiProductsController::class, 'index'] );
Route::get('banners', [ApiProductsController::class, 'banners'] );

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();//simple love
});  