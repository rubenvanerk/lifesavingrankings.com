<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Support\Time;
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

    public function getMatches(string $string): ?Collection
    {
        $splitsAsText = parent::getMatches($string);

        if (!$splitsAsText instanceof Collection) {
            return null;
        }

        return $splitsAsText->map(function ($splitAsText) {
            $centiseconds = (int)Regex::match('/\d{2}$/', $splitAsText)->result();
            $seconds = (int)Regex::match('/\d{1,2}(?=[^\d]+\d{2}$)/', $splitAsText)->result();
            $minutes = (int)Regex::match('/\d{1,2}(?=[^\d]+\d{1,2}[^\d]+\d{2}$)/', $splitAsText)->result();

            return new Time($minutes, $seconds, $centiseconds);
        });
    }
}
