<?php

namespace App\Support\ParserOptions;

use App\Enums\ParserConfigOptionType;
use App\Models\CompetitionCategory;
use App\Models\Team;
use Str;

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

    public function getMatch(string $string): CompetitionCategory
    {
        $categoryName = parent::getMatch($string);

        if (isset($this->competitionCategoryMatch[$categoryName])) {
            return $this->competitionCategoryMatch[$categoryName];
        }

        /** @var CompetitionCategory $competitionCategory */
        $competitionCategory = CompetitionCategory::query()->firstOrNew([
            'name' => $categoryName,
        ]);

        $this->competitionCategoryMatch[$competitionCategory->name] = $competitionCategory;

        return $competitionCategory;
    }
}
