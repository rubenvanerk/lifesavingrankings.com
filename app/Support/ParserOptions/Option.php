<?php

namespace App\Support\ParserOptions;

abstract class Option
{
    public mixed $type;
    public string $name;
    public string $label;
    public mixed $value;

    public string $group;

    public const GROUP_EVENTS = 'events';
    public const GROUP_PDF = 'pdf';
    public const GROUP_TEXT = 'text';

    public function __construct($value = null)
    {
        if (!is_null($value)) {
            $this->value = $value;
        }
    }
}
