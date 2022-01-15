<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CountryToCountryCode extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('venues', function (Blueprint $table) {
            $table->renameColumn('country', 'country_code');
        });
        Schema::table('teams', function (Blueprint $table) {
            $table->renameColumn('country', 'country_code');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('venues', function (Blueprint $table) {
            $table->renameColumn('country_code', 'country');
        });
        Schema::table('teams', function (Blueprint $table) {
            $table->renameColumn('country_code', 'country');
        });
    }
}
