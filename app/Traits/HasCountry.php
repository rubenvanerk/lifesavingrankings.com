<?php namespace App\Traits;


use Illuminate\Database\Eloquent\Casts\Attribute;

trait HasCountry
{
    public function getCountryNameAttribute()
    {
        $currentLocale = config('app.locales.' . app()->getLocale() . '.code3');
        return $this->country->getTranslation($currentLocale)['common'];
    }

    protected function countryCode(): Attribute
    {
        return new Attribute(
            get: fn ($value) => strtolower($value),
            set: fn ($value) => strtoupper($value),
        );
    }

    protected function country(): Attribute
    {
        return new Attribute(
            get: fn($value) => country($this->country_code),
            set: function ($value) {
                if ($value instanceof \Rinvex\Country\Country) {
                    return $this->country_code = $value->getIsoAlpha2();
                }
                return $this->country_code = $value;
            },
        );
    }
}
