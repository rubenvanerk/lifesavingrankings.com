<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;
use Illuminate\Contracts\View\View;
use function view;

class HorizontalOffsetOption extends Option
{
    public string $name = 'horizontal_offset';
    public mixed $value = ' ';
    public string $label = 'Horizontal offset';

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::String();

        return parent::__construct($value);
    }

    public function renderInput(): View
    {
        return view(
            'components.forms.input.with-label',
            ['name' => 'horizontal_offset', 'label' => 'Horizontal offset', 'attributes' => null]
        );
    }
}
