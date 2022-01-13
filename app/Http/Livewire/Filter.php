<?php

namespace App\Http\Livewire;

use App\Services\FilterField;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Collection;
use Livewire\Component;

class Filter extends Component
{
    // TODO: age, nationality, pool length, ils sanctioned, timekeeping
    // TODO: add option to disable certain filters

    public Collection $fields;

    protected $listeners = ['filtered' => '$refresh'];

    public function render(\App\Services\Filter $filter): View
    {
        $this->fields = $filter->fields;
        return view('livewire.filter', compact('filter'));
    }

    public function updated()
    {
        $filter = app(\App\Services\Filter::class);
        $filter->fields = $this->fields->mapWithKeys(function ($filterField, $key) {
            return [$key => new FilterField(...array_values($filterField))];
        });
        $filter->saveToSession();
        $this->emit('filtered');
    }

    public function clear()
    {
        app(\App\Services\Filter::class)->reset();
        $this->emit('filtered');
    }
}
