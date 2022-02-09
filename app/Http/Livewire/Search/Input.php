<?php

namespace App\Http\Livewire\Search;

use Illuminate\Contracts\View\View;
use Livewire\Component;

class Input extends Component
{
    public string $query = '';

    protected $queryString = [
        'query' => ['except' => ''],
    ];

    public function render(): View
    {
        return view('livewire.search.input');
    }

    public function updatedQuery()
    {
        $this->search();
    }

    public function search()
    {
        $this->emit('search', $this->query);
    }
}
