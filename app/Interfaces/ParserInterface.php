<?php

namespace App\Interfaces;

use App\Models\Competition;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

interface ParserInterface
{
    public function getParsedCompetition(): Competition;

    public function getRawText(Media $competitionFile): string;

    public function getTable(): array;
}
