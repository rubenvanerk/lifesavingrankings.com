<?php

namespace App\Casts;

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
     */
    public function get($model, string $key, $value, array $attributes): mixed
    {
        $splits = collect(json_decode($value));
        return $splits->map(function ($split) {
            $totalCentiseconds = (int)$split;
            $minutes = $totalCentiseconds % 6000;
            $totalCentiseconds -= $minutes * 6000;
            $seconds = $totalCentiseconds % 100;
            $centiseconds = $totalCentiseconds - $seconds * 100;
            return new \App\Support\Time($minutes, $seconds, $centiseconds);
        });
    }

    /**
     * Prepare the given value for storage.
     *
     * @param Model $model
     * @param string $key
     * @param array $value
     * @param array $attributes
     * @return string
     */
    public function set($model, string $key, $value, array $attributes): string
    {
        $splits = [];
        foreach ($value as $split) {
            if (is_numeric($split)) {
                $splits[] = (int)$split;
            } else {
                $splits[] =  $split->totalCentiseconds;
            }
        }
        return json_encode($splits);
    }
}
