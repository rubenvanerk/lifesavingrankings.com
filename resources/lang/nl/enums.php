<?php

use App\Enums\CompetitionStatus;
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
    ],
    CompetitionStatus::class => [
        CompetitionStatus::New => 'Nieuw',
        CompetitionStatus::Wanted => 'Gezocht',
        CompetitionStatus::ScheduledForImport => 'Klaar voor importeren',
        CompetitionStatus::UnableToImport => 'Kan niet importeren',
        CompetitionStatus::Published => 'Gepubliceerd',
    ],
];
