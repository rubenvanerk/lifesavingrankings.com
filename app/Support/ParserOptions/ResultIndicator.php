<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;

class ResultIndicator extends Option
{
    public mixed $value = '';
    public string $name = 'result_indicator';
    public string $label = 'Result indicator';
    public string $group = Option::GROUP_RESULT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }
}
