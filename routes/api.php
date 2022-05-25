<?php

use App\Http\Controllers\ApiChatsController;
use App\Http\Controllers\ApiProductsController;
use App\Http\Controllers\ApiUsersController;
use App\Models\CropCategory;
use App\Models\Pest;
use App\Models\Question;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route; //new staff

Route::post('products', [ApiProductsController::class, 'create']);
Route::post('gardens', [ApiProductsController::class, 'create_garden']);

Route::post('garden-activities', [ApiProductsController::class, 'garden_activities_create']);
Route::post('pest-cases', [ApiProductsController::class, 'pest_cases_create']);
Route::post('questions', [ApiProductsController::class, 'question_create']);
Route::post('garden-production-record', [ApiProductsController::class, 'garden_production_record_create']);
Route::post('workers', [ApiProductsController::class, 'workers_create']);
Route::post('financial-records', [ApiProductsController::class, 'financial_records_create']);
Route::get('workers', [ApiProductsController::class, 'workers']);

Route::get('gardens', [ApiProductsController::class, 'gardens']);
Route::get('garden-activities', [ApiProductsController::class, 'garden_activities']);
Route::get('garden-production-record', [ApiProductsController::class, 'get_garden_production_record']);
Route::get('financial-records', [ApiProductsController::class, 'get_financial_records']);
Route::get('crop-categories', function () {
    return CropCategory::all(); 
});
Route::get('pests', function () {
    return Pest::all();
});
Route::get('questions', function () {
    return Question::all();
});

Route::get('farmers-goups', [ApiUsersController::class, 'farmers_goups']);

Route::post('upload-temp-file', [ApiProductsController::class, 'upload_temp_file']);
Route::post('products', [ApiProductsController::class, 'create']);
Route::get('upload', [ApiProductsController::class, 'upload']);
Route::get('products', [ApiProductsController::class, 'index']);
Route::post('delete-product', [ApiProductsController::class, 'delete']);
Route::get('banners', [ApiProductsController::class, 'banners']);
Route::get('categories', [ApiProductsController::class, 'categories']);
Route::get('locations', [ApiProductsController::class, 'locations']);
Route::post('users', [ApiUsersController::class, 'create_account']);
Route::post('get-chats', [ApiChatsController::class, 'index']);
Route::post('chats', [ApiChatsController::class, 'send_message']);
Route::post('threads', [ApiChatsController::class, 'threads']);

Route::get('users', [ApiUsersController::class, 'index']);
Route::post('users-update', [ApiUsersController::class, 'update']);
Route::post('users-login', [ApiUsersController::class, 'login']);

Route::get('posts', [ApiProductsController::class, 'posts']);
Route::get('post-categories', [ApiProductsController::class, 'post_categories']);
Route::post('posts', [ApiProductsController::class, 'create_post']);


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user(); //simple love
});
