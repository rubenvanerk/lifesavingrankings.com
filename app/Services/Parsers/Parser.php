<?php

namespace App\Services\Parsers;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Interfaces\ParserInterface;
use App\Models\Media;
use App\Support\ParserOptions\EventIndicator;
use Illuminate\Support\Collection;
use Spatie\Regex\MatchResult;
use Spatie\Regex\Regex;

class Parser implements ParserInterface
{
    /**
     * @throws UnsupportedMimeTypeException
     */
    protected function getConcreteParser(Media $competitionFile): ParserInterface
    {
        $concreteParser = match ($competitionFile->mime_type) {
            'application/pdf' => new PdfParser(),
            'text/plain' => new TextParser(),
            default => null,
        };

        if (is_null($concreteParser)) {
            throw new UnsupportedMimeTypeException($competitionFile->mime_type . ' is currently not supported');
        }

        return $concreteParser;
    }

    public function getParsedResults(Media $competitionFile): Collection
    {
        $parser = $this->getConcreteParser($competitionFile);
        return $parser->getParsedResults(...func_get_args());
    }

    public function getRawText(Media $competitionFile): string
    {
        $parser = $this->getConcreteParser($competitionFile);
        return $parser->getRawText($competitionFile);
    }

    public function getHighlightedRawText(Media $competitionFile, $highlightRegex = null): string
    {
        $rawText = $this->getRawText($competitionFile);

        $lines = collect(explode("\n", $rawText));

        if ($this->isValidRegex($highlightRegex) && $this->countMatches($competitionFile, $highlightRegex) < 5000) {
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

    public function countMatches(Media $competitionFile, $highlightRegex = null): ?int
    {
        $parser = $this->getConcreteParser($competitionFile);
        $rawText = $parser->getRawText($competitionFile);
        $matchCount = 0;
        if ($this->isValidRegex($highlightRegex)) {
            $lines = collect(explode("\n", $rawText));
            $lines->map(function ($line) use ($highlightRegex, &$matchCount) {
                $matchCount += count(Regex::matchAll($highlightRegex, $line)->results());
            });
        }
        return $matchCount;
    }

    public function isValidRegex($pattern): bool
    {
        return is_int(@preg_match($pattern, ''));
    }

    public function getIndicatedEvents(Media $competitionFile): Collection
    {
        $parser = $this->getConcreteParser($competitionFile);
        $rawText = $parser->getRawText($competitionFile);
        $lines = collect(explode("\n", $rawText));
        /** @var EventIndicator $eventIndicator */
        $eventIndicator = $competitionFile->parser_config->options['event_indicator'];
        return $lines->filter(function ($line) use ($eventIndicator) {
            return $eventIndicator->hasMatch($line);
        });
    }
}
