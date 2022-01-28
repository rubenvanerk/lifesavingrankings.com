<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use Str;

class RelayTeamMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'relay_team_matcher';
    public string $label = 'Relay team matcher';
    public string $group = Option::GROUP_ENTRANT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }
}
