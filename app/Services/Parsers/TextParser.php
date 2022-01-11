<?php

namespace App\Services\Parsers;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Interfaces\ParserInterface;
use App\Models\Athlete;
use App\Models\Event;
use App\Models\Media;
use App\Models\Result;
use App\Models\Team;
use App\Support\ParserOptions\Option;
use Illuminate\Support\Collection;

class TextParser implements ParserInterface
{
    /**
     * @var Collection<Option>
     */
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
        $gender = null;
        $results = collect();

        foreach ($lines as $line) {
            if ($this->options['event_indicator']->hasMatch($line)) {
                $gender = $this->getGenderFromLine($line);
                $event = $this->getEventFromLine($line);
            }
            if ($event && $gender && $this->options['result_indicator']->hasMatch($line)) {
                $results->add($this->getResultFromLine($line, $event, $gender));
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

    private function getResultFromLine(string $line, Event $event, Gender $gender): Result
    {
        if ($event->isType(EventType::Individual())) {
            $athlete = $this->getAthleteFromLine($line, $gender);
            $team = $this->options['team_matcher']->getMatch($line);
        }

        return new Result();
    }

    private function getAthleteFromLine(string $line, Gender $gender): Athlete
    {
        $athleteName = $this->options['athlete_matcher']->getMatch($line);
        $yearOfBirth = $this->options['year_of_birth_matcher']->getMatch($line);

        /** @var Athlete $athlete */
        $athlete = Athlete::query()->firstOrNew([
            'name' => $athleteName,
            'year_of_birth' => $yearOfBirth,
            'gender' => $gender,
        ]);

        return $athlete;
    }

    private function getGenderFromLine(string $line): ?Gender
    {
        if ($this->options['men_matcher']->hasMatch($line)) {
            return Gender::Men();
        }

        if ($this->options['women_matcher']->hasMatch($line)) {
            return Gender::Women();
        }

        return null;
    }
}
