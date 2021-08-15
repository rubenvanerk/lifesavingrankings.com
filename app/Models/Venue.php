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

    public function getTypeCodeAttribute(): string
    {
        return strtolower(optional(VenueType::coerce($this->type))->key);
    }

    public function getTypeDescriptionAttribute(): string
    {
        return optional(VenueType::coerce($this->type))->description;
    }

    public function getTypeColorAttribute(): string
    {
        if (VenueType::coerce($this->type)->is(VenueType::Beach)) {
            return 'yellow';
        }
        return 'blue';
    }

    public function getPoolSizeLabelAttribute(): string
    {
        return $this->pool_size . 'm';
    }
}
