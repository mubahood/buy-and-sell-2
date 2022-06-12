<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('customer_name')->nullable();
            $table->text('customer_phone')->nullable();
            $table->text('customer_address')->nullable();
            $table->text('product_price')->nullable();
            $table->text('product_name')->nullable();
            $table->text('product_id')->nullable();
            $table->text('product_photos')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
