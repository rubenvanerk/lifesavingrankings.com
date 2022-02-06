<?php

namespace App\Parser\ValueObjects;

use App\Enums\Gender;
use App\Models\Competition;

abstract class Entrant
{
    public function __construct(
        public readonly string $name,
        public readonly Gender $gender,
        public readonly ?int $yearOfBirth = null,
    )
    {
    }

    public abstract function toModel(?Competition $competition = null);
}
