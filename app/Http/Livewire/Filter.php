<?php

namespace App\Http\Livewire;

use App\Services\FilterField;
use Illuminate\Contracts\View\View;
use Livewire\Component;
USE App\Services\Filter as FilterService;

class Filter extends Component
{
    // TODO: age, nationality, pool length, timekeeping
    // TODO: add option to disable certain filters

    public array $fieldValues;
    public FilterService $filter;

    protected $listeners = ['resetFilter'];

    public function mount(FilterService $filter)
    {
        $this->filter = $filter;

        $this->fieldValues = $this->filter->fields
            ->mapWithKeys(fn(FilterField $field, $name) => [$name => $field->value])
            ->toArray();
    }

    public function render(): View
    {
        return view('livewire.filter');
    }

    public function updated()
    {
        foreach ($this->filter->fields as $name => $field) {
            $this->filter->set($name, $this->fieldValues[$name]);
        }

        $this->filter->saveToSession();
        $this->emit('filtered');
    }

    public function resetFilter()
    {
        $this->filter->reset();
        $this->fieldValues = array_map(fn () => null, $this->fieldValues);
        $this->emit('filtered');
    }

    public function countActive(): int
    {
        return collect($this->fieldValues)->filter()->count();
    }

    public function hydrateFieldValues($value)
    {
        $this->fieldValues = array_map(
            fn($fieldValue) => is_numeric($fieldValue) ? (int)$fieldValue : $fieldValue,
            $value
        );
    }
}
