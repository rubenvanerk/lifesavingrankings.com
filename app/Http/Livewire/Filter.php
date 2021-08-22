<?php

namespace App\Http\Livewire;

use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class Filter extends Component
{
    public $fromDate = null;
    public $toDate = null;

    protected $casts = ['fromDate' => Carbon::class];

    public function render(\App\Services\Filter $filter): View
    {
        $this->fromDate = $filter->fromDate;
        $this->toDate = $filter->toDate;
        return view('livewire.filter');
    }

    public function updated()
    {
        (new \App\Services\Filter)->set(
            $this->fromDate,
            $this->toDate
        );

        $this->emit('filtered');
    }
}
