<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class CompetitionCategory extends Model
{
    protected $guarded = ['id'];

    public function competition(): BelongsTo
    {
        return $this->belongsTo(BelongsTo::class);
    }

    public function results(): HasMany
    {
        return $this->hasMany(Result::class);
    }
}
