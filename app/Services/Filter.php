<?php namespace App\Services;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Event;
use App\Models\Team;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class Filter
{
    public Collection $fields;

    public function __construct()
    {
        $filter = session('filter', []);

        $this->fields = collect([
            'from_date' => new FilterField($filter['from_date'] ?? null, true, true),
            'to_date' => new FilterField($filter['to_date'] ?? null, true, true),
            'from_year_of_birth' => new FilterField($filter['from_year_of_birth'] ?? null, true, true),
            'to_year_of_birth' => new FilterField($filter['to_year_of_birth'] ?? null, true, true),
            'competition' => new FilterField(null, false, true, Competition::class),
            'athlete' => new FilterField(null, false, true, Athlete::class),
            'event' => new FilterField(null, false, true, Event::class),
            'team' => new FilterField(null, true, true, Team::class),
            'gender' => new FilterField(null, false, true, Gender::class),
            'event_type' => new FilterField(null, false, true, EventType::class),
        ]);
    }

    public function set(string $name, mixed $value)
    {
        $field = $this->getFieldByName($name);
        if ($value instanceof Model) {
            $value = $value->id;
        }
        $field->value = $value;
        $this->saveToSession();
    }

    public function hide(string $name)
    {
        $field = $this->getFieldByName($name);
        $field->visible = false;
    }

    public function getValue($fieldName): mixed
    {
        return $this->getFieldByName($fieldName)->value;
    }

    private function getFieldByName($name): FilterField
    {
        $field = $this->fields->filter(fn(FilterField $field, string $key) => $key == $name)->first();
        if (!$field) {
            throw new Exception(sprintf('Filter field %s type not known', $name));
        }
        return $field;
    }

    public function saveToSession(): void
    {
        $fieldsToSave = $this->fields->filter(fn(FilterField $field) => $field->saveToSession);

        session()->put('filter',
            $fieldsToSave->mapWithKeys(fn(FilterField $field, $key) => [$key => $field->value])
        );
    }

    public function countActive(): int
    {
        return $this->fields->filter(fn(FilterField $field) => $field->visible && !empty($field->value))->count();
    }

    public static function reset(): void
    {
        $filter = app(Filter::class);
        $filter->fields->filter(fn(FilterField $field) => $field->saveToSession)->each(function (FilterField $field) {
            $field->value = null;
        });
        $filter->saveToSession();
    }
}
