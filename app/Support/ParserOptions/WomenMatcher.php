<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;

class WomenMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'women_matcher';
    public string $label = 'Women matcher';
    public string $group = Option::GROUP_EVENT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }
}
