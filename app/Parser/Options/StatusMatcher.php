<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Enums\ResultStatus;
use Exception;
use Str;

class StatusMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'status_matcher';
    public string $label = 'Status matcher';
    public string $group = Option::GROUP_RESULT;
    public ?ResultStatus $status;

    public function __construct($value = null, ResultStatus $status = null)
    {
        $this->status = $status;
        $this->label = $status->description . ' matcher';
        $this->name = Str::slug($status->description, '_') . '_matcher';
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }

    public function getMatch(string $string): ?ResultStatus
    {
        return parent::hasMatch($string) ? $this->status : null;
    }
}
