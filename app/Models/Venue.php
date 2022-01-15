<?php

namespace App\Models;

use App\Casts\Country;
use App\Enums\VenueType;
use App\Traits\HasCountry;
use Illuminate\Database\Eloquent\Builder;
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

    public function scopePool(Builder $query)
    {
        $query->where('type', VenueType::Pool());
    }

    public function scopeBeach(Builder $query)
    {
        $query->where('type', VenueType::Beach());
    }

    public function getTypeColorAttribute(): string
    {
        if ($this->type->is(VenueType::Beach)) {
            return 'amber';
        }
        return 'blue';
    }

    public function getTypeNameAttribute(): string
    {
        return $this->type->description;
    }

    public function getPoolSizeLabelAttribute(): string
    {
        return $this->pool_size ? $this->pool_size . 'm' : '';
    }

    public function getIsPoolAttribute(): bool
    {
        return $this->type->is(VenueType::Pool);
    }

    public function getNameForSelectAttribute(): string
    {
        return $this->name . ' - ' . $this->city . ', ' . $this->country_name;
    }
}
