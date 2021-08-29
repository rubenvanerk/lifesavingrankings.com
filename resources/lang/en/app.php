<?php

use App\Enums\CompetitionStatus;

return [
    'welcome' => 'Welcome to Lifesaving:htmlRankings.com',
    'tagline' => 'The :style_open largest :style_close lifesaving competition database',

    'athletes' => 'Athlete|Athletes',
    'competitions' => 'Competition|Competitions',
    'results' => 'Result|Results',
    'events' => 'Event|Events',
    'venues' => 'Venue|Venues',
    'time' => 'Time',
    'date' => 'Date',
    'teams' => 'Team|Teams',

    'timekeeping' => 'Timekeeping',
    'original_files' => 'Original files',
    'download' => 'Download',
    'videos' => 'Videos',
    'watch' => 'Watch',
    'status' => 'Status',
    'ils_sanctioned' => 'ILS sanctioned competition',
    'status_descriptions' => [
        CompetitionStatus::Wanted => "I'm looking for results for this competitions. Please contact me if you have them!",
        CompetitionStatus::ScheduledForImport => 'Results for this competition are not available yet. Vote on this competition to help me prioritise importing competitions!',
        CompetitionStatus::UnableToImport => "I can't import the files for this competition. Please contact me if you have the results in a different format!",
    ],

    'name' => 'Name',
    'country' => 'Country',
    'city' => 'City',
    'pool_size' => 'Pool length',

    'women' => 'women',
    'men' => 'men',
    'world' => 'world',
    'records' => 'records',
    'filtered' => 'filtered',

    'call_to_action' => [
        'missing_a_result' => 'Missing a result?',
        'let_me_know' => 'Let me know!',
        'are_you_missing_a_result' => 'Are you missing a personal best? Or the latest national championships of your country? :break Please add the competition to the list!',
        'add_competition' => 'Add a competition'
    ],

    'added_competition' => 'Added :competition_name with :result_count results',

    'sponsors' => ':style_open Sponsors :style_close of Lifesaving:htmlRankings.com',

    'search' => 'Search',
    'open_main_menu' => 'Open main menu',
    'open_user_menu' => 'Open user menu',

    'help_translating' => 'Help translating',
];
