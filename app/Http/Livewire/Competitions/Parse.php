<?php

namespace App\Http\Livewire\Competitions;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Models\Media;
use App\Models\ParserConfig;
use App\Support\ParserOptions\Option;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Collection;
use Livewire\Component;
use Parser;

class Parse extends Component
{
    public Media $media;
    public ParserConfig $parser_config;
    public $currentRegex;
    public $currentRegexOptionName;

    public function mount()
    {
        $this->parser_config = $this->media->parser_config;
    }

    public function render(): View
    {
        try {
            $data = [
                'matchCount' => Parser::countMatches($this->media, $this->currentRegex),
                'rawText' => Parser::getHighlightedRawText($this->media, $this->currentRegex),
                'results' => Parser::getParsedResults($this->media),
                'events' => Parser::getIndicatedEvents($this->media),
            ];
        } catch (UnsupportedMimeTypeException $e) {
            return view('livewire.competitions.parse_error', [
                'message' => $e->getMessage(),
            ]);
        }

        return view('livewire.competitions.parse', $data);
    }

    public function updated()
    {
        $this->media->parser_config = $this->parser_config;
    }

    public function save()
    {
        $this->validate();
        $this->parser_config->save();
    }

    public function highlight($regex, $optionName)
    {
        $this->currentRegex = $regex;
        $this->currentRegexOptionName = $optionName;
    }

    public function rules(): array
    {
        return $this->media->parser_config->options->mapWithKeys(function ($option) {
            return ['parser_config.options.' . $option->name . '.value' => 'nullable'];
        })->toArray();
    }
}
