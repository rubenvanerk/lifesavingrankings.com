<?php namespace App\Services;

use App\Enums\EventType;
use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\CompetitionCategory;
use App\Models\Event;
use App\Models\Team;
use Arr;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class Filter
{
    public Collection $fields;

    public function __construct()
    {
        $filterInSession = session('filter', []);

        $this->fields = collect([
            'from_date' => new FilterField($filterInSession['from_date'] ?? null, true, true),
            'to_date' => new FilterField($filterInSession['to_date'] ?? null, true, true),
            'from_year_of_birth' => new FilterField($filterInSession['from_year_of_birth'] ?? null, true, true),
            'to_year_of_birth' => new FilterField($filterInSession['to_year_of_birth'] ?? null, true, true),
            'competition' => new FilterField(null, false, true, Competition::class),
            'competition_category' => new FilterField($filterInSession['competition_category'] ?? null, true, true, CompetitionCategory::class),
            'athlete' => new FilterField(null, false, true, Athlete::class),
            'event' => new FilterField(null, false, true, Event::class),
            'team' => new FilterField(null, true, true, Team::class),
            'gender' => new FilterField(null, false, true, Gender::class),
            'event_type' => new FilterField(null, false, true, EventType::class),
        ]);
    }

    public function set(string $name, mixed $value = null)
    {
        $field = $this->getFieldByName($name);
        $this->generateOptions($name, $value);
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

    public function disable(string $name)
    {
        $field = $this->getFieldByName($name);
        $field->enabled = false;
        $field->visible = false;
    }

    public function getValue($fieldName): mixed
    {
        $field = $this->getFieldByName($fieldName);
        return $field->enabled ? $this->getFieldByName($fieldName)->value : null;
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

    public function options(string $fieldName, array $options)
    {
        $field = $this->getFieldByName($fieldName);

        $field->options = $options;
    }

    private function generateOptions(string $name, mixed $value)
    {
        if ($name == 'competition' && ($value instanceof Competition || $value = Competition::find($value))) {
            $options = $value->categories->pluck('name', 'id')->toArray();
            $this->options('competition_category', $options);
            if (!Arr::has($options, $this->getValue('competition_category'))) {
                $this->set('competition_category');
            }
        }
    }
}
