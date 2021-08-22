<?php namespace App\Services;

class Filter
{
    public ?string $fromDate;
    public ?string $toDate;

    public function __construct()
    {
        $filter = session('filter', []);
        $this->fromDate = $filter['from_date'] ?? null;
        $this->toDate = $filter['to_date'] ?? null;
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
        if ($this->fromDate) {
            $activeFilters++;
        }
        if ($this->toDate) {
            $activeFilters++;
        }
        return $activeFilters;
    }
}
