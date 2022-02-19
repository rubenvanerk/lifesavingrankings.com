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
            get: fn($value) => strtolower($value ?: ''),
            set: fn($value) => strtoupper($value ?: ''),
        );
    }

    public function getCountryAttribute(): \Rinvex\Country\Country|null
    {
        return $this->country_code ? country($this->country_code) : null;
    }
}
