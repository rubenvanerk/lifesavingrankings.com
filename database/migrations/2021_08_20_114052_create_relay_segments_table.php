<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRelaySegmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('relay_segments', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(App\Models\Event::class)->constrained();
            $table->foreignIdFor(App\Models\Event::class, 'segment_id')
                ->constrained()->references('id')->on('events');
            $table->tinyInteger('order')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('relay_segments');
    }
}
