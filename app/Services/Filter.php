<?php namespace App\Services;

use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use Event;

class Filter
{
    public ?string $fromDate;
    public ?string $toDate;
    public ?Competition $competition;
    public ?Athlete $athlete;
    public ?Gender $gender = null;

    public function __construct()
    {
        $filter = session('filter', []);
        $this->fromDate = $filter['from_date'] ?? null;
        $this->toDate = $filter['to_date'] ?? null;
        $this->competition = Competition::find(Event::dispatch('filter.competition', halt: true));
        $this->athlete = Athlete::find(Event::dispatch('filter.athlete', halt: true));
    }

    public function set($fromDate = null, $toDate = null): void
    {
        $this->fromDate = $fromDate;
        $this->toDate = $toDate;

        $this->saveToSession();
    }

    private function saveToSession(): void
    {
        session()->put('filter', [
            'from_date' => $this->fromDate,
            'to_date' => $this->toDate,
        ]);
    }

    public function countActive(): int
    {
        $activeFilters = 0;
        if ($this->fromDate && !$this->competition) {
            $activeFilters++;
        }
        if ($this->toDate && !$this->competition) {
            $activeFilters++;
        }
        return $activeFilters;
    }

    public function reset(): void
    {
        $this->set();
    }
}
