<?php

use App\Enums\TimekeepingMethod;
use App\Enums\VenueType;

return [
    TimekeepingMethod::class => [
        TimekeepingMethod::Unknown => 'Unknown',
        TimekeepingMethod::ByHand => 'By hand',
        TimekeepingMethod::Electronic => 'Electronic',
    ],
    VenueType::class => [
        VenueType::Pool => 'Pool',
        VenueType::Beach => 'Beach',
    ]
];
