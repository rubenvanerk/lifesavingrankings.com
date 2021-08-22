<?php

namespace App\Http\Livewire;

use App\Services\Records;
use Livewire\Component;
use View;

class RecordsTable extends Component
{
    protected $listeners = ['filtered' => '$refresh'];

    public function render(Records $records, \App\Services\Filter $filter): \Illuminate\Contracts\View\View
    {
        View::share('filter', true);

        return view('livewire.records-table', [
            'eventsByGender' => $records->getRecords(),
            'filter' => $filter,
        ]);
    }
}
