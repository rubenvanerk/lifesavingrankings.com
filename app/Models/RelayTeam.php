<?php

namespace App\Models;

use App\Enums\Gender;
use App\Traits\HasCountry;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphMany;

class RelayTeam extends Model
{
    use HasCountry;

    protected $guarded = ['id'];

    protected $casts = [
        'gender' => Gender::class,
    ];

    public function results(): MorphMany
    {
        return $this->morphMany(Result::class, 'entrant');
    }

    public function competition(): BelongsTo
    {
        return $this->belongsTo(Competition::class);
    }
}
