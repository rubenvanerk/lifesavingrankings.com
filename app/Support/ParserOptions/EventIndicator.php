<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;

class EventIndicator extends Option
{
    public mixed $value = '/Event/';
    public string $name = 'event_indicator';
    public string $label = 'Event indicator';

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    public function renderInput()
    {
        // TODO: Implement renderInput() method.
    }
}
