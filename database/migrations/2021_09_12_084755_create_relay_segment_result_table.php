<?php

use App\Models\Athlete;
use App\Models\RelaySegment;
use App\Models\Result;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRelaySegmentResultTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('relay_segment_result', function (Blueprint $table) {
            $table->id();
            $table->foreignIdFor(RelaySegment::class)->constrained();
            $table->foreignIdFor(Result::class)->constrained();
            $table->mediumInteger('time')->nullable();
            $table->foreignIdFor(Athlete::class)->nullable()->constrained()->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('relay_segment_result');
    }
}
