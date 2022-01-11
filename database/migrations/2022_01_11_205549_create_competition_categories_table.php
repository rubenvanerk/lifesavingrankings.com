<?php

use App\Models\Competition;
use App\Models\CompetitionCategory;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompetitionCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('competition_categories', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('name');
            $table->foreignIdFor(Competition::class);
        });

        Schema::table('results', function (Blueprint $table) {
            $table->foreignIdFor(CompetitionCategory::class)->nullable()->constrained();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('competition_categories');

        Schema::table('results', function (Blueprint $table) {
            $table->dropConstrainedForeignId('competition_category_id');
        });
    }
}
