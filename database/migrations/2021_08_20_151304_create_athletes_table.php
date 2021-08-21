<?php

use App\Models\Athlete;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAthletesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('athletes', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('name');
            $table->string('slug')->index();
            $table->smallInteger('year_of_birth')->unsigned()->nullable();
            $table->tinyInteger('gender');
            $table->foreignIdFor(Athlete::class, 'alias_of')->nullable()
                ->constrained()->references('id')->on('athletes')
                ->onDelete('cascade');
            $table->json('nationalities')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('athletes');
    }
}
