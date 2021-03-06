<?php

namespace App\Models;

use App\Traits\HasCountry;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Laravel\Scout\Searchable;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Team extends Model
{
    use HasFactory, HasCountry, HasSlug, Searchable;

    protected $guarded = ['id'];

    protected static function booted(): void
    {
        static::addGlobalScope('with_valid_results', function (Builder $query) {
            $query->whereHas('results', function (Builder $query) {
                /** @var Result $query */
                $query->valid();
            });
        });
    }

    public function getSlugOptions(): SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('name')
            ->saveSlugsTo('slug');
    }

    public function results(): HasMany
    {
        return $this->hasMany(Result::class);
    }
}
