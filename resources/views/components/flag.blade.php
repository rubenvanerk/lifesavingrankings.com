@props(['country'])

@php
    $currentLocale = config('app.locales.' . app()->getLocale() . '.code3');
    $countryName = $country->getTranslation($currentLocale)['common'];
@endphp

<span x-data>
    <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                         x-tooltip="{{ $countryName }}"
                        {{ $attributes->class('h-3.5') }}/>
</span>
