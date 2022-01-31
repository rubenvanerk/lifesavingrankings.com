<?php

namespace App\Models;

use App\Enums\Gender;
use App\Services\AthleteFinder;
use App\Services\Filter;
use App\Traits\HasCachedCount;
use App\Traits\HasCountries;
use App\Traits\Parseable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Athlete extends Model
{
    use HasFactory, HasSlug, HasCachedCount, Parseable, HasCountries;

    protected $guarded = ['id'];

    protected $casts = [
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

    public function scopeFilter($query): void
    {
        $filter = app(Filter::class);

        if ($filter->getValue('gender')) {
            $query->where('gender', $filter->getValue('gender'));
        }
    }

    public function getNationalitiesAttribute()
    {
        return $this->countries;
    }

    public function toDatabase(): Athlete
    {
        return AthleteFinder::findOrCreateAthlete($this->name, $this->gender, $this->year_of_birth);
    }

    public function getLastTeamAttribute(): Team
    {
        return $this->results()
            ->join('competitions', 'results.competition_id', '=', 'competitions.id')
            ->latest('competitions.start_date')
            ->first()
            ->team;
    }
}
