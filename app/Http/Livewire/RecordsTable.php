<?php

namespace App\Http\Livewire;

use App\Enums\Gender;
use App\Services\Records;
use Livewire\Component;
use View;

class RecordsTable extends Component
{
    public bool $readyToLoad = false;

    protected $listeners = ['filtered' => '$refresh'];

    public function loadRecords(): void
    {
        $this->readyToLoad = true;
    }

    public function render(Records $records, \App\Services\Filter $filter): \Illuminate\Contracts\View\View
    {
        View::share('filter', true);

        return view('livewire.records-table', [
            'eventsByGender' => $this->readyToLoad ? $records->getRecords() : [
                strtolower(Gender::Women()->description) => array_fill(0, 7, null),
                strtolower(Gender::Men()->description) => array_fill(0, 7, null),
            ],
            'filter' => $filter,
        ]);
    }
}
