<?php

namespace App\Http\Livewire\Tables;

use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Event;
use App\Models\Result;
use App\Services\Filter;
use App\Traits\WithFilter;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Livewire\Component;
use Livewire\WithPagination;

class Results extends Component
{
    use WithFilter, WithPagination;

    public bool $readyToLoad = false;
    public mixed $gender;
    public mixed $event;
    public string $title = '';

    public function mount(Event $event = null, $gender = null): void
    {
        $this->gender = optional($gender)->value;
        $this->event = $event->id;
    }

    public function render()
    {
        Filter::add(Gender::coerce($this->gender));
        Filter::add(Event::find($this->event));

        if ($this->readyToLoad) {
            $results = Result::filter()
                ->whereRaw('(entrant_id, time) IN (select entrant_id, MIN(time) FROM results GROUP BY entrant_id)')
                ->orderBy('time')
                ->with(['competition', 'entrant'])
                ->paginate(15);
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
