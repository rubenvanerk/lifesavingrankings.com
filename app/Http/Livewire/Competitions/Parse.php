<?php

namespace App\Http\Livewire\Competitions;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Models\Media;
use App\Models\ParserConfig;
use App\Services\Parsers\ParserService;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Livewire\Component;

class Parse extends Component
{
    public Media $media;
    public ParserConfig $parser_config;
    public ?string $currentRegex = null;
    public ?string $currentRegexOptionName = null;
    public EloquentCollection $results;
    public bool $autoloadTable = false;
    public bool $loadTable = false;

    public function mount()
    {
        $this->parser_config = $this->media->parser_config;
        $this->results = new EloquentCollection;
    }

    public function render(): View
    {
        try {
            $parser = new ParserService($this->media, $this->parser_config);

            if ($this->loadTable || $this->autoloadTable) {
                $this->results = $parser->getParsedResults();
                $this->loadTable = false;
            } else {
                $this->results = new EloquentCollection;
            }

            $data = [
                'matchCount' => $parser->countMatches($this->currentRegex),
                'rawText' => $parser->getHighlightedRawText($this->currentRegex),
                'events' => $parser->getIndicatedEvents(),
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

    public function refreshResults()
    {
        $this->loadTable = true;
    }
}
