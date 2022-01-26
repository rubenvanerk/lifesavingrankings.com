<?php

namespace App\Services\Parsers;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Enums\ResultStatus;
use App\Interfaces\ParserInterface;
use App\Models\Athlete;
use App\Models\CompetitionCategory;
use App\Models\Event;
use App\Models\Media;
use App\Models\ParserConfig;
use App\Models\Result;
use App\Services\AthleteFinder;
use App\Support\ParserOptions\EventMatcher;
use App\Support\ParserOptions\Option;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;

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

    public function getParsedResults(Media $competitionFile, ?ParserConfig $parserConfig = null): EloquentCollection
    {
        $lines = explode("\n", $this->getRawText($competitionFile));
        $this->options = $parserConfig?->options ?: $competitionFile->parser_config->options;

        $event = null;
        $gender = null;
        $category = null;
        $results = new EloquentCollection;

        foreach ($lines as $lineNumber => $line) {
            $status = $this->options['dsq_matcher']->getMatch($line)
                ?: $this->options['dnf_matcher']->getMatch($line)
                    ?: $this->options['dns_matcher']->getMatch($line)
                        ?: $this->options['wdr_matcher']->getMatch($line);

            if ($this->options['event_indicator']->hasMatch($line)) {
                $gender = $this->getGenderFromLine($line);
                $event = $this->getEventFromLine($line);
            }
            if ($event && $gender && ($this->options['result_indicator']->hasMatch($line) || $status)) {
                $results->add($this->getResultFromLine($line, $lineNumber + 1, $event, $gender, $category, $status));
            }
            if ($this->options['category_matcher']->hasMatch($line)) {
                $category = $this->options['category_matcher']->getMatch($line);
            }
        }

        return $results;
    }

    private function getEventFromLine(string $line): ?Event
    {
        /** @var Collection<EventMatcher> $eventMatchers */
        $eventMatchers = $this->options->where('group', Option::GROUP_EVENTS);
        foreach ($eventMatchers as $eventMatcher) {
            if ($eventMatcher->hasMatch($line)) {
                return $eventMatcher->event;
            }
        }

        return null;
    }

    private function getResultFromLine(string $line, int $lineNumber, Event $event, Gender $gender, ?CompetitionCategory $category, ?ResultStatus $resultStatus): Result
    {
        $entrant = null;
        $team = null;

        if ($event->isType(EventType::Individual())) {
            $entrant = $this->getAthleteFromLine($line, $gender);
            $team = $this->options['team_matcher']->getMatch($line);
        }

        $result = new Result([
            'original_line' => $line,
            'original_line_number' => $lineNumber,
            'entrant_id' => $entrant?->id,
            'entrant_type' => get_class($entrant),
            'team_id' => $team?->id,
            'category_id' => $category?->id,
            'event_id' => $event->id,
            'time' => $this->options['time_matcher']->getMatch($line),
            'status' => $resultStatus,
            'splits' => $this->options['splits_matcher']->getMatches($line),
        ]);

        $result->splits = $this->options['splits_matcher']->getMatches($line);
        $result->entrant = $entrant;
        $result->team = $team;
        $result->category = $category;
        $result->event = $event;

        return $result;
    }

    private function getAthleteFromLine(string $line, Gender $gender): Athlete
    {
        $name = $this->options['athlete_matcher']->getMatch($line);
        $yearOfBirth = $this->options['year_of_birth_matcher']->getMatch($line);

        return AthleteFinder::findOrNewAthlete($name, $gender, $yearOfBirth);
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
