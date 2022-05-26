<?php

namespace App\Parser;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Interfaces\ParserInterface;
use App\Models\Media;
use App\Models\ParserConfig;
use App\Parser\Options\EventIndicator;
use App\Parser\Options\EventRejector;
use App\Parser\Options\Option;
use Illuminate\Support\Collection;
use Spatie\Regex\MatchResult;
use Spatie\Regex\Regex;
use function collect;

class ParserService
{
    private ParserInterface $concreteParser;
    private string $rawText;

    /**
     * @throws UnsupportedMimeTypeException
     */
    public function __construct(
        protected Media         $competitionFile,
        protected ?ParserConfig $parserConfig = null,
    )
    {
        if (empty($this->parserConfig)) {
            $this->parserConfig = $this->competitionFile->parser_config;
        }

        $this->concreteParser = $this->getConcreteParser();
        $this->rawText = $this->concreteParser->getRawText(
            $this->competitionFile,
        );
    }

    /**
     * @throws UnsupportedMimeTypeException
     */
    protected function getConcreteParser(): ParserInterface
    {
        return match ($this->competitionFile->mime_type) {
            'application/pdf' => new PdfParser(),
            'text/plain' => new TextParser(),
            'text/csv' => new CsvParser(),
            default => throw new UnsupportedMimeTypeException(
                $this->competitionFile->mime_type .
                ' is currently not supported',
            )
        };
    }

    public function getParsedResults(): Collection
    {
        return $this->concreteParser->getParsedResults(
            $this->competitionFile,
            $this->parserConfig,
        );
    }

    public function getHighlightedRawText($highlightRegex = null): string
    {
        $rawText = $this->rawText;
        if ($this->competitionFile->parser_config->options['text_remover']->value ?? false) {
            $rawText = Regex::replace(
                $this->competitionFile->parser_config->options['text_remover']
                    ->value,
                '',
                $rawText,
            )->result();
        }

        $lines = collect(explode("\n", $rawText));

        if (
            $this->isValidRegex($highlightRegex)
            && $this->countMatches($highlightRegex) < 5000
        ) {
            $lines = $lines->map(fn($line) => Regex::replace(
                $highlightRegex,
                fn(MatchResult $result) => '<mark>' .
                    $result->result() .
                    '</mark>',
                $line,
            )->result());
        }

        // wrap lines in spans, so line numbers can be shown
        $lines = $lines->map(fn($line) => '<span>' . $line . '</span>');

        return $lines->implode("\n");
    }

    public function countMatches($highlightRegex = null): ?int
    {
        $matchCount = 0;

        if ($this->isValidRegex($highlightRegex)) {
            $lines = collect(explode("\n", $this->rawText));
            $lines->map(function ($line) use ($highlightRegex, &$matchCount) {
                $matchCount += count(
                    Regex::matchAll($highlightRegex, $line)->results(),
                );
            });
        }

        return $matchCount;
    }

    public static function isValidRegex($pattern): bool
    {
        return is_int(@preg_match($pattern, ''));
    }

    public function getIndicatedEvents(): Collection
    {
        $lines = collect(explode("\n", $this->rawText));

        /** @var EventIndicator $eventIndicator */
        $eventIndicator = $this->parserConfig->options['event_indicator'];

        /** @var EventRejector $eventRejector */
        $eventRejector = $this->parserConfig->options['event_rejector'];

        $eventLines = $lines->filter(fn($line) => $eventIndicator->hasMatch($line) && !$eventRejector->hasMatch($line));
        $eventMatchers = $this->parserConfig->options->filter(fn(Option $option) => $option->group === Option::GROUP_EVENTS);

        return $eventLines->map(function ($eventLine) use ($eventMatchers) {
            foreach ($eventMatchers as $eventMatcher) {
                if ($eventMatcher->hasMatch($eventLine)) {
                    return [
                        'line' => $eventLine,
                        'match' => $eventMatcher->label,
                    ];
                }
            }
            return [
                'line' => $eventLine,
                'match' => null,
            ];
        });
    }
}
