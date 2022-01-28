<?php

namespace App\Models;

use App\Enums\Gender;
use App\Traits\HasCountry;
use App\Traits\Parseable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphMany;

class RelayTeam extends Model
{
    use Parseable, HasCountry;

    protected $guarded = ['id'];

    protected $casts = [
        'gender' => Gender::class,
    ];

    public function results(): MorphMany
    {
        return $this->morphMany(Result::class, 'entrant');
    }
}
