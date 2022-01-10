<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;

class AthleteMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'athlete_matcher';
    public string $label = 'Athlete matcher';
    public string $group = Option::GROUP_RESULT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }
}
