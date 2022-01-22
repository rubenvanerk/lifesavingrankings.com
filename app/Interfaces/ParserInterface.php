<?php

namespace App\Interfaces;

use App\Models\Media;
use App\Models\ParserConfig;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;

interface ParserInterface
{
    public function getParsedResults(Media $competitionFile, ?ParserConfig $parserConfig = null): EloquentCollection;

    public function getRawText(Media $competitionFile): string;
}
