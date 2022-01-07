<?php

namespace App\Services\Parsers;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Interfaces\ParserInterface;
use App\Models\Competition;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Parser implements ParserInterface
{
    protected function getConcreteParser(Media $competitionFile): ParserInterface
    {
        try {
            return match ($competitionFile->mime_type) {
                'application/pdf' => new PdfParser(),
            };
        } catch (\UnhandledMatchError $e) {
            throw new UnsupportedMimeTypeException($competitionFile->mime_type);
        }
    }

    public function getParsedCompetition(): Competition
    {
        // TODO: Implement getParsedCompetition() method.
    }

    public function getRawText(Media $competitionFile): string
    {
        $parser = $this->getConcreteParser($competitionFile);
        return $parser->getRawText(...func_get_args());
    }

    public function getTable(): array
    {
        // TODO: Implement getTable() method.
    }
}
