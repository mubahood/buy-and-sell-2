<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('farmers-groups', FarmersGroupController::class);
    $router->resource('gardens', GardenController::class);
    $router->resource('crop-categories', CropCategoryController::class);
    $router->resource('pests', PestController::class);
    $router->resource('pest-cases', PestCaseController::class);
    
});
