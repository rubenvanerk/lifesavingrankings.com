<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;
use Illuminate\Contracts\View\View;
use function view;

class HorizontalOffsetOption extends Option
{
    public string $name = 'horizontal_offset';
    public mixed $value = 'test';
    public string $label = 'Horizontal offset';

    public function __construct()
    {
        $this->type = ParserConfigOptionType::String();
    }

    public function renderInput(): View
    {
        return view(
            'components.forms.input.with-label',
            ['name' => 'horizontal_offset', 'label' => 'Horizontal offset', 'attributes' => null]
        );
    }
}
