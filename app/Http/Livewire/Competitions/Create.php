<?php

namespace App\Http\Livewire\Competitions;

use App\Models\Competition;
use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class Create extends Component
{
    public ?string $name = null;
    public ?string $start_date = null;
    public ?string $end_date = null;
    public bool $created = false;

    protected array $rules = [
        'name' => ['required', 'max:255'],
        'start_date' => ['required', 'date'],
        'end_date' => ['required', 'date'],
    ];

    protected array $casts = [
        'start_date' => 'date',
        'end_date' => 'date',
    ];

    public function render(): View
    {
        return view('livewire.competitions.create');
    }

    public function submit()
    {
        $this->validate();

        Competition::create([
            'name' => $this->name,
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
        ]);

        $this->created = true;
    }
}
