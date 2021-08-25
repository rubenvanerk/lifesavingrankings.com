<?php

namespace App\Http\Livewire;

use App\Enums\Gender;
use App\Services\Records;
use Event;
use Livewire\Component;
use View;

class RecordsTable extends Component
{
    public bool $readyToLoad = false;
    public array $without = [];
    public ?int $competition = null;
    public ?int $athlete = null;
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
        if ($this->athlete) {
            $this->without = array_merge($this->without, ['athlete']);
        }
    }

    public function render(Records $records): \Illuminate\Contracts\View\View
    {
        Event::listen('filter.competition', fn() => $this->competition);
        Event::listen('filter.athlete', fn() => $this->athlete);

        $filter = new \App\Services\Filter();

        View::share('filter', true);

        return view('livewire.records-table', [
            'eventsByGender' => $this->readyToLoad ? $records->getRecords(limit: $this->limit) : $records->getPlaceholder(),
            'filter' => $filter,
        ]);
    }

    public function resetFilter(): void
    {
        (new \App\Services\Filter())->reset();
        $this->emit('resetFilter');
    }
}
