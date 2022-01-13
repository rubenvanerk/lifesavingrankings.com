<?php

namespace App\Services;

class FilterField
{

    public function __construct(
        public mixed $value,
        public bool  $visible,
        public bool  $enabled,
        public ?string $type = null,
        public bool $saveToSession = false
    )
    {
        $this->saveToSession = $this->visible;
    }
}
