<?php

use App\Models\Competition;
use App\Models\Venue;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompetitionVenueTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('competition_venue', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(Competition::class)->index()->constrained()->onDelete('cascade');
            $table->foreignIdFor(Venue::class)->index()->constrained()->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('competition_venue');
    }
}
