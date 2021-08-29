<?php namespace App\Traits;


trait HasCountry
{
    public function getCountryNameAttribute()
    {
        $currentLocale = config('app.locales.' . app()->getLocale() . '.code3');
        return $this->country->getTranslation($currentLocale)['common'];
    }

    public function getCountryCodeAttribute()
    {
        return strtolower($this->country->getIsoAlpha2());
    }
}
