<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Support\Time;
use Carbon\CarbonInterval;
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

    /**
     * @throws Exception
     */
    public function getMatch(string $string): ?CarbonInterval
    {
        $timeAsText = parent::getMatch($string);

        if (is_null($timeAsText)) {
            return null;
        }

        $tenths = (int) Regex::match('/\d{2}$/', $timeAsText)->result();
        $microseconds = ($tenths % 100) * 10000;
        $seconds = (int) Regex::match('/\d{1,2}(?=[^\d]+\d{2}$)/', $timeAsText)->result();
        $minutes = (int) Regex::match('/\d{1,2}(?=[^\d]+\d{1,2}[^\d]+\d{2}$)/', $timeAsText)->result();

        return Time::create(years: 0, minutes: $minutes, seconds: $seconds, microseconds: $microseconds);
    }
}
