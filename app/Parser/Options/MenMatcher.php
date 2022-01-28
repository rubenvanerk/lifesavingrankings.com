<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;

class MenMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'men_matcher';
    public string $label = 'Men matcher';
    public string $group = Option::GROUP_EVENT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }
}
