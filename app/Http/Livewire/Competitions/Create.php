<?php

namespace App\Http\Livewire\Competitions;

use App\Enums\TimekeepingMethod;
use App\Models\Competition;
use App\Models\Venue;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Collection;
use Livewire\Component;

class Create extends Component
{
    public ?string $name = null;
    public ?string $startDate = null;
    public ?string $endDate = null;
    public ?string $timekeeping = null;
    public ?bool $ilsSanctioned = false;
    public bool $created = false;
    public Collection $pools;
    public Collection $beaches;

    protected array $rules = [
        'name' => ['required', 'max:255'],
        'start_date' => ['required', 'date'],
        'end_date' => ['required', 'date'],
        'timekeeping' => ['required', 'enum_key:' . TimekeepingMethod::class],
    ];

    protected array $casts = [
        'start_date' => 'date',
        'end_date' => 'date',
    ];

    public function render(): View
    {
        return view('livewire.competitions.create');
    }

    public function mount()
    {
        $this->pools = Venue::pool()->orderBy('name')->get();
        $this->beaches = Venue::beach()->orderBy('name')->get();
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
