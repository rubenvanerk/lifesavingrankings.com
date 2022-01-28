<?php

namespace App\Models;

use App\Traits\Parseable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class CompetitionCategory extends Model
{
    use HasFactory, Parseable;

    protected $guarded = ['id'];

    protected array $parsedAttributes = ['name'];

    public function competition(): BelongsTo
    {
        return $this->belongsTo(Competition::class);
    }

    public function results(): HasMany
    {
        return $this->hasMany(Result::class);
    }
}
