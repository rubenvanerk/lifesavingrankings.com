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
        $competitions = Competition::select(['id', 'name', 'slug', 'start_date', 'end_date', 'status', 'ils_sanctioned'])
            ->with(['venues' => function ($query) {
                $query->select(['city', 'type', 'pool_size', 'country_code']);
            }])
            ->latest('start_date')
            ->paginate(15);

        return view('livewire.competitions.index', [
            'competitions' => $competitions,
        ]);
    }
}
