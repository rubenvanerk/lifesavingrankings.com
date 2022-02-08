<?php

namespace App\Models;

use App\Enums\CompetitionStatus;
use App\Enums\TimekeepingMethod;
use App\Traits\HasCachedCount;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Laravel\Scout\Searchable;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Sluggable\HasSlug;
use Spatie\Sluggable\SlugOptions;

class Competition extends Model implements HasMedia
{
    use HasFactory, HasSlug, HasCachedCount, InteractsWithMedia, Searchable;

    protected $guarded = ['id'];
    protected $dates = ['start_date', 'end_date', 'published_at'];
    protected $casts = [
        'status' => CompetitionStatus::class,
        'timekeeping' => TimekeepingMethod::class,
        'videos' => 'array',
    ];

    protected static function booted(): void
    {
        static::addGlobalScope('without_new', function (Builder $builder) {
            $builder->where('status', '<>', CompetitionStatus::New);
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

    public function categories(): HasMany
    {
        return $this->hasMany(CompetitionCategory::class);
    }

    public function venues(): BelongsToMany
    {
        return $this->belongsToMany(Venue::class);
    }

    public function getTimeKeepingColorAttribute(): string
    {
        return match ($this->timekeeping->value) {
            TimekeepingMethod::ByHand => 'blue',
            TimekeepingMethod::Electronic => 'amber',
            default => 'gray',
        };
    }

    public function getStatusColorAttribute(): string
    {
        return match ($this->status->value) {
            CompetitionStatus::Wanted => 'amber',
            CompetitionStatus::ScheduledForImport => 'violet',
            CompetitionStatus::UnableToImport => 'red',
            CompetitionStatus::Published => 'emerald',
            default => 'gray',
        };
    }

    public function getStatusNameAttribute()
    {
        return $this->status->description;
    }

    public function getIsPublishedAttribute(): bool
    {
        return $this->status->is(CompetitionStatus::Published());
    }

    public function getAthleteCountAttribute(): int
    {
        return Athlete::query()
            ->whereHas('results', function (Builder $query) {
                $query->whereRelation('competition', 'id', $this->id);
            })->count();
    }
}
