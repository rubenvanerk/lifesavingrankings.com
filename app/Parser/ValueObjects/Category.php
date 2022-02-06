<?php

namespace App\Parser\ValueObjects;

use App\Models\Competition;
use App\Models\CompetitionCategory;

class Category
{
    public function __construct(
        public readonly string $name,
    )
    {
    }

    public function toModel(Competition $competition): CompetitionCategory
    {
        return CompetitionCategory::firstOrNew([
            'name' => $this->name,
            'competition_id' => $competition->id,
        ]);
    }
}
