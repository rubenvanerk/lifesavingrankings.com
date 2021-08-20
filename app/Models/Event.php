<?php

namespace App\Models;

use App\Enums\CompetitionStatus;
use App\Enums\EventType;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Event extends Model
{
    use HasFactory, HasSlug;

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

    public function segments(): HasMany
    {
        return $this->hasMany(RelaySegment::class);
    }
}
