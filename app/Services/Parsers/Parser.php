<?php

namespace App\Services\Parsers;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Interfaces\ParserInterface;
use Illuminate\Support\Collection;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Parser implements ParserInterface
{
    protected function getConcreteParser(Media $competitionFile): ParserInterface
    {
        try {
            return match ($competitionFile->mime_type) {
                'application/pdf' => new PdfParser(),
                'text/plain' => new TextParser(),
            };
        } catch (\UnhandledMatchError $e) {
            throw new UnsupportedMimeTypeException($competitionFile->mime_type);
        }
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
