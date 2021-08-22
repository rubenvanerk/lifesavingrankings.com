<?php

namespace App\Models;

use App\Enums\EventType;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;
use Staudenmeir\EloquentEagerLimit\HasEagerLimit;

class Event extends Model
{
    use HasFactory, HasSlug, HasEagerLimit;

    protected $guarded = ['id'];

    protected $casts = [
        'type' => EventType::class,
    ];

    protected static function booted(): void
    {
        static::addGlobalScope('sorted', function (Builder $builder) {
            $builder->orderBy('type')->orderBy('sort_order');
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

    public function record(): HasOne
    {
        return $this->hasOne(Result::class)->orderBy('time');
    }

    public function segments(): HasMany
    {
        return $this->hasMany(RelaySegment::class);
    }
}