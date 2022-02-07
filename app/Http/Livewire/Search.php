<?php

namespace App\Http\Livewire;

use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Team;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class Search extends Component
{
    public string $query = '';
    public $athletes = [];
    public $competitions = [];
    public $teams = [];

    protected $queryString = [
        'query' => ['except' => ''],
    ];

    public function render(): View
    {
        $this->athletes = Athlete::search($this->query)->get();
        $this->teams = Team::search($this->query)->get();
        $this->competitions = Competition::search($this->query)->get();
        return view('livewire.search');
    }

    public function updatedQuery()
    {
        $this->athletes = Athlete::search($this->query)->get();
        $this->teams = Team::search($this->query)->get();
        $this->competitions = Competition::search($this->query)->get();
    }

}
