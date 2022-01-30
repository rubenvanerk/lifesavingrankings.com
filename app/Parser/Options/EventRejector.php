<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;

class EventRejector extends Option
{
    public mixed $value = '';
    public string $name = 'event_rejector';
    public string $label = 'Event rejector';
    public string $group = Option::GROUP_EVENT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }
}
