<?php

use App\Enums\CompetitionStatus;
use App\Enums\TimekeepingMethod;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompetitionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('competitions', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('name');
            $table->string('slug');
            $table->date('start_date');
            $table->date('end_date')->nullable();
            $table->tinyInteger('timekeeping')->default(TimekeepingMethod::Unknown);
            $table->dateTime('published_on')->nullable();
            $table->tinyInteger('status')->default(CompetitionStatus::New);
            $table->string('comment', 512)->nullable();
            $table->boolean('ils_sanctioned')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('competitions');
    }
}
