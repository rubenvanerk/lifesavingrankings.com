<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use function today;

class YearOfBirthMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'year_of_birth_matcher';
    public string $label = 'Year of birth matcher';
    public string $group = Option::GROUP_ENTRANT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    public function getMatch(string $string): int
    {
        $yearOfBirth = (int) parent::getMatch($string);

        $minimumYearOfBirth = today()->year - 100; // TODO: make this competition date dependant

        // year of birth can be in YY format, add 100s until in acceptable range
        while ($yearOfBirth < $minimumYearOfBirth && $yearOfBirth < today()->year) {
            $yearOfBirth += 100;
        }

        return $yearOfBirth;
    }
}
