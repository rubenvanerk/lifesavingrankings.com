<?php namespace App\Traits;


use Illuminate\Database\Eloquent\Casts\Attribute;

trait HasCountries
{
    protected function countryCodes(): Attribute
    {
        return new Attribute(
            get: fn ($countryCodes) => collect(json_decode($countryCodes))->map(fn ($countryCode) => strtolower($countryCode)),
            set: fn ($countryCodes) => collect($countryCodes)->map(fn ($countryCode) => strtoupper($countryCode)),
        );
    }

    protected function countries(): Attribute
    {
        return new Attribute(
            get: fn($value) => $this->country_codes->map(fn($countryCode) => country($countryCode)), // @phpstan-ignore-line
            set: function ($value) {
                return $value->map(function ($country) {
                    if ($country instanceof \Rinvex\Country\Country) {
                        return $country->getIsoAlpha2();
                    }
                    return $country;
                });
            },
        );
    }
}
