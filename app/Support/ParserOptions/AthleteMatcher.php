<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;
use Str;

class AthleteMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'athlete_matcher';
    public string $label = 'Athlete matcher';
    public string $group = Option::GROUP_ENTRANT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    public function getMatch(string $string): ?string
    {
        $name = trim(parent::getMatch($string));

        if (Str::contains($name, ',')) {
            $parts = explode(',', $name);
            $parts = array_map('trim', $parts);
            $parts = array_reverse($parts);
            $name = implode(' ', $parts);
        }

        return $name;
    }
}
