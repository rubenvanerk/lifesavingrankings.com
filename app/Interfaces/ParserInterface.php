<?php

namespace App\Interfaces;

use App\Services\Parsers\ParserConfig;
use App\Support\ParserOptions\Config;
use Illuminate\Support\Collection;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

interface ParserInterface
{
    public function getParsedResults(Media $competitionFile): Collection;

    public function getRawText(Media $competitionFile): string;
}
