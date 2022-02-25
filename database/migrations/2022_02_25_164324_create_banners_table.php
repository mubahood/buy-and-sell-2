<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBannersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('banners', function (Blueprint $table) {
            $table->id(); 
            $table->timestamps();
            $table->string('section')->nullable();
            $table->string('position')->nullable();
            $table->string('name')->nullable();
            $table->string('sub_title')->nullable();
            $table->string('type')->nullable();
            $table->string('category_id')->nullable();
            $table->string('product_id')->nullable();
            $table->string('image')->nullable();
            $table->string('clicks')->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('banners');
    }
}
