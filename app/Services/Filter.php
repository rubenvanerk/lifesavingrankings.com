<?php namespace App\Services;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;

class Filter
{
    public ?string $fromDate;
    public ?string $toDate;
    public ?Competition $competition = null;
    public ?Athlete $athlete = null;
    public ?Gender $gender = null;
    public ?EventType $eventType = null;

    public function __construct()
    {
        $filter = session('filter', []);
        $this->fromDate = $filter['from_date'] ?? null;
        $this->toDate = $filter['to_date'] ?? null;
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
        }

        if ($saveToSession) {
            $filter->saveToSession();
        }

        return $filter;
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

    public static function reset(): void
    {
        $filter = app(Filter::class);
        $filter->set();
    }
}
