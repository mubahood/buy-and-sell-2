<?php

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGardenActivitiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('garden_activities', function (Blueprint $table) {
            $table->id();
            $table->timestamps(); 
            $table->text('name')->nullable();
            $table->text('due_date')->nullable();
            $table->text('details')->nullable();
            $table->foreignIdFor(Administrator::class); 
            $table->foreignIdFor(Administrator::class,'person_responsible'); 
            $table->foreignIdFor(Administrator::class,'done_by'); 
            $table->tinyInteger('is_generated')->nullable();
            $table->text('is_done')->nullable();
            $table->text('done_status')->nullable();
            $table->text('done_details')->nullable();
            $table->text('done_images')->nullable();
            $table->integer('position')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('garden_activities');
    }
}
