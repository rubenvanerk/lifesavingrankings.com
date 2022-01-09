<?php

namespace App\Services\Parsers;

use App\Interfaces\ParserInterface;
use Illuminate\Support\Collection;
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
