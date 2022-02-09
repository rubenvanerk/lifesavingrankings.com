<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Support\Time;
use Exception;
use Spatie\Regex\Regex;

class TimeMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'time_matcher';
    public string $label = 'Time matcher';
    public string $group = Option::GROUP_RESULT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    public function getMatch(string $string): ?Time
    {
        $timeAsText = parent::getMatch($string);

        if (is_null($timeAsText)) {
            return null;
        }

        $centiseconds = (int) Regex::match('/\d{2}$/', $timeAsText)->result();
        $seconds = (int) Regex::match(
            '/\d{1,2}(?=[^\d]+\d{2}$)/',
            $timeAsText,
        )->result();
        $minutes = (int) Regex::match(
            '/\d{1,2}(?=[^\d]+\d{1,2}[^\d]+\d{2}$)/',
            $timeAsText,
        )->result();

        return new Time($minutes, $seconds, $centiseconds);
    }
}
