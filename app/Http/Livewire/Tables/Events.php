<?php

namespace App\Http\Livewire\Tables;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Event;
use App\Services\Filter;
use App\Traits\WithFilter;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Livewire\Component;
use View;

class Events extends Component
{
    use WithFilter;

    public string $title;
    public string $titleFiltered;
    public bool $readyToLoad = false;
    public mixed $gender = null;
    public mixed $eventType = null;
    public mixed $athlete = null;
    public mixed $competition = null;
    public int $limit = 1;

    public function mount($gender = null, EventType $eventType = null, Athlete $athlete = null, Competition $competition = null): void
    {
        $this->gender = optional($gender)->value;
        $this->eventType = optional($eventType)->value;
        $this->athlete = optional($athlete)->id;
        $this->competition = optional($competition)->id;
    }

    public function render(): \Illuminate\Contracts\View\View
    {
        Filter::add(Gender::coerce($this->gender));
        Filter::add(EventType::coerce($this->eventType));
        Filter::add(Athlete::find($this->athlete));
        Filter::add(Competition::find($this->competition));

        // TODO: extract into service
        if ($this->readyToLoad) {
            $events = Event::query()->filter()->with(['results' => function (HasMany $query) {
                $query->orderBy('time');
                $query->filter();
                $query->limit($this->limit);
                $query->with(['entrant', 'competition']);
            }])->get();

            $events = $events->filter(function ($event) {
                return $event->results->count() > 0;
            });
        }

        return view('livewire.tables.events', [
            'events' => $events ?? null,
            'filter' => app(Filter::class),
            'genderEnum' => $this->gender ? Gender::coerce($this->gender) : null,
        ]);
    }

    public function loadEvents(): void
    {
        $this->readyToLoad = true;
    }
}
