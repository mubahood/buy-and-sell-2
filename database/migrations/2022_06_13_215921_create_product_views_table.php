<?php

use App\Models\Category;
use App\Models\Location;
use App\Models\Product;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Facades\Admin;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductViewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_views', function (Blueprint $table) {
            $table->id();
            $table->timestamps(); 
            $table->foreignIdFor(Administrator::class);
            $table->foreignIdFor(Location::class); 
            $table->foreignIdFor(Product::class); 
            $table->foreignIdFor(Administrator::class,'owner_id'); 
            $table->foreignIdFor(Administrator::class,'viewer_id'); 
            $table->foreignIdFor(Category::class); 
            $table->text('owner_name')->nullable();
            $table->text('viewer_name')->nullable();
            $table->tinyInteger('viewer_is_registered')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_views');
    }
}
