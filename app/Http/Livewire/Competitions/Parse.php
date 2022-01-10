<?php

namespace App\Http\Livewire\Competitions;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Models\Media;
use Illuminate\Contracts\View\View;
use Livewire\Component;
use Parser;

class Parse extends Component
{
    public Media $media;
    public $currentRegex;
    public $currentRegexOptionName;

    protected array $rules = [
        'media.parser_config.options.horizontal_offset.value' => 'nullable', // TODO: make dynamic
        'media.parser_config.options.event_indicator.value' => 'nullable', // TODO: make dynamic
    ];

    public function render(): View
    {
        try {
            $data = [
                'matchCount' => Parser::countMatches($this->media, $this->currentRegex),
                'rawText' => Parser::getRawText($this->media, $this->currentRegex),
            ];
        } catch (UnsupportedMimeTypeException $e) {
            return view('livewire.competitions.parse_error', [
                'message' => $e->getMessage(),
            ]);
        }

        return view('livewire.competitions.parse', $data);
    }

    public function save()
    {
        $this->validate();
        $this->media->parser_config->save();
    }

    public function highlight($regex, $optionName)
    {
        $this->currentRegex = $regex;
        $this->currentRegexOptionName = $optionName;
    }
}
