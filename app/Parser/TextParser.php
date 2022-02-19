<?php

namespace App\Parser;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Enums\ResultStatus;
use App\Interfaces\ParserInterface;
use App\Models\Event;
use App\Models\Media;
use App\Models\ParserConfig;
use App\Parser\Options\EventMatcher;
use App\Parser\Options\Option;
use App\Parser\ValueObjects\Athlete;
use App\Parser\ValueObjects\Category;
use App\Parser\ValueObjects\RelayTeam;
use App\Parser\ValueObjects\Result;
use App\Parser\ValueObjects\Segments;
use App\Parser\ValueObjects\Team;
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

    public function getParsedResults(
        Media $competitionFile,
        ?ParserConfig $parserConfig = null,
    ): Collection {
        $this->options =
            $parserConfig?->options ?: $competitionFile->parser_config->options;
        $rawText = $this->getRawText($competitionFile);
        if ($this->options['text_remover']->value) {
            $rawText = Regex::replace(
                $this->options['text_remover']->value,
                '',
                $rawText,
            )->result();
        }

        $this->lines = explode("\n", $rawText);

        $event = null;
        $gender = null;
        $category = null;
        $results = new Collection();

        foreach ($this->lines as $lineNumber => $line) {
            $status =
                $this->options['dsq_matcher']->getMatch($line) ?:
                $this->options['dnf_matcher']->getMatch($line) ?:
                $this->options['dns_matcher']->getMatch($line) ?:
                $this->options['wdr_matcher']->getMatch($line);

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
            if (
                $event &&
                $gender &&
                ($this->options['result_indicator']->hasMatch($line) || $status)
            ) {
                $results->add(
                    $this->getResultFromLine(
                        $line,
                        $lineNumber + 1,
                        $event,
                        $gender,
                        $category,
                        $status,
                    ),
                );
            }
            if ($this->options['category_matcher']->hasMatch($line)) {
                $category = new Category(
                    $this->options['category_matcher']->getMatch($line),
                );
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

    private function getResultFromLine(
        string $line,
        int $lineNumber,
        Event $event,
        Gender $gender,
        ?Category $category,
        ?ResultStatus $resultStatus,
    ): Result {
        if ($event->isType(EventType::Individual())) {
            $entrant = $this->getAthleteFromLine($line, $gender);
            $segments = new Segments();
        } else {
            $entrant = new RelayTeam(
                $this->options['relay_team_matcher']->getMatch($line),
                $gender,
            );

            $segments = $this->getSegmentsFromLine(
                $line,
                $lineNumber,
                $event,
                $gender,
            );
        }

        $teamName = $this->options['team_matcher']->getMatch($line);
        $team = $teamName ? new Team($teamName) : null;

        return new Result(
            $event,
            $entrant,
            $team,
            $this->options['time_matcher']->getMatch($line),
            $resultStatus,
            $category,
            $segments,
            $this->options['splits_matcher']->getMatches($line),
            $line,
            $lineNumber,
        );
    }

    private function getAthleteFromLine(string $line, Gender $gender): Athlete
    {
        $name = $this->options['athlete_matcher']->getMatch($line);
        $yearOfBirth = $this->options['year_of_birth_matcher']->getMatch($line);

        return new Athlete($name, $gender, $yearOfBirth);
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

    private function getSegmentsFromLine(
        string $line,
        int $lineNumber,
        Event $event,
        Gender $gender,
    ): ?Segments {
        if ($this->options['team_mate_matcher']->occursOnNextLine) {
            $line = $this->lines[$lineNumber] ?? null;
        }

        $names = $this->options['team_mate_matcher']->getMatches($line);
        $segments = [];

        foreach ($event->segments as $i => $segment) {
            if (empty($names[$i]) || trim($names[$i]) === '') {
                return null;
            }

            $athlete = new Athlete($names[$i], $gender, null);
            $result = new Result(event: $event, entrant: $athlete);
            $segments[] = $result;
        }

        return new Segments(...$segments);
    }
}
