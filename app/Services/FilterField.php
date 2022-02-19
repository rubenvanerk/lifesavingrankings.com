<?php

namespace App\Services;

use App\Enums\FilterFieldType;

class FilterField
{
    public function __construct(
        public mixed $value,
        public bool $visible,
        public bool $enabled,
        public ?FilterFieldType $type = null,
        public bool $saveToSession = false,
        public array $options = [],
    ) {
        $this->saveToSession = $this->visible;
    }

    public function toArray(): array
    {
        return [
            'value' => $this->value,
            'visible' => $this->visible,
            'enabled' => $this->enabled,
            'type' => $this->type?->value,
            'saveToSession' => $this->saveToSession,
            'options' => json_encode($this->options),
        ];
    }
}
