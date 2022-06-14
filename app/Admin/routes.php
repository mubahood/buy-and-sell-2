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
    $router->resource('products-categories', ProductsCategoryController::class);
    $router->resource('resources-categories', ResourcesCategoryController::class);

    $router->resource('farms', FarmController::class);
    $router->resource('financial-records', FinancialRecordController::class);
    $router->resource('garden-production-records', GardenProductionRecordController::class);
    $router->resource('garden-activities', GardenActivityController::class);   
    $router->resource('pests-listing', PestListingController::class); 
    $router->resource('pest-cases-listing', PestCaseListingController::class);
    $router->resource('products', ProductController::class); 
    $router->resource('my–products', MyProductController::class); 
    $router->resource('resources', ResourceSharingController::class);
    $router->resource('questions', QuestionController::class);

    $router->resource('agent-users', AgentUsersController::class);
    $router->resource('chats', ChatController::class);
    $router->resource('my-workers', MyWorkersController::class);

});
