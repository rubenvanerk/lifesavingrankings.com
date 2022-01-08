<?php

namespace App\Services\Parsers;

use App\Interfaces\ParserInterface;
use App\Models\Competition;
use Illuminate\Support\Collection;
use Smalot\PdfParser\Config;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class TextParser implements ParserInterface
{
    public function getParsedResults(Media $competitionFile): Collection
    {
        return collect();
    }

    public function getRawText(Media $competitionFile): string
    {
        return file_get_contents($competitionFile->getPath());
    }
}
