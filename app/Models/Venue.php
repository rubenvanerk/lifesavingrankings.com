<?php

namespace App\Models;

use App\Enums\VenueType;
use App\Traits\HasCountry;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Venue extends Model
{
    use HasFactory, HasCountry, HasSlug;

    protected $guarded = ['id'];

    protected $casts = [
        'type' => VenueType::class,
    ];

    public function competitions(): BelongsToMany
    {
        return $this->belongsToMany(Competition::class);
    }

    public function getSlugOptions(): SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('name')
            ->saveSlugsTo('slug');
    }

    public function getTypeColorAttribute(): string
    {
        if ($this->type->is(VenueType::Beach)) {
            return 'yellow';
        }
        return 'blue';
    }

    public function getPoolSizeLabelAttribute(): string
    {
        return $this->pool_size . 'm';
    }

    public function getIsPoolAttribute(): bool
    {
        return $this->type->is(VenueType::Pool);
    }
}
