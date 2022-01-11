<?php

namespace App\Services\Parsers;

use App\Enums\EventType;
use App\Interfaces\ParserInterface;
use App\Models\Athlete;
use App\Models\Event;
use App\Models\Media;
use App\Models\Result;
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

        $event = null;
        $results = collect();

        foreach ($lines as $line) {
            if ($this->options['event_indicator']->hasMatch($line)) {
                $event = $this->getEventFromLine($line);
            }
            if ($event && $this->options['result_indicator']->hasMatch($line)) {
                $results->add($this->getResultFromLine($line, $event));
            }
        }

        return $results;
    }

    private function getEventFromLine(string $line): ?Event
    {
        $eventMatchers = $this->options->where('group', Option::GROUP_EVENTS);
        foreach ($eventMatchers as $eventMatcher) {
            if ($eventMatcher->hasMatch($line)) {
                return $eventMatcher->event;
            }
        }

        return null;
    }

    private function getResultFromLine(string $line, Event $event): Result
    {
        if ($event->type->value & EventType::Individual()->value) {
            $athlete = $this->getAthleteFromLine($line);
        }

        return new Result();
    }

    private function getAthleteFromLine(string $line): Athlete
    {
        $athleteName = $this->options['athlete_matcher']->getMatch($line);

        return new Athlete();
    }
}
