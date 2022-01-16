<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;
use App\Models\Team;
use Illuminate\Support\Collection;

class TeamMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'team_matcher';
    public string $label = 'Team matcher';
    public string $group = Option::GROUP_ENTRANT;

    private array $teamCache = [];

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    public function getMatch(string $string): Team
    {
        $teamName = parent::getMatch($string);

        if (isset($this->teamCache[$teamName])) {
            return $this->teamCache[$teamName];
        }

        /** @var Team $team */
        $team = Team::query()->firstOrNew([
            'name' => $teamName,
        ]);

        $this->teamCache[$team->name] = $team;

        return $team;
    }
}
