<?php

namespace App\Traits;

use Arr;
use Illuminate\Database\Eloquent\Model;

trait Parseable
{
    public function toDatabase(array $extraAttributes = []): Model
    {
        return self::firstOrCreate(
            array_merge($this->getParsedAttributes(), $extraAttributes),
            $this->getParsedValues(),
        );
    }

    protected function getParsedAttributes(): array
    {
        return Arr::only($this->toArray(), $this->parsedAttributes);
    }

    protected function getParsedValues(): array
    {
        if (property_exists(self::class, 'parsedAttributes')) {
            return Arr::only($this->toArray(), $this->parsedAttributes);
        }
        return [];
    }
}
