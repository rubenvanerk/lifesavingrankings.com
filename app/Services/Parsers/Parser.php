<?php

namespace App\Services\Parsers;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Interfaces\ParserInterface;
use Illuminate\Support\Collection;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

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
        return $parser->getRawText(...func_get_args());
    }
}
