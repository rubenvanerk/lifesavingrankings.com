<?php

namespace App\Services;

use App\Enums\Gender;
use App\Models\Athlete;

class AthleteFinder
{
    protected static array $rememberedAthletes = [];

    public static function firstOrNew(string $name, Gender $gender, ?int $yearOfBirth): Athlete
    {
        if (!empty(self::$rememberedAthletes[$name . $gender . $yearOfBirth])) {
            return self::$rememberedAthletes[$name . $gender . $yearOfBirth];
        }

        $where = [
            'name' => $name,
            'gender' => $gender,
        ];

        if (!empty($yearOfBirth)) {
            $where['year_of_birth'] = $yearOfBirth;
        }

        $athlete = Athlete::withoutGlobalScope('published')->firstOrNew($where);
        $athlete->gender = $gender;

        self::$rememberedAthletes[$name . $gender . $yearOfBirth] = $athlete;

        return $athlete;
    }
}
