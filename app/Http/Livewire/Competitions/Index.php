<?php

namespace App\Http\Livewire\Competitions;

use App\Models\Competition;
use Illuminate\Contracts\View\View;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public function render(): View
    {
        return view('livewire.competitions.index', [
            'competitions' => Competition::with('venues')->latest('start_date')->paginate(15),
        ]);
    }
}
