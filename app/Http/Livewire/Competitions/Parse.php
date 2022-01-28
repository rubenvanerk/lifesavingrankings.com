<?php

namespace App\Http\Livewire\Competitions;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Jobs\ImportCompetitionFile;
use App\Models\Media;
use App\Models\ParserConfig;
use App\Parser\ParserService;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Collection as EloquentCollection;
use Livewire\Component;

class Parse extends Component
{
    public Media $media;
    public ParserConfig $parser_config;
    public ?string $currentRegex = null;
    public ?string $currentRegexOptionName = null;
    public ?EloquentCollection $results = null;
    public bool $autoloadTable = false;
    public bool $loadTable = false;
    public string $currentTab = self::TAB_TEXT;

    public const TAB_TEXT = 'text';
    public const TAB_TABLE = 'table';
    public const TAB_EVENTS = 'events';

    protected $queryString = ['currentTab' => ['except' => self::TAB_TEXT]];

    public function mount()
    {
        $this->parser_config = $this->media->parser_config;
    }

    public function render(): View
    {
        $data = [];

        try {
            $parser = new ParserService($this->media, $this->parser_config);

            switch ($this->currentTab) {
                case self::TAB_TEXT:
                    $data['matchCount'] = $parser->countMatches($this->currentRegex);
                    $data['rawText'] = $parser->getHighlightedRawText($this->currentRegex);
                    break;
                case self::TAB_TABLE:
                    if ($this->loadTable || $this->autoloadTable) {
                        $this->results = $parser->getParsedResults();
                        $this->loadTable = false;
                    } else {
                        $this->results = null;
                    }
                    break;
                case self::TAB_EVENTS:
                    $data['events'] = $parser->getIndicatedEvents();
                    break;
            }
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

    public function saveAndImport()
    {
        $this->save();
        ImportCompetitionFile::dispatch($this->media);
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

    public function updatedCurrentTab()
    {
        if ($this->currentTab == self::TAB_TABLE) {
            $this->refreshResults();
        } else {
            $this->results = null;
        }
    }
}
