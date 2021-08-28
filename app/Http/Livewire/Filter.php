<?php

namespace App\Http\Livewire;

use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class Filter extends Component
{
    // TODO: age, nationality, pool length, ils sanctioned, timekeeping
    // TODO: add option to disable certain filters

    public $fromDate = null;
    public $toDate = null;
    public $fromYearOfBirth = null;
    public $toYearOfBirth = null;

    protected $casts = ['fromDate' => Carbon::class];

    protected $listeners = ['filtered' => '$refresh'];

    public function render(\App\Services\Filter $filter): View
    {
        $this->fromDate = $filter->fromDate;
        $this->toDate = $filter->toDate;
        $this->fromYearOfBirth = $filter->fromYearOfBirth;
        $this->toYearOfBirth = $filter->toYearOfBirth;
        return view('livewire.filter', compact('filter'));
    }

    public function updated()
    {
        $filter = app(\App\Services\Filter::class);

        $filter->set(
            $this->fromDate,
            $this->toDate,
            $this->fromYearOfBirth,
            $this->toYearOfBirth
        );

        $this->emit('filtered');
    }
}
