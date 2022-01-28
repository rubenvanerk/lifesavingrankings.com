<?php

namespace App\Casts;

use Carbon\CarbonInterval;
use Exception;
use Illuminate\Contracts\Database\Eloquent\CastsAttributes;
use Illuminate\Database\Eloquent\Model;

class Splits implements CastsAttributes
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
        $splits = collect(json_decode($value));
        return $splits->map(function ($split) {
            $microseconds = ((int)$split % 100) * 10000;
            $seconds = (int)floor((int)$split / 100);
            $minutes = (int)floor($seconds / 60);
            $seconds %= 60;
            return CarbonInterval::create(years: 0, minutes: $minutes, seconds: $seconds, microseconds: $microseconds);
        });
    }

    /**
     * Prepare the given value for storage.
     *
     * @param Model $model
     * @param string $key
     * @param int|CarbonInterval $value
     * @param array $attributes
     * @return string
     */
    public function set($model, string $key, $value, array $attributes): string
    {
        $splits = [];
        foreach ($value as $split) {
            if (is_numeric($split)) {
                $splits[] = (int)$split;
            }
            $splits[] =  $split->microseconds / 10000;
        }
        return json_encode($splits);
    }
}
