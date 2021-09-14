<?php

use App\Models\Athlete;
use App\Models\RelaySegment;
use App\Models\Result;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSplitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('splits', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Result::class)->constrained()->onDelete('cascade');
            $table->mediumInteger('time')->nullable()->unsigned();
            $table->smallInteger('distance')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('splits');
    }
}
