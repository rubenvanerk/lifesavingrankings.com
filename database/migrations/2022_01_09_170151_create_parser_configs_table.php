<?php

use App\Models\Media;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParserConfigsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('parser_configs', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->json('options')->nullable();
            $table->foreignIdFor(Media::class)->index()->constrained()->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('parser_configs');
    }
}
