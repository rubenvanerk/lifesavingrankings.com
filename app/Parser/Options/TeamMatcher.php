<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Models\Team;

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
}
