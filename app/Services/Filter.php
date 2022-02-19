<?php namespace App\Services;

use App\Enums\FilterFieldType;
use App\Models\Competition;
use Arr;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;
use Livewire\Wireable;

final class Filter implements Wireable
{
    public Collection $fields;

    public function __construct()
    {
        $filterInSession = session('filter', []);

        $this->fields = collect([
            'from_date' => new FilterField(
                $filterInSession['from_date'] ?? null,
                true,
                true,
                FilterFieldType::Date,
            ),
            'to_date' => new FilterField(
                $filterInSession['to_date'] ?? null,
                true,
                true,
                FilterFieldType::Date,
            ),
            'from_year_of_birth' => new FilterField(
                $filterInSession['from_year_of_birth'] ?? null,
                true,
                true,
                FilterFieldType::Number,
            ),
            'to_year_of_birth' => new FilterField(
                $filterInSession['to_year_of_birth'] ?? null,
                true,
                true,
                FilterFieldType::Number,
            ),
            'competition' => new FilterField(
                null,
                false,
                true,
            ),
            'competition_category' => new FilterField(
                $filterInSession['competition_category'] ?? null,
                false,
                true,
                FilterFieldType::Select,
            ),
            'athlete' => new FilterField(null, false, true),
            'event' => new FilterField(null, false, true),
            'team' => new FilterField(null, false, true, FilterFieldType::Select),
            'gender' => new FilterField(null, false, true),
            'event_type' => new FilterField(
                null,
                false,
                true,
            ),
            'venue' => new FilterField(
                $filterInSession['venue'] ?? null,
                false,
                true,
                FilterFieldType::Select,
            ),
            'ils_sanctioned' => new FilterField($filterInSession['ils_sanctioned'] ?? null, true, true, FilterFieldType::Checkbox),
        ]);
    }

    public function set(string $name, mixed $value = null)
    {
        $field = $this->getFieldByName($name);

        $this->generateOptions($name, $value);

        if (!is_null($value)) {
            $this->setVisibility($name);
        }

        $field->value = $value instanceof Model ? $value->id : $value;

        $this->saveToSession();
    }

    public function show(string $name)
    {
        $field = $this->getFieldByName($name);
        $field->visible = true;
        $field->saveToSession = true;
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
        return $field->enabled
            ? $this->getFieldByName($fieldName)->value
            : null;
    }

    private function getFieldByName($name): FilterField
    {
        $field = $this->fields
            ->filter(fn(FilterField $field, string $key) => $key == $name)
            ->first();
        if (!$field) {
            throw new Exception(
                sprintf('Filter field %s type not known', $name),
            );
        }
        return $field;
    }

    public function saveToSession(): void
    {
        $fieldsToSave = $this->fields->filter(
            fn(FilterField $field) => $field->saveToSession,
        );

        $filterInSession = collect(session()->get('filter', []));

        session()->put(
            'filter',
            $filterInSession->merge($fieldsToSave->mapWithKeys(
                fn(FilterField $field, $key) => [$key => $field->value],
            )),
        );
    }

    public function countActive(): int
    {
        return $this->fields
            ->filter(fn(FilterField $field) => $field->visible && $field->value)
            ->count();
    }

    public function reset(): void
    {
        $this->fields
            ->filter(fn(FilterField $field) => $field->saveToSession)
            ->each(function (FilterField $field) {
                $field->value = null;
            });
        $this->saveToSession();
    }

    public function options(string $fieldName, array $options)
    {
        $field = $this->getFieldByName($fieldName);

        $field->options = $options;
    }

    private function generateOptions(string $name, mixed $value)
    {
        if (
            $name == 'competition' &&
            ($value instanceof Competition ||
                ($value = Competition::find($value)))
        ) {
            $categories = collect([0 => '---'])->union($value->categories->pluck('name', 'id'));;
            $this->options('competition_category', $categories->toArray());
            if (!Arr::has($categories, $this->getValue('competition_category'))) {
                $this->set('competition_category');
            }
        }
    }

    public function getVisibleFields(): Collection
    {
        return $this->fields->filter(fn($field) => $field->visible);
    }

    private function setVisibility(string $name)
    {
        switch ($name) {
            case 'competition':
                $this->show('competition_category');
                $this->disable('ils_sanctioned');
                break;
        }
    }

    public function toLivewire(): array
    {
        return $this->fields->mapWithKeys(function (FilterField $field, string $key) {
            return [$key => $field->toArray()];
        })->toArray();
    }

    public static function fromLivewire($value): Filter
    {
        $filter = new Filter();

        foreach ($value as $key => $item) {
            $filter->fields[$key] = new FilterField(
                $item['value'],
                $item['visible'],
                $item['enabled'],
                FilterFieldType::tryFrom($item['type'] ?: ''),
                $item['saveToSession'],
                json_decode($item['options'], true),
            );
        }

        $filter->fields = $filter->fields->filter(fn (FilterField $filterField) => $filterField->visible);

        return $filter;
    }
}
