<?php

namespace App\Services;

use App\Enums\Gender;
use App\Models\Athlete;

class AthleteFinder
{
    protected static array $rememberedAthletes = [];

    public static function findOrNewAthlete(string $name, Gender $gender, ?int $yearOfBirth, $remember = true): Athlete
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

        $athlete =  Athlete::firstOrNew($where);
        $athlete->gender = $gender;

        self::$rememberedAthletes[$name . $gender . $yearOfBirth] = $athlete;

        return $athlete;
    }
}
