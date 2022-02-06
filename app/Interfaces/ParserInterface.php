<?php

namespace App\Interfaces;

use App\Models\Media;
use App\Models\ParserConfig;
use Illuminate\Support\Collection;

interface ParserInterface
{
    public function getParsedResults(Media $competitionFile, ?ParserConfig $parserConfig = null): Collection;

    public function getRawText(Media $competitionFile): string;
}
