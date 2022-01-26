<?php

namespace App\Support\ParserOptions;

use App\Services\Parsers\ParserService;
use Illuminate\Support\Collection;
use Parser;
use Spatie\Regex\MatchResult;
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
    public const GROUP_EVENT = 'event';
    public const GROUP_RESULT = 'result';
    const GROUP_ENTRANT = 'entrant';

    public function __construct($value = null)
    {
        if (!is_null($value)) {
            $this->value = $value;
        }
    }

    public function hasMatch(string $string): bool
    {
        if (!ParserService::isValidRegex($this->value)) {
            return false;
        }

        return Regex::match($this->value, $string)->hasMatch();
    }

    public function getMatch(string $string): mixed
    {
        if (!ParserService::isValidRegex($this->value)) {
            return null;
        }

        return trim(Regex::match($this->value, $string)->result());
    }

    public function getMatches(string $string): ?Collection
    {
        if (!ParserService::isValidRegex($this->value)) {
            return null;
        }

        $matches = collect(Regex::matchAll($this->value, $string)->results());
        return $matches->map(fn (MatchResult $matchResult) => trim($matchResult->result()));
    }
}
