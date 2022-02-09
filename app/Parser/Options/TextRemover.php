<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Enums\ResultStatus;
use Exception;
use Str;

class TextRemover extends Option
{
    public mixed $value = '';
    public string $name = 'status_matcher';
    public string $label = 'Status matcher';
    public string $group = Option::GROUP_TEXT;

    public function __construct($value = null)
    {
        $this->label = 'Text remover';
        $this->name = 'text_remover';
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }
}
