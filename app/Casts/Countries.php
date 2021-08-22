<?php

namespace App\Casts;

use Illuminate\Contracts\Database\Eloquent\CastsAttributes;

class Countries implements CastsAttributes
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
        if (empty($value)) {
            return null;
        }

        $countryCodes = collect(json_decode($value));
        return $countryCodes->map(function ($countryCode) {
            return country($countryCode);
        });
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
        if (empty($value)) {
            return null;
        }

        if (!is_iterable($value)) {
            $value = [$value];
        }

        return collect($value)->map(function ($country) {
            return is_string($country) ? $country : $country->getIsoAlpha2();
        });
    }
}
