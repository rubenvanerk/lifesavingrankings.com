<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Media extends \Spatie\MediaLibrary\MediaCollections\Models\Media
{
    public function parser_config(): HasOne
    {
        return $this->hasOne(ParserConfig::class);
    }

//    public function getParserConfigAttribute($value): Model
//    {
//        return $this->parser_config()->firstOrCreate();
//    }

    public function getConfigOptionRules(): array
    {
        if ($this->mime_type === 'application/pdf') {
            return [
                'competitionFile.parser_config.horizontal_offset' => 'required|string',
            ];
        }

        return [];
    }
}