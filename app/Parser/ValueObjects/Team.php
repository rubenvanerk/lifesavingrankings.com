<?php

namespace App\Parser\ValueObjects;

use App\Models\Competition;

class Team
{
    public function __construct(
        public readonly string $name,
    )
    {
    }

    public function toModel(Competition $competition): \App\Models\Team
    {
        return \App\Models\Team::firstOrNew([
            'name' => $this->name,
        ]);
    }
}
