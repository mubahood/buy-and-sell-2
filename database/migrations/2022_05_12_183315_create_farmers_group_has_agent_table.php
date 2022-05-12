<?php

use App\Models\FarmersGroup;
use App\Models\User;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFarmersGroupHasAgentTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('farmers_group_has_agents', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(FarmersGroup::class);
            $table->foreignIdFor(Administrator::class);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('farmers_group_has_agents');
    }
}
