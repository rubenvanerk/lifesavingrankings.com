<?php

use App\Models\Competition;
use App\Models\Media;
use App\Models\Team;
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
            $table
                ->integer('original_line_number')
                ->unsigned()
                ->nullable();
            $table->string('original_line')->nullable();
            $table->morphs('entrant');
            $table
                ->foreignIdFor(Competition::class)
                ->index()
                ->constrained()
                ->onDelete('cascade');
            $table
                ->foreignIdFor(\App\Models\Event::class)
                ->index()
                ->constrained()
                ->onDelete('cascade');
            $table
                ->tinyInteger('status')
                ->unsigned()
                ->nullable();
            $table
                ->mediumInteger('time')
                ->unsigned()
                ->nullable()
                ->index();
            $table
                ->foreignIdFor(Team::class)
                ->nullable()
                ->index()
                ->constrained()
                ->onDelete('set null');
            $table
                ->foreignIdFor(Media::class)
                ->index()
                ->constrained();
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
