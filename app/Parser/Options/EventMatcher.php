<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Models\Event;
use Str;

class EventMatcher extends Option
{
    public string $name;
    public string $label = '';
    public string $group = Option::GROUP_EVENTS;
    public Event $event;

    public function __construct(Event $event = null)
    {
        $this->value = '';
        $this->event = $event;
        $this->name = Str::slug($event->name, '_');
        $this->label = $event->name;
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct();
    }
}
