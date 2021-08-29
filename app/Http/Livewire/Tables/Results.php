<?php

namespace App\Http\Livewire\Tables;

use App\Enums\Gender;
use App\Models\Competition;
use App\Models\Event;
use App\Models\Result;
use App\Services\Filter;
use App\Traits\WithFilter;
use Livewire\Component;
use Livewire\WithPagination;

class Results extends Component
{
    use WithFilter, WithPagination;

    public bool $readyToLoad = false;
    public ?Competition $competition = null;
    public ?Event $event = null;
    public mixed $gender;
    public string $title = '';

    public function mount($gender = null): void
    {
        $this->gender = optional($gender)->value;
    }

    public function render()
    {
        Filter::add(Gender::coerce($this->gender));
        Filter::add($this->event);
        Filter::add($this->competition);

        $filter = app(Filter::class);

        if ($this->readyToLoad) {
            $results = Result::filter()
                ->orderBy('time')
                ->with(['competition', 'entrant']);

            if (!$filter->competition) {
                $results = $results->whereRaw('(entrant_id, time) IN (select entrant_id, MIN(time) FROM results GROUP BY entrant_id)')->paginate(15);
            } else {
                $results = $results->get();
            }
        }

        return view('livewire.tables.results', [
            'results' => $results ?? null,
            'filter' => app(Filter::class),
        ]);
    }

    public function loadResults(): void
    {
        $this->readyToLoad = true;
    }
}
