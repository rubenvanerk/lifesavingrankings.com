<?php

namespace App\Parser\ValueObjects;

use App\Models\Competition;
use App\Services\AthleteFinder;

class Athlete extends Entrant
{
    public function toModel(
        ?Competition $competition = null,
    ): \App\Models\Athlete {
        return AthleteFinder::firstOrNew(
            $this->name,
            $this->gender,
            $this->yearOfBirth,
            $competition
        );
    }
}
