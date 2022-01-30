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
use Illuminate\View\View;
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
    public ?bool $valid = null;

    public function mount($gender = null): void
    {
        $this->gender = $gender?->value;
    }

    public function render()
    {
        $filter = app(Filter::class);
        $filter->set('gender', Gender::coerce($this->gender));
        $filter->set('event', $this->event);
        $filter->set('competition', $this->competition);
        $filter->set('athlete', $this->athlete);
        $filter->set('team', $this->team);

        if ($this->readyToLoad) {
            $results = Result::query()
                ->orderBy('status', 'desc')->orderBy('time')
                ->with(['competition', 'entrant', 'team']);

            if ($this->valid) {
                $results->valid();
            }

            if (!$filter->getValue('competition') && !$filter->getValue('athlete') && !$filter->getValue('team')) {
                $sub = Result::filter()->selectRaw('entrant_id, MIN(time)')
                    ->groupByRaw('event_id, entrant_id, entrant_type');

                $results = $results
                    ->withoutGlobalScope('published')
                    ->whereRaw('(entrant_id, time) IN (' . $sub->toSql() . ')', $sub->getBindings())
                    ->paginate(15);
            } elseif ($filter->getValue('athlete') || $filter->getValue('team')) {
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
