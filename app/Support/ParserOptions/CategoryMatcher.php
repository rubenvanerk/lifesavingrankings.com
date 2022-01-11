<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;
use Str;

class CategoryMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'category_matcher';
    public string $label = 'Category matcher';
    public string $group = Option::GROUP_EVENT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    public function getMatch(string $string): ?string
    {
        return parent::getMatch($string);
    }
}
