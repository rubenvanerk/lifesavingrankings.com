<?php

namespace App\Parser\ValueObjects;

class Segments
{
    public readonly array $results;

    public function __construct(Result ...$results)
    {
        $this->results = $results;
    }
}
