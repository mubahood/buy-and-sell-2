<?php

use App\Models\CropCategory;
use App\Models\Location;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGardensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gardens', function (Blueprint $table) {
            $table->id();
            $table->timestamps(); 
            $table->foreignIdFor(Administrator::class); 
            $table->foreignIdFor(CropCategory::class); 
            $table->foreignIdFor(Location::class); 
            $table->text('name')->nullable();
            $table->text('image')->nullable();
            $table->text('plant_date')->nullable();
            $table->text('harvest_date')->nullable();
            $table->text('details')->nullable();
            $table->text('latitude')->nullable();
            $table->text('longitude')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('gardens');
    }
}
