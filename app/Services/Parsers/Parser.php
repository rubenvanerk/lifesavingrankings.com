<?php

namespace App\Services\Parsers;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Interfaces\ParserInterface;
use App\Support\ParserOptions\Config;
use Illuminate\Support\Collection;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
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

    public function getRawText(Media $competitionFile, $highlightRegex = null): string
    {
        $parser = $this->getConcreteParser($competitionFile);
        $rawText = $parser->getRawText(...func_get_args());

        // highlight regex
        if ($this->isValidRegex($highlightRegex) && $this->countMatches($competitionFile, $highlightRegex) < 5000) {
            $rawText = Regex::replace(
                $highlightRegex,
                fn (MatchResult $result) => '<mark>' . $result->result() . '</mark>',
                $rawText
            )->result();
        }

        // wrap lines in spans, so line numbers can be shown
        return collect(explode("\n", $rawText))->map(function ($line) {
            return '<span>' . $line . '</span>';
        })->implode("\n");
    }

    public function countMatches(Media $competitionFile, $highlightRegex = null): ?int
    {
        $parser = $this->getConcreteParser($competitionFile);
        $rawText = $parser->getRawText(...func_get_args());
        $matchCount = null;
        if ($this->isValidRegex($highlightRegex)) {
            $matchCount = count(Regex::matchAll($highlightRegex, $rawText)->results());
        }
        return $matchCount;
    }

    public function isValidRegex($pattern): bool
    {
        return is_int(@preg_match($pattern, ''));
    }
}
