<?php

use App\Models\Athlete;
use App\Models\AthleteIdType;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('athlete_ids', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(AthleteIdType::class);
            $table->foreignIdFor(Athlete::class);
            $table->string('id_value');
        });
    }
};
