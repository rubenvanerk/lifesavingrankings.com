<?php

namespace App\Services\Parsers;

use Smalot\PdfParser\Config;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class PdfParser extends TextParser
{
    public function getRawText(Media $competitionFile): string
    {
        $config = new Config();
        $config->setHorizontalOffset($this->translateQuoted("\t"));

        $parser = new \Smalot\PdfParser\Parser([], $config);
        $pdf = $parser->parseFile($competitionFile->getPath());
        return $pdf->getText();
    }

    private function translateQuoted(string $string): string
    {
        $search = ['\\t', '\\n', '\\r'];
        $replace = ["\t", "\n", "\r"];
        return str_replace($search, $replace, $string);
    }
}
