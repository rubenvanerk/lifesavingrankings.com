<?php

namespace App\Parser\Options;

use App\Enums\ParserConfigOptionType;
use App\Models\CompetitionCategory;

class CategoryMatcher extends Option
{
    public mixed $value = '';
    public string $name = 'category_matcher';
    public string $label = 'Category matcher';
    public string $group = Option::GROUP_EVENT;

    protected array $competitionCategoryMatch = [];

    public function __construct($value = null)
    {
        $this->type = ParserConfigOptionType::Regex();
        parent::__construct($value);
    }
}
