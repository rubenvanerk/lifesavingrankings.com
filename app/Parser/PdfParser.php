<?php

namespace App\Parser;

use App\Models\Media;
use Smalot\PdfParser\Config;

class PdfParser extends TextParser
{
    protected string $rawText;

    public function getRawText(Media $competitionFile): string
    {
        if (isset($this->rawText)) {
            return $this->rawText;
        }

        $config = new Config();
        $parserOptions = $competitionFile->parser_config->options;
        $config->setHorizontalOffset($this->translateQuoted($parserOptions['horizontal_offset']->value));
        $config->setRetainImageContent(false);

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
