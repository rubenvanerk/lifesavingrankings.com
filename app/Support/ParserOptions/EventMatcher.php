<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;
use Str;

class EventMatcher extends Option
{
    public string $name = 'event_indicator';
    public string $label = '';
    public string $group = Option::GROUP_EVENTS;

    public function __construct($label = null)
    {
        $this->value = '';
        $this->name = Str::slug($label, '_');
        $this->label = $label;
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct();
    }
}
