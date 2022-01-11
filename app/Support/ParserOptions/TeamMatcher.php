<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;
use App\Models\Team;

class TeamMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'team_matcher';
    public string $label = 'Team matcher';
    public string $group = Option::GROUP_ENTRANT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    public function getMatch(string $string): Team
    {
        /** @var Team $team */
        $team = Team::query()->firstOrNew([
            'name' => parent::getMatch($string),
        ]);

        return $team;
    }
}
