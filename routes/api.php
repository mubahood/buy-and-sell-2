<?php

use App\Http\Controllers\ApiProductsController;
use App\Http\Controllers\ApiUsersController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;//new staff


Route::post('products', [ApiProductsController::class, 'create'] );
Route::get('upload', [ApiProductsController::class, 'upload'] );
Route::get('products', [ApiProductsController::class, 'index'] );
Route::get('banners', [ApiProductsController::class, 'banners'] );
Route::get('categories', [ApiProductsController::class, 'categories'] );
Route::get('locations', [ApiProductsController::class, 'locations'] );
Route::get('users', [ApiUsersController::class, 'users'] );
Route::post('users', [ApiUsersController::class, 'create_account'] ); 


Route::get('posts', [ApiProductsController::class, 'posts'] );
Route::get('post-categories', [ApiProductsController::class, 'post_categories'] );
Route::post('posts', [ApiProductsController::class, 'create_post'] );


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();//simple love
});  