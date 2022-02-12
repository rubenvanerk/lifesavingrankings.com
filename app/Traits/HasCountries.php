<?php namespace App\Traits;

use Illuminate\Database\Eloquent\Casts\Attribute;

trait HasCountries
{
    protected function countryCodes(): Attribute
    {
        return new Attribute(
            get: fn($countryCodes) => collect(json_decode($countryCodes))->map(
                fn($countryCode) => strtolower($countryCode),
            ),
            set: fn($countryCodes) => collect($countryCodes)->map(
                fn($countryCode) => strtoupper($countryCode),
            ),
        );
    }

    public function getCountriesAttribute()
    {
        return $this->country_codes->map( // @phpstan-ignore-line
            fn($countryCode) => country($countryCode),
        );
    }
}
