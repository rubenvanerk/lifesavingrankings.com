<?php namespace App\Services;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Event;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Collection;

class Records
{
    public function getRecords($useFilter = true, $limit = 1): array
    {
        $filter = new Filter();

        if ($filter->athlete) {
            return [$this->findRecords($filter)];
        }

        return $this->getRecordsGroupedByGender($filter, $limit);
    }

    protected function getRecordsGroupedByGender(Filter $filter, $limit = 1): array
    {
        $filter->gender = Gender::Women();
        $recordsWomen = $this->findRecords($filter, $limit);
        $filter->gender = Gender::Men();
        $recordsMen = $this->findRecords($filter, $limit);

        return [
            strtolower(Gender::Women()->description) => $recordsWomen,
            strtolower(Gender::Men()->description) => $recordsMen,
        ];
    }

    protected function findRecords(Filter $filter, int $limit = 1): Collection
    {
        return Event::query()
            ->where('type', EventType::IndividualPool)
            ->with(['results' => function (HasMany $query) use ($limit, $filter) {
                if ($filter) {
                    $query->filter($filter);
                }
                $query->with(['event', 'entrant', 'competition']);
                $query->orderBy('time')->limit($limit);
            }])
            ->get()
            ->pluck('results')
            ->flatten()
            ->groupBy('event_id');
    }

    public function getPlaceholder(): array
    {
        $filter = new Filter();

        if ($filter->athlete) {
            return [array_fill(0, 7, null)];
        }

        return [
            strtolower(Gender::Women()->description) => array_fill(0, 7, null),
            strtolower(Gender::Men()->description) => array_fill(0, 7, null),
        ];
    }
}
