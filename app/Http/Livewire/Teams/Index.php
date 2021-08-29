<?php

namespace App\Http\Livewire\Teams;

use App\Models\Team;
use Illuminate\Contracts\View\View;
use Livewire\Component;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public function render(): View
    {
        $teams = Team::query()->orderBy('name')->paginate(15);

        return view('livewire.teams.index', [
            'teams' => $teams,
        ]);
    }
}
