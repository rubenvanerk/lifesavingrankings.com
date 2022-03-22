<?php

namespace App\Models;

use App\Casts\Options;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ParserConfig extends Model
{
    protected $casts = [
        'options' => Options::class,
    ];

    public function media(): BelongsTo
    {
        return $this->belongsTo(Media::class);
    }

    public function job_status(): BelongsTo
    {
        return $this->belongsTo(JobStatus::class);
    }
}
