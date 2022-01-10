<?php

namespace App\Support\ParserOptions;

abstract class Option
{
    public mixed $type;
    public string $name;
    public string $label;
    public mixed $value;

    public function __construct($value = null)
    {
        if (!is_null($value)) {
            $this->value = $value;
        }
    }

    public abstract function renderInput();
}
