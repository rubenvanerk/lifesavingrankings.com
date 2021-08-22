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
    public function getRecords($useFilter = true): array
    {
        $recordsWomen = $this->getRecordsByGender(Gender::Women, $useFilter);
        $recordsMen = $this->getRecordsByGender(Gender::Men, $useFilter);

        return [
            strtolower(Gender::Women()->description) => $recordsWomen,
            strtolower(Gender::Men()->description) => $recordsMen,
        ];
    }

    protected function getRecordsByGender($gender, $useFilter): Collection
    {
        $filter = new Filter();

        return Event::query()
            ->where('type', EventType::IndividualPool)
            ->with(['results' => function (HasMany $query) use ($gender, $filter, $useFilter) {
                if ($useFilter) {
                    $query->filter($filter);
                }

                $query->whereHasMorph('entrant', [Athlete::class], function (Builder $query) use ($gender) {
                    $query->where('gender', $gender);
                });
                $query->with(['event', 'entrant', 'competition']);
                $query->orderBy('time')->limit(1);
            }])
            ->get()
            ->pluck('results')
            ->flatten();
    }
}
