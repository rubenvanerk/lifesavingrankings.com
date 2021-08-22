<?php

namespace App\Models;

use App\Casts\Time;
use App\Enums\CompetitionStatus;
use App\Services\Filter;
use App\Traits\HasCachedCount;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;
use Staudenmeir\EloquentEagerLimit\HasEagerLimit;

class Result extends Model
{
    use HasFactory, HasCachedCount, HasEagerLimit;

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

    public function event(): BelongsTo
    {
        return $this->belongsTo(Event::class);
    }

    public function entrant(): MorphTo
    {
        return $this->morphTo();
    }

    public function scopeFilter(Builder $query, Filter $filter): void
    {
        if ($filter->fromDate) {
            $query->whereHas('competition', function (Builder $query) use ($filter) {
                $query->whereDate('start_date', '>=', $filter->fromDate);
            });
        }

        if ($filter->toDate) {
            $query->whereHas('competition', function (Builder $query) use ($filter) {
                $query->whereDate('end_date', '<=', $filter->toDate);
            });
        }
    }

    public function getTimeFormattedAttribute(): string
    {
        if ($this->time->minutes) {
            return sprintf('%s:%s.%s',
                $this->time->minutes,
                str_pad($this->time->seconds, 2, '0', STR_PAD_LEFT),
                str_pad($this->time->microseconds / 10000, 2, '0', STR_PAD_LEFT)
            );
        }
        return sprintf('%s.%s',
            $this->time->seconds,
            str_pad($this->time->microseconds / 10000, 2, '0', STR_PAD_LEFT)
        );
    }
}
