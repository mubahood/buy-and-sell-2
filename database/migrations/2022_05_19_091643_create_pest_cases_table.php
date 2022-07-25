<?php

use App\Models\Garden;
use App\Models\Location;
use App\Models\Pest;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePestCasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pest_cases', function (Blueprint $table) {
            $table->id();
            $table->timestamps(); 
            $table->foreignIdFor(Garden::class); 
            $table->foreignIdFor(Pest::class); 
            $table->foreignIdFor(Administrator::class); 
            $table->foreignIdFor(Location::class); 
            $table->text('description')->nullable();
            $table->text('images')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pest_cases');
    }
}
