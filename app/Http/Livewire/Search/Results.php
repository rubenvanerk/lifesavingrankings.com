<?php

namespace App\Http\Livewire\Search;

use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Team;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Collection;
use Livewire\Component;

class Results extends Component
{
    public Collection $resultSets;
    public string $query = '';

    protected $listeners = ['search'];

    public function mount()
    {
        $this->resultSets = collect();
    }

    public function render(): View
    {
        return view('livewire.search.results');
    }

    public function search($query)
    {
        $this->query = $query;
        if (strlen($query) < 2) {
            $this->resultSets = collect();
            return;
        }

        $this->resultSets = collect([
            'athletes' => Athlete::search($query)->get(),
            'teams' => Team::search($query)->get(),
            'competitions' => Competition::search($query)->get(),
        ]);

        $this->resultSets = $this->resultSets->sortByDesc(function ($resultSet) {
            return $resultSet->count();
        })->filter(function ($resultSet) {
            return $resultSet->count() > 0;
        });
    }
}
