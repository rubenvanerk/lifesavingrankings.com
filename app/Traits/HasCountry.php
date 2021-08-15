<?php namespace App\Traits;

use PragmaRX\Countries\Package\Countries;

trait HasCountry
{
    public function getCountryAttribute()
    {
        return (new Countries())->where('cca3', strtoupper($this->country_code))->first();
    }
}
