<?php

namespace App\Http\Livewire;

use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class Filter extends Component
{
    // TODO: yob, age, nationality, pool length, ils sanctioned, timekeeping

    public $fromDate = null;
    public $toDate = null;

    protected $casts = ['fromDate' => Carbon::class];

    protected $listeners = ['filtered' => '$refresh'];

    public function render(\App\Services\Filter $filter): View
    {
        $this->fromDate = $filter->fromDate;
        $this->toDate = $filter->toDate;
        return view('livewire.filter', compact('filter'));
    }

    public function updated()
    {
        $filter = app(\App\Services\Filter::class);

        $filter->set(
            $this->fromDate,
            $this->toDate
        );

        $this->emit('filtered');
    }
}
