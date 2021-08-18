<?php

namespace App\Http\Livewire\Competitions;

use App\Models\Competition;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class Index extends Component
{
    public $competitions;

    public function mount(): void
    {
        $this->competitions = Competition::with('venues')->latest('start_date')->limit(20)->get();
    }

    public function render(): View
    {
        return view('livewire.competitions.index');
    }
}
