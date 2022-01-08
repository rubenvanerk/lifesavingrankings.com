<?php

namespace App\Interfaces;

use Illuminate\Support\Collection;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

interface ParserInterface
{
    public function getParsedResults(Media $competitionFile): Collection;

    public function getRawText(Media $competitionFile): string;
}
