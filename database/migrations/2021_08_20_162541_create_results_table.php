<?php

use App\Models\Competition;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateResultsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('results', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->integer('original_line_number')->unsigned()->nullable();
            $table->string('original_line')->nullable();
            $table->morphs('entrant');
            $table->foreignIdFor(Competition::class)->constrained()->onDelete('cascade');
            $table->foreignIdFor(\App\Models\Event::class)->constrained()->onDelete('cascade');
            $table->tinyInteger('status')->unsigned()->nullable();
            $table->integer('time')->unsigned()->nullable()->index();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('results');
    }
}
