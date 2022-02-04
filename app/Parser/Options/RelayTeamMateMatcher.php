<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Models\Team;
use Illuminate\Support\Collection;

class RelayTeamMateMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'team_mate_matcher';
    public string $label = 'Team mate matcher';
    public string $group = Option::GROUP_ENTRANT;
    public bool $canOccurOnNextLine = true;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    public function getMatches(string $string): ?Collection
    {
        $nameParts = explode(',', parent::getMatch($string));
        $nameParts = array_map('trim', $nameParts);
        $names = collect(array_chunk($nameParts, 2));
        return $names->map(function ($nameParts) {
            return implode(' ', array_reverse($nameParts));
        });
    }
}
