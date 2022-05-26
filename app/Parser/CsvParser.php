<?php

namespace App\Parser;

use App\Interfaces\ParserInterface;
use App\Models\Media;
use App\Models\ParserConfig;
use App\Parser\Options\Option;
use Illuminate\Support\Collection;

class CsvParser implements ParserInterface
{
    protected array $lines;

    /**
     * @var Collection<Option>
     */
    protected Collection $options;

    public function getRawText(Media $competitionFile): string
    {
        return $competitionFile->getFileContents();
    }

    public function getParsedResults(
        Media $competitionFile,
        ?ParserConfig $parserConfig = null,
    ): Collection {
        return collect();
    }

}
