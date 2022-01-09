<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;

abstract class Option
{
    public ParserConfigOptionType $type;
    public string $name;
    public mixed $value;

    public abstract function renderInput();
}
