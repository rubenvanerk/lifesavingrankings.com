<?php

namespace App\Models;

use App\Casts\Time;
use App\Enums\CompetitionStatus;
use App\Services\Filter;
use App\Traits\HasCachedCount;
use App\Traits\HasTime;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphTo;
use Staudenmeir\EloquentEagerLimit\HasEagerLimit;

class Result extends Model
{
    use HasFactory, HasCachedCount, HasEagerLimit, HasTime;

    protected $guarded = ['id'];

    protected $casts = [
        'time' => Time::class,
    ];

    protected static function booted(): void
    {
        static::addGlobalScope('published', function (Builder $builder) {
            $builder->whereHas('competition', function (Builder $query) {
                $query->where('status', CompetitionStatus::Published);
            });
        });
    }

    public function competition(): BelongsTo
    {
        return $this->belongsTo(Competition::class);
    }

    public function competition_category(): BelongsTo
    {
        return $this->belongsTo(CompetitionCategory::class);
    }

    public function event(): BelongsTo
    {
        return $this->belongsTo(Event::class);
    }

    public function entrant(): MorphTo
    {
        return $this->morphTo()->withoutGlobalScope('published');
    }

    public function team(): BelongsTo
    {
        return $this->belongsTo(Team::class);
    }

    public function splits(): HasMany
    {
        return $this->hasMany(Split::class);
    }

    public function scopeValid(Builder $query): void
    {
        $query->whereNull('status');
    }

    public function scopeFilter(Builder $query): void
    {
        $filter = app(Filter::class);

        if ($filter->getValue('from_date')) {
            $query->whereHas('competition', function (Builder $query) use ($filter) {
                $query->whereDate('start_date', '>=', $filter->getValue('from_date'));
            });
        }

        if ($filter->getValue('to_date')) {
            $query->whereHas('competition', function (Builder $query) use ($filter) {
                $query->whereDate('start_date', '<=', $filter->getValue('to_date'));
            });
        }

        if ($filter->getValue('competition')) {
            $query->whereHas('competition', function (Builder $query) use ($filter) {
                $query->where('id', $filter->getValue('competition'));
            });
        }

        if ($filter->getValue('event')) {
            $query->whereHas('event', function (Builder $query) use ($filter) {
                $query->where('id', $filter->getValue('event'));
            });
        }

        if ($filter->getValue('athlete')) {
            $query->whereHasMorph('entrant', [Athlete::class], function (Builder $query) use ($filter) {
                $query->where('id', $filter->getValue('athlete'));
            });
        }

        if ($filter->getValue('gender')) {
            $query->whereHasMorph('entrant', [Athlete::class], function (Builder $query) use ($filter) {
                $query->where('gender', $filter->getValue('gender'));
            });
        }

        if ($filter->getValue('team')) {
            $query->whereHas('team', function (Builder $query) use ($filter) {
                $query->where('id', $filter->getValue('team'));
            });
        }

        if ($filter->getValue('from_year_of_birth')) {
            $query->whereHasMorph('entrant', [Athlete::class], function (Builder $query) use ($filter) {
                $query->where('year_of_birth', '>=', $filter->getValue('from_year_of_birth'));
            });
        }

        if ($filter->getValue('to_year_of_birth')) {
            $query->whereHasMorph('entrant', [Athlete::class], function (Builder $query) use ($filter) {
                $query->where('year_of_birth', '<=', $filter->getValue('to_year_of_birth'));
            });
        }
    }
}
