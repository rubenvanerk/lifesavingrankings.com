<?php

namespace App\Parser\ValueObjects;

use App\Models\Competition;

class RelayTeam extends Entrant
{
    public function toModel(
        ?Competition $competition = null,
    ): \App\Models\RelayTeam {
        return \App\Models\RelayTeam::firstOrNew([
            'name' => $this->name,
            'gender' => $this->gender,
            'competition_id' => $competition->id,
        ]);
    }
}
