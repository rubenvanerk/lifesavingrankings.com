<?php

namespace App\Support\ParserOptions;

use Parser;
use Spatie\Regex\Regex;

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
    public const GROUP_RESULT = 'result';

    public function __construct($value = null)
    {
        if (!is_null($value)) {
            $this->value = $value;
        }
    }

    public function hasMatch($string): bool
    {
        if (!Parser::isValidRegex($this->value)) {
            return false;
        }

        return Regex::match($this->value, $string)->hasMatch();
    }

    public function getMatch($string): ?string
    {
        if (!Parser::isValidRegex($this->value)) {
            return false;
        }

        return Regex::match($this->value, $string)->result();
    }
}
