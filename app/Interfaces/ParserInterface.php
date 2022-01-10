<?php

namespace App\Interfaces;

use App\Models\Media;
use Illuminate\Support\Collection;

interface ParserInterface
{
    public function getParsedResults(Media $competitionFile): Collection;

    public function getRawText(Media $competitionFile): string;
}
