<?php

namespace App\Parser;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Enums\ResultStatus;
use App\Interfaces\ParserInterface;
use App\Models\Athlete;
use App\Models\CompetitionCategory;
use App\Models\Event;
use App\Models\Media;
use App\Models\ParserConfig;
use App\Models\RelayTeam;
use App\Models\Result;
use App\Models\Team;
use App\Parser\Options\EventMatcher;
use App\Parser\Options\Option;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Illuminate\Support\Collection;
use Spatie\Regex\Regex;

class TextParser implements ParserInterface
{
    protected array $lines;

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
        $this->options = $parserConfig?->options ?: $competitionFile->parser_config->options;
        $rawText = $this->getRawText($competitionFile);
        if ($this->options['text_remover']->value) {
            $rawText = Regex::replace($this->options['text_remover']->value, '', $rawText)->result();
        }

        $this->lines = explode("\n", $rawText);

        $event = null;
        $gender = null;
        $category = null;
        $results = new EloquentCollection;

        foreach ($this->lines as $lineNumber => $line) {
            $status = $this->options['dsq_matcher']->getMatch($line)
                ?: $this->options['dnf_matcher']->getMatch($line)
                    ?: $this->options['dns_matcher']->getMatch($line)
                        ?: $this->options['wdr_matcher']->getMatch($line);

            if ($this->options['event_indicator']->hasMatch($line)) {
                if ($this->options['event_rejector']->hasMatch($line)) {
                    $event = null;
                    continue;
                }
                $gender = $this->getGenderFromLine($line);
                $previousEvent = $event;
                $event = $this->getEventFromLine($line);
                if ($previousEvent?->id !== $event->id) {
                    $category = null;
                }
            }
            if ($event && $gender && ($this->options['result_indicator']->hasMatch($line) || $status)) {
                $results->add($this->getResultFromLine($line, $lineNumber + 1, $event, $gender, $category, $status));
            }
            if ($this->options['category_matcher']->hasMatch($line)) {
                $category = new CompetitionCategory(['name' => $this->options['category_matcher']->getMatch($line)]);
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
        $segments = [];

        if ($event->isType(EventType::Individual())) {
            $entrant = $this->getAthleteFromLine($line, $gender);
        } else {
            $entrant = new RelayTeam([
                'name' => $this->options['relay_team_matcher']->getMatch($line),
                'gender' => $gender,
            ]);

            $segments = $this->getSegmentsFromLine($line, $lineNumber, $event, $gender);
        }

        $team = new Team(['name' => $this->options['team_matcher']->getMatch($line)]);

        $result = new Result([
            'original_line' => $line,
            'original_line_number' => $lineNumber,
            'team_id' => $team?->id,
            'category_id' => $category?->id,
            'event_id' => $event->id,
            'time' => $this->options['time_matcher']->getMatch($line),
            'status' => $resultStatus,
            'splits' => $this->options['splits_matcher']->getMatches($line),
        ]);

        $result->parsedEntrant = $entrant;
        $result->parsedTeam = $team;
        $result->parsedCategory = $category;
        $result->parsedSegments = $segments;
        $result->event()->associate($event);

        return $result;
    }

    private function getAthleteFromLine(string $line, Gender $gender): Athlete
    {
        $name = $this->options['athlete_matcher']->getMatch($line);
        $yearOfBirth = $this->options['year_of_birth_matcher']->getMatch($line);

        return new Athlete([
            'name' => $name,
            'gender' => $gender,
            'year_of_birth' => $yearOfBirth,
        ]);
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

    private function getSegmentsFromLine(string $line, int $lineNumber, Event $event, Gender $gender): array
    {
        if ($this->options['team_mate_matcher']->occursOnNextLine) {
            $line = $this->lines[$lineNumber] ?? null;
        }

        $names = $this->options['team_mate_matcher']->getMatches($line);
        $segments = [];

        foreach ($event->segments as $i => $segment) {
            if (empty($names[$i]) || trim($names[$i]) === '') {
                return [];
            }

            $athlete = new Athlete([
               'name' => $names[$i],
               'gender' => $gender,
            ]);
            $result = new Result([
                'event_id' => $segment->id,
            ]);
            $result->parsedEntrant = $athlete;
            $segments[] = $result;
        }

        return $segments;
    }
}
