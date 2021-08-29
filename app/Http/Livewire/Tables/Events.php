<?php

namespace App\Http\Livewire\Tables;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Event;
use App\Models\Team;
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
    public ?Athlete $athlete = null;
    public ?Competition $competition = null;
    public ?Team $team = null;
    public int $limit = 1;

    public function mount($gender = null, EventType $eventType = null): void
    {
        $this->gender = optional($gender)->value;
        $this->eventType = optional($eventType)->value;
    }

    public function render(): \Illuminate\Contracts\View\View
    {
        Filter::add(Gender::coerce($this->gender));
        Filter::add(EventType::coerce($this->eventType));
        Filter::add($this->athlete);
        Filter::add($this->competition);
        Filter::add($this->team);

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
