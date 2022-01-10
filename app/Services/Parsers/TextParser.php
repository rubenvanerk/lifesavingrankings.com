<?php

namespace App\Services\Parsers;

use App\Enums\ParserConfigOptionType;
use App\Interfaces\ParserInterface;
use App\Models\Media;
use Illuminate\Support\Collection;
use Spatie\Regex\Regex;

class TextParser implements ParserInterface
{
    public function getRawText(Media $competitionFile): string
    {
        return file_get_contents($competitionFile->getPath());
    }

    public function getParsedResults(Media $competitionFile): Collection
    {
        $lines = explode("\n", $this->getRawText($competitionFile));
        $options = $competitionFile->parser_config->options;
        foreach ($lines as $line) {
//            if (Regex::match($options['event_indicator']->value, $line)->hasMatch()) {
//
//            }
        }

        return collect();
    }
}
