<?php

namespace App\Models;

use App\Enums\TimekeepingMethod;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Competition extends Model
{
    use HasFactory, HasSlug;

    protected $guarded = ['id'];
    protected $dates = ['start_date', 'end_date', 'published_on'];

    public function venues(): BelongsToMany
    {
        return $this->belongsToMany(Venue::class);
    }

    public function getSlugOptions(): SlugOptions
    {
        return SlugOptions::create()
            ->generateSlugsFrom('name')
            ->saveSlugsTo('slug');
    }

    public function getTimeKeepingColorAttribute(): string
    {
        return match ($this->timekeeping) {
            TimekeepingMethod::ByHand => 'blue',
            TimekeepingMethod::Electronic => 'yellow',
            default => 'gray',
        };
    }

    public function getTimeKeepingLabelAttribute(): string
    {
        return match ($this->timekeeping) {
            TimekeepingMethod::ByHand => TimekeepingMethod::getDescription(TimekeepingMethod::ByHand),
            TimekeepingMethod::Electronic => TimekeepingMethod::getDescription(TimekeepingMethod::Electronic),
            default => TimekeepingMethod::getDescription(TimekeepingMethod::Unknown),
        };
    }
}
