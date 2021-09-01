<?php

namespace App\Http\Livewire\Tables;

use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Event;
use App\Models\Result;
use App\Models\Team;
use App\Services\Filter;
use App\Traits\WithFilter;
use Livewire\Component;
use Livewire\WithPagination;

class Results extends Component
{
    use WithFilter, WithPagination;

    public bool $readyToLoad = false;
    public ?Athlete $athlete = null;
    public ?Competition $competition = null;
    public ?Team $team = null;
    public ?Event $event = null;
    public mixed $gender = null;
    public string $title = '';
    public bool $valid;

    public function mount($gender = null): void
    {
        $this->gender = optional($gender)->value;
    }

    public function render()
    {
        Filter::add(Gender::coerce($this->gender));
        Filter::add($this->event);
        Filter::add($this->competition);
        Filter::add($this->athlete);
        Filter::add($this->team);

        $filter = app(Filter::class);

        if ($this->readyToLoad) {
            $results = Result::orderBy('time')
                ->with(['competition', 'entrant', 'team']);

            if ($this->valid) {
                $results->valid();
            }

            if (!$filter->competition && !$filter->athlete && !$filter->team) {
                $sub = Result::filter()->selectRaw('entrant_id, MIN(time)')
                    ->groupByRaw('event_id, entrant_id, entrant_type');

                $results = $results
                    ->withoutGlobalScope('published')
                    ->whereRaw('(entrant_id, time) IN (' . $sub->toSql() . ')', $sub->getBindings())
                    ->groupBy('entrant_id')
                    ->paginate(15);
            } elseif ($filter->athlete || $filter->team) {
                $results = $results->filter()->paginate(15);
            } else {
                $results = $results->filter()->get();
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
