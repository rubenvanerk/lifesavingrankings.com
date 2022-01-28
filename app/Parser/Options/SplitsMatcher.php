<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Support\Time;
use Exception;
use Illuminate\Support\Collection;
use Spatie\Regex\Regex;

class SplitsMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'splits_matcher';
    public string $label = 'Splits matcher';
    public string $group = Option::GROUP_RESULT;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    /**
     * @throws Exception
     */
    public function getMatches(string $string): ?Collection
    {
        $splitsAsText = parent::getMatches($string);

        if (!$splitsAsText instanceof Collection) {
            return null;
        }

        return $splitsAsText->map(function ($splitAsText) {
            $tenths = (int)Regex::match('/\d{2}$/', $splitAsText)->result();
            $microseconds = ($tenths % 100) * 10000;
            $seconds = (int)Regex::match('/\d{1,2}(?=[^\d]+\d{2}$)/', $splitAsText)->result();
            $minutes = (int)Regex::match('/\d{1,2}(?=[^\d]+\d{1,2}[^\d]+\d{2}$)/', $splitAsText)->result();

            return Time::create(years: 0, minutes: $minutes, seconds: $seconds, microseconds: $microseconds);
        });
    }
}
