<?php

namespace App\Casts;

use Carbon\CarbonInterval;
use Exception;
use Illuminate\Contracts\Database\Eloquent\CastsAttributes;
use Illuminate\Database\Eloquent\Model;
use App\Support\Time as CarbonTime;

class Time implements CastsAttributes
{
    /**
     * Cast the given value.
     *
     * @param Model $model
     * @param string $key
     * @param mixed $value
     * @param array $attributes
     * @return mixed
     *
     * @throws Exception
     */
    public function get($model, string $key, $value, array $attributes): mixed
    {
        $microseconds = ($value % 100) * 10000;
        $seconds = (int)floor($value / 100);
        $minutes = (int)floor($seconds / 60);
        $seconds %= 60;

        return CarbonTime::create(years: 0, minutes: $minutes, seconds: $seconds, microseconds: $microseconds);
    }

    /**
     * Prepare the given value for storage.
     *
     * @param  Model  $model
     * @param  string  $key
     * @param  int|CarbonInterval  $value
     * @param  array  $attributes
     * @return float|int
     */
    public function set($model, string $key, $value, array $attributes): float|int
    {
        if (is_numeric($value)) {
            return (int)$value;
        }
        return $value->totalMicroseconds / 10000;
    }
}
