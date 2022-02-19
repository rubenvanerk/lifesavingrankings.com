<?php

namespace App\Casts;

use Illuminate\Contracts\Database\Eloquent\CastsAttributes;
use Illuminate\Database\Eloquent\Model;
use App\Support\Time as CarbonTime;

class Time implements CastsAttributes
{
    const CENTISECONDS_PER_MINUTE = 6000;
    const CENTISECONDS_PER_SECOND = 100;

    /**
     * Cast the given value.
     *
     * @param Model $model
     * @param string $key
     * @param mixed $value
     * @param array $attributes
     * @return CarbonTime
     */
    public function get(
        $model,
        string $key,
        $value,
        array $attributes,
    ): CarbonTime {
        $totalCentiseconds = (int) $value;

        $minutes = (int) floor(
            $totalCentiseconds / self::CENTISECONDS_PER_MINUTE,
        );
        $totalCentiseconds = $totalCentiseconds % self::CENTISECONDS_PER_MINUTE;

        $seconds = (int) floor(
            $totalCentiseconds / self::CENTISECONDS_PER_SECOND,
        );
        $centiseconds = $totalCentiseconds % self::CENTISECONDS_PER_SECOND;

        return new CarbonTime($minutes, $seconds, $centiseconds);
    }

    /**
     * Prepare the given value for storage.
     *
     * @param Model $model
     * @param string $key
     * @param int|CarbonTime $value
     * @param array $attributes
     * @return float|int|null
     */
    public function set(
        $model,
        string $key,
        $value,
        array $attributes,
    ): float|int|null {
        if (empty($value)) {
            return null;
        }
        if (is_numeric($value)) {
            return (int) $value;
        }
        return $value->totalCentiseconds;
    }
}
