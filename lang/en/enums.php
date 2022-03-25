<?php

use App\Enums\CompetitionStatus;
use App\Enums\Gender;
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
    ],
    CompetitionStatus::class => [
        CompetitionStatus::New => 'New',
        CompetitionStatus::Wanted => 'Wanted',
        CompetitionStatus::ScheduledForImport => 'Scheduled for import',
        CompetitionStatus::UnableToImport => 'Unable to import',
        CompetitionStatus::Published => 'Published',
    ],
    Gender::class => [
        Gender::Men => 'Men',
        Gender::Women => 'Women',
    ],
];
