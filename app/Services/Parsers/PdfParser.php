<?php

namespace App\Services\Parsers;

use Smalot\PdfParser\Config;
use App\Models\Media;

class PdfParser extends TextParser
{
    public function getRawText(Media $competitionFile): string
    {
        $config = new Config();
        $parserOptions = $competitionFile->parser_config->options;
        $config->setHorizontalOffset($this->translateQuoted($parserOptions['horizontal_offset']->value));

        $parser = new \Smalot\PdfParser\Parser([], $config);
        $pdf = $parser->parseFile($competitionFile->getPath());

        return $pdf->getText();
    }

    protected function translateQuoted(string $string): string
    {
        $search = ['\\t', '\\n', '\\r'];
        $replace = ["\t", "\n", "\r"];
        return str_replace($search, $replace, $string);
    }
}
