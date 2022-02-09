<?php

use App\Enums\CompetitionStatus;

return [
    'welcome' => 'Welkom op Lifesaving:htmlRankings.com',
    'tagline' =>
        'De :style_open grootste :style_close lifesaving uitslagen database',

    'athletes' => 'Sporter|Sporters',
    'competitions' => 'Wedstrijd|Wedstrijden',
    'results' => 'Resultaat|Resultaten',
    'events' => 'Onderdeel|Onderdelen',
    'venues' => 'Locatie|Locaties',
    'time' => 'Tijd',
    'date' => 'Datum',
    'teams' => 'Team|Teams',

    'timekeeping' => 'Tijdwaarneming',
    'original_files' => 'Originele bestanden',
    'download' => 'Downloaden',
    'videos' => "Video's",
    'watch' => 'Bekijken',
    'status' => 'Status',
    'ils_sanctioned' => 'Wedstrijd goedgekeurd door ILS',
    'status_descriptions' => [
        CompetitionStatus::Wanted =>
            'Ik ben op zoek naar uitslagen voor deze wedstrijd. Neem contact met me op als je ze hebt!',
        CompetitionStatus::ScheduledForImport =>
            'Uitslagen voor deze wedstrijd zijn nog niet beschikbaar. Stem op deze wedstrijd om me te helpen het importeren te prioriteren!',
        CompetitionStatus::UnableToImport =>
            'Ik kan de bestanden voor deze wedstrijd niet importeren. Neem contact met me op als je de uitslagen in een ander format hebt!',
    ],

    'name' => 'Naam',
    'country' => 'Land',
    'city' => 'Plaats',
    'pool_size' => 'Baanlengte',

    'women' => 'dames',
    'men' => 'heren',
    'world' => 'wereld',
    'records' => 'records',
    'filtered' => 'gefilterde',

    'call_to_action' => [
        'missing_a_result' => 'Mis je tijden?',
        'let_me_know' => 'Laat het me weten!',
        'are_you_missing_a_result' =>
            'Mis je een persoonlijk record? Of het laatste nationale kampioenschap van je land? :break Voeg de wedstrijd toe aan de lijst!',
        'add_competition' => 'Voeg een wedstrijd toe',
    ],

    'added_competition' =>
        ':competition_name toegevoegd met :result_count resultaten',

    'sponsors' =>
        ':style_open Sponsors :style_close van Lifesaving:htmlRankings.com',

    'search' => 'Zoeken',
    'open_main_menu' => 'Open hoofdmenu',
    'open_user_menu' => 'Open gebruikers menu',

    'help_translating' => 'Help met vertalen',
];
