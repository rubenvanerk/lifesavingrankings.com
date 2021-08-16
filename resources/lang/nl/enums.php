<?php

use App\Enums\TimekeepingMethod;
use App\Enums\VenueType;

return [
    TimekeepingMethod::class => [
        TimekeepingMethod::Unknown => 'Onbekend',
        TimekeepingMethod::ByHand => 'Met de hand',
        TimekeepingMethod::Electronic => 'Elektronisch',
    ],
    VenueType::class => [
        VenueType::Pool => 'Zwembad',
        VenueType::Beach => 'Strand',
    ]
];
