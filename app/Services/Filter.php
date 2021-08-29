<?php namespace App\Services;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Event;

class Filter
{
    public ?string $fromDate;
    public ?string $toDate;
    public ?string $fromYearOfBirth;
    public ?string $toYearOfBirth;
    public ?Competition $competition = null;
    public ?Athlete $athlete = null;
    public ?Event $event = null;
    public ?Gender $gender = null;
    public ?EventType $eventType = null;

    public function __construct()
    {
        $filter = session('filter', []);
        $this->fromDate = $filter['from_date'] ?? null;
        $this->toDate = $filter['to_date'] ?? null;
        $this->fromYearOfBirth = $filter['from_year_of_birth'] ?? null;
        $this->toYearOfBirth = $filter['to_year_of_birth'] ?? null;
    }

    public static function add($value, $saveToSession = false): Filter
    {
        $filter = app(Filter::class);

        if (is_null($value)) {
            return $filter;
        }

        switch (get_class($value)) {
            case Gender::class:
                $filter->gender = $value;
                break;
            case EventType::class:
                $filter->eventType = $value;
                break;
            case Athlete::class:
                $filter->athlete = $value;
                break;
            case Competition::class:
                $filter->competition = $value;
                break;
            case Event::class:
                $filter->event = $value;
                break;
        }

        if ($saveToSession) {
            $filter->saveToSession();
        }

        return $filter;
    }

    public function set($fromDate = null, $toDate = null, $fromYearOfBirth = null, $toYearOfBirth = null): void
    {
        $this->fromDate = $fromDate;
        $this->toDate = $toDate;
        $this->fromYearOfBirth = $fromYearOfBirth;
        $this->toYearOfBirth = $toYearOfBirth;

        $this->saveToSession();
    }

    private function saveToSession(): void
    {
        session()->put('filter', [
            'from_date' => $this->fromDate,
            'to_date' => $this->toDate,
            'from_year_of_birth' => $this->fromYearOfBirth,
            'to_year_of_birth' => $this->toYearOfBirth,
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
        if ($this->fromYearOfBirth) {
            $activeFilters++;
        }
        if ($this->toYearOfBirth) {
            $activeFilters++;
        }
        return $activeFilters;
    }

    public static function reset(): void
    {
        $filter = app(Filter::class);
        $filter->set();
    }
}
