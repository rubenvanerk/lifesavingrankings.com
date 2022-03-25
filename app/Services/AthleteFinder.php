<?php

namespace App\Services;

use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use Illuminate\Database\Eloquent\Builder;

class AthleteFinder
{
    protected static array $rememberedAthletes = [];

    public static function firstOrNew(
        string $name,
        Gender $gender,
        ?int $yearOfBirth,
        ?Competition $competition = null
    ): Athlete {
        $where = [
            'name' => $name,
            'gender' => $gender,
        ];

        if ($yearOfBirth !== null) {
            $where['year_of_birth'] = $yearOfBirth;
        }

        $athleteQuery = Athlete::withoutGlobalScope('published');

        // If an athlete cannot be found, try searching it in the current competition without YoB contraint
        if (!$athleteQuery->where($where)->exists()) {
            unset($where['year_of_birth']);
            $athleteQuery = $athleteQuery->where($where)->whereHas(
                'results',
                fn (Builder $query) => $query
                    ->withoutGlobalScopes(['published', 'without_segments'])
                    ->whereBelongsTo($competition)
            );
        }

        $athlete = $athleteQuery->firstOrNew($where);

        $athlete->gender = $gender;

        return $athlete;
    }
}
