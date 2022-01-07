<?php

namespace App\Services\Parsers;

use App\Interfaces\ParserInterface;
use App\Models\Competition;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class PdfParser implements ParserInterface
{
    public function getParsedCompetition(): Competition
    {
        // TODO: Implement getParsedCompetition() method.
    }

    public function getRawText(Media $competitionFile): string
    {
        $parser = new \Smalot\PdfParser\Parser();
//        dd($competitionFile->getUrl());
        $pdf = $parser->parseFile($competitionFile->getPath());
        return $pdf->getText();
    }

    public function getTable(): array
    {
        // TODO: Implement getTable() method.
    }
}
