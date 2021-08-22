<?php

namespace App\Casts;

use Carbon\CarbonInterval;
use Illuminate\Contracts\Database\Eloquent\CastsAttributes;

class Time implements CastsAttributes
{
    /**
     * Cast the given value.
     *
     * @param  \Illuminate\Database\Eloquent\Model  $model
     * @param  string  $key
     * @param  mixed  $value
     * @param  array  $attributes
     * @return mixed
     */
    public function get($model, $key, $value, $attributes)
    {
        $microseconds = ($value % 100) * 10000;
        $seconds = (int)floor($value / 100);
        $minutes = (int)floor($seconds / 60);
        $seconds %= 60;

        return CarbonInterval::create(years: 0, minutes: $minutes, seconds: $seconds, microseconds: $microseconds);
    }

    /**
     * Prepare the given value for storage.
     *
     * @param  \Illuminate\Database\Eloquent\Model  $model
     * @param  string  $key
     * @param  mixed  $value
     * @param  array  $attributes
     * @return mixed
     */
    public function set($model, $key, $value, $attributes)
    {
        if (is_numeric($value)) {
            return (int)$value;
        }
        return $value->microseconds / 10000;
    }
}
