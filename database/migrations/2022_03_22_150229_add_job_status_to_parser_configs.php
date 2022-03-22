<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Imtigger\LaravelJobStatus\JobStatus;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('parser_configs', static function (Blueprint $table) {
            $table->foreignIdFor(JobStatus::class)->nullable()->constrained()->nullOnDelete();
        });
    }
};
