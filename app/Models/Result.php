<?php

namespace App\Models;

use App\Casts\Splits;
use App\Casts\Time;
use App\Enums\CompetitionStatus;
use App\Enums\ResultStatus;
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
        'status' => ResultStatus::class,
        'splits' => Splits::class,
    ];

    protected static function booted(): void
    {
        static::addGlobalScope('published', function (Builder $query) {
            $query->whereHas('competition', function (Builder $query) {
                $query->where('status', CompetitionStatus::Published);
            });
        });

        static::addGlobalScope('without_segments', function (Builder $query) {
            $query->whereNull('parent_id');
        });
    }

    public function media_source(): BelongsTo
    {
        return $this->belongsTo(Media::class, 'media_id');
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
        return $this->belongsTo(Team::class)->withoutGlobalScope('with_valid_results');
    }

    public function segments(): HasMany
    {
        return $this->hasMany(Result::class, 'parent_id')->withoutGlobalScope(
            'without_segments',
        );
    }

    public function parent(): BelongsTo
    {
        return $this->belongsTo(Result::class, 'parent_id');
    }

    public function scopeValid(Builder $query): void
    {
        $query->whereNull('status');
    }

    public function scopeFilter(Builder $query): void
    {
        $filter = app(Filter::class);

        if ($filter->getValue('from_date')) {
            $query->whereRelation(
                'competition',
                'start_date',
                '>=',
                $filter->getValue('from_date'),
            );
        }

        if ($filter->getValue('to_date')) {
            $query->whereRelation(
                'competition',
                'end_date',
                '>=',
                $filter->getValue('to_date'),
            );
        }

        if ($filter->getValue('competition')) {
            $query->whereRelation(
                'competition',
                'id',
                $filter->getValue('competition'),
            );

            if ($filter->getValue('competition_category')) {
                $query->whereRelation(
                    'competition_category',
                    'id',
                    $filter->getValue('competition_category'),
                );
            }
        }

        if ($filter->getValue('event')) {
            $query->whereRelation('event', 'id', $filter->getValue('event'));
        }

        if ($filter->getValue('athlete')) {
            $query->whereMorphRelation(
                'entrant',
                [Athlete::class],
                'id',
                $filter->getValue('athlete'),
            );
        }

        if ($filter->getValue('gender')) {
            $query->where(function (Builder $query) use ($filter) {
                $query
                    ->whereMorphRelation(
                        'entrant',
                        [Athlete::class],
                        'gender',
                        $filter->getValue('gender'),
                    )
                    ->orWhereMorphRelation(
                        'entrant',
                        [RelayTeam::class],
                        'gender',
                        $filter->getValue('gender'),
                    );
            });
        }

        if ($filter->getValue('team')) {
            $query->whereRelation('team', 'id', $filter->getValue('team'));
        }

        if ($filter->getValue('ils_sanctioned')) {
            $query->whereRelation('competition', 'ils_sanctioned', $filter->getValue('ils_sanctioned'));
        }

        if ($filter->getValue('from_year_of_birth')) {
            $query->whereMorphRelation(
                'entrant',
                [Athlete::class],
                'year_of_birth',
                '>=',
                $filter->getValue('from_year_of_birth'),
            );
        }

        if ($filter->getValue('to_year_of_birth')) {
            $query->whereMorphRelation(
                'entrant',
                [Athlete::class],
                'year_of_birth',
                '<=',
                $filter->getValue('to_year_of_birth'),
            );
        }

        if ($filter->getValue('venue')) {
            $query->whereHas('competition', function (Builder $query) use (
                $filter,
            ) {
                $query->whereRelation(
                    'venues',
                    'venues.id',
                    $filter->getValue('venue'),
                );
            });
        }
    }
}
