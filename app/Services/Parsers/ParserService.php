<?php

namespace App\Services\Parsers;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Interfaces\ParserInterface;
use App\Models\Media;
use App\Models\ParserConfig;
use App\Support\ParserOptions\EventIndicator;
use Illuminate\Support\Collection;
use Spatie\Regex\MatchResult;
use Spatie\Regex\Regex;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;

class ParserService
{
    private ParserInterface $concreteParser;
    private string $rawText;

    /**
     * @throws UnsupportedMimeTypeException
     */
    public function __construct(protected Media $competitionFile, protected ?ParserConfig $parserConfig)
    {
        if (empty($this->parserConfig)) {
            $this->parserConfig = $this->competitionFile->parser_config;
        }

        $this->concreteParser = $this->getConcreteParser();
        $this->rawText = $this->concreteParser->getRawText($this->competitionFile);
    }

    /**
     * @throws UnsupportedMimeTypeException
     */
    protected function getConcreteParser(): ParserInterface
    {
        $concreteParser = match ($this->competitionFile->mime_type) {
            'application/pdf' => new PdfParser(),
            'text/plain' => new TextParser(),
            default => null,
        };

        if (is_null($concreteParser)) {
            throw new UnsupportedMimeTypeException($this->competitionFile->mime_type . ' is currently not supported');
        }

        return $concreteParser;
    }

    public function getParsedResults(): EloquentCollection
    {
        return $this->concreteParser->getParsedResults($this->competitionFile, $this->parserConfig);
    }

    public function getHighlightedRawText($highlightRegex = null): string
    {
        $lines = collect(explode("\n", $this->rawText));

        if ($this->isValidRegex($highlightRegex) && $this->countMatches($highlightRegex) < 5000) {
            $lines = $lines->map(function ($line) use ($highlightRegex) {
                return Regex::replace(
                    $highlightRegex,
                    fn (MatchResult $result) => '<mark>' . $result->result() . '</mark>',
                    $line
                )->result();
            });
        }

        // wrap lines in spans, so line numbers can be shown
        $lines = $lines->map(function ($line) {
            return '<span>' . $line . '</span>';
        });

        return $lines->implode("\n");
    }

    public function countMatches($highlightRegex = null): ?int
    {
        $matchCount = 0;
        if ($this->isValidRegex($highlightRegex)) {
            $lines = collect(explode("\n", $this->rawText));
            $lines->map(function ($line) use ($highlightRegex, &$matchCount) {
                $matchCount += count(Regex::matchAll($highlightRegex, $line)->results());
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
        return $lines->filter(function ($line) use ($eventIndicator) {
            return $eventIndicator->hasMatch($line);
        });
    }
}
