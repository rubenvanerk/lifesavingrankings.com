<?php

namespace App\Models;

use App\Traits\HasCachedCount;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;

class Result extends Model
{
    use HasFactory, HasCachedCount;

    public function competition(): BelongsTo
    {
        return $this->belongsTo(Competition::class);
    }

    public function event(): BelongsTo
    {
        return $this->belongsTo(Event::class);
    }

    public function entrant(): MorphTo
    {
        return $this->morphTo();
    }
}
