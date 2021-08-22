<?php

namespace App\Http\Livewire;

use App\Services\ResultService;
use Livewire\Component;

class RecordsTable extends Component
{
    public function render(ResultService $resultService)
    {
        return view('livewire.records-table', [
            'eventsByGender' => $resultService->getRecords(),
        ]);
    }
}
