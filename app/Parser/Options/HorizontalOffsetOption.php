<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;

class HorizontalOffsetOption extends Option
{
    public string $name = 'horizontal_offset';
    public mixed $value = ' ';
    public string $label = 'Horizontal offset';
    public string $group = Option::GROUP_PDF;

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::String();

        parent::__construct($value);
    }
}
