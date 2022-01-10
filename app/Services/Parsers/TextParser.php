<?php

namespace App\Services\Parsers;

use App\Interfaces\ParserInterface;
use App\Models\Event;
use App\Models\Media;
use App\Support\ParserOptions\Option;
use Illuminate\Support\Collection;

class TextParser implements ParserInterface
{
    protected Collection $options;

    public function getRawText(Media $competitionFile): string
    {
        return file_get_contents($competitionFile->getPath());
    }

    public function getParsedResults(Media $competitionFile): Collection
    {
        $lines = explode("\n", $this->getRawText($competitionFile));
        $this->options = $competitionFile->parser_config->options;
        foreach ($lines as $line) {
            if ($this->options['event_indicator']->matches($line)) {
                $event = $this->getEventFromLine($line);
            }
        }

        return collect();
    }

    private function getEventFromLine(string $line): ?Event
    {
        $eventMatchers = $this->options->where('group', Option::GROUP_EVENTS);
        foreach ($eventMatchers as $eventMatcher) {
            if ($eventMatcher->matches($line)) {
                return $eventMatcher->event;
            }
        }

        return null;
    }
}
