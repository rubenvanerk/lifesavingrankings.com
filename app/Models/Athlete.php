<?php

namespace App\Models;

use App\Casts\Countries;
use App\Enums\CompetitionStatus;
use App\Enums\Gender;
use App\Traits\HasCachedCount;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Athlete extends Model
{
    use HasFactory, HasSlug, HasCachedCount;

    protected $guarded = ['id'];

    protected $casts = [
        'nationalities' => Countries::class,
        'gender' => Gender::class,
    ];

    protected static function booted(): void
    {
        static::addGlobalScope('published', function (Builder $builder) {
            $builder->has('results');
        });
    }

    public function getSlugOptions(): SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('name')
            ->saveSlugsTo('slug');
    }

    public function results(): MorphMany
    {
        return $this->morphMany(Result::class, 'entrant');
    }
}
