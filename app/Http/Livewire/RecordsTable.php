<?php

namespace App\Http\Livewire;

use App\Enums\Gender;
use App\Models\Competition;
use App\Services\Records;
use Event;
use Livewire\Component;
use View;

class RecordsTable extends Component
{
    public bool $readyToLoad = false;
    public array $without = [];
    public ?int $competition = null;
    public ?int $limit = 1;
    public string $title = '';
    public string $filteredTitle = '';
    public bool $twoColumns = false;

    protected $listeners = ['filtered' => '$refresh'];

    public function loadRecords(): void
    {
        $this->readyToLoad = true;
    }

    public function mount(): void
    {
        if ($this->competition) {
            $this->without = array_merge($this->without, ['date', 'competition']);
        }
    }

    public function render(Records $records): \Illuminate\Contracts\View\View
    {
        Event::listen('filter.competition', fn() => $this->competition);

        $filter = new \App\Services\Filter();

        View::share('filter', true);

        return view('livewire.records-table', [
            'eventsByGender' => $this->readyToLoad ? $records->getRecords(limit: $this->limit) : [
                strtolower(Gender::Women()->description) => array_fill(0, 7, null),
                strtolower(Gender::Men()->description) => array_fill(0, 7, null),
            ],
            'filter' => $filter,
        ]);
    }
}
