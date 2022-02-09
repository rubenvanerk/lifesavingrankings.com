<?php

use App\Models\Athlete;
use App\Models\RelaySegment;
use App\Models\Result;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ResultsAddSplitsAsArray extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::drop('splits');

        Schema::table('results', function (Blueprint $table) {
            $table->json('splits')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::create('splits', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table
                ->foreignIdFor(Result::class)
                ->constrained()
                ->onDelete('cascade');
            $table
                ->mediumInteger('time')
                ->nullable()
                ->unsigned();
            $table->smallInteger('distance')->unsigned();
            $table
                ->foreignIdFor(Athlete::class)
                ->nullable()
                ->constrained()
                ->onDelete('cascade');
            $table
                ->foreignIdFor(RelaySegment::class)
                ->nullable()
                ->constrained()
                ->onDelete('set null');
        });

        Schema::table('results', function (Blueprint $table) {
            $table->dropColumn('splits');
        });
    }
}
