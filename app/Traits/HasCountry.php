<?php namespace App\Traits;


trait HasCountry
{
    public function getCountryNameAttribute()
    {
        $currentLocale = config('app.locales.' . app()->getLocale() . '.code3');
        $country = country($this->country_code);
        return $country->getTranslation($currentLocale)['common'];
    }
}
