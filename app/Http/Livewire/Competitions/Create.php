<?php

namespace App\Http\Livewire\Competitions;

use App\Enums\TimekeepingMethod;
use App\Enums\VenueType;
use App\Models\Competition;
use App\Models\Venue;
use Illuminate\Contracts\View\View;
use Illuminate\Support\Collection;
use Livewire\Component;
use Livewire\WithFileUploads;

class Create extends Component
{
    use WithFileUploads;

    public ?string $name = null;
    public ?string $start_date = null;
    public ?string $end_date = null;
    public ?int $timekeeping = null;
    public ?bool $ils_sanctioned = false;
    public bool $created = false;
    public Collection $pools;
    public Collection $beaches;
    public ?string $venue_type = null;
    public ?int $pool = null;
    public ?string $pool_name = null;
    public ?string $pool_country = null;
    public ?string $pool_city = null;
    public ?int $pool_size = null;
    public ?int $beach = null;
    public ?string $beach_name = null;
    public ?string $beach_country = null;
    public ?string $beach_city = null;

    public $files;
    public $file_link;

    protected array $rules = [
        'name' => ['required', 'max:255'],
        'start_date' => ['required', 'date'],
        'end_date' => ['required', 'date'],
        'timekeeping' => ['required', 'enum_value:' . TimekeepingMethod::class],
        'ils_sanctioned' => ['bool'],
    ];

    public function render(): View
    {
        return view('livewire.competitions.create');
    }

    public function mount()
    {
        $this->pools = Venue::pool()
            ->orderBy('name')
            ->get();
        $this->beaches = Venue::beach()
            ->orderBy('name')
            ->get();
    }

    public function submit()
    {
        $this->validate();

        $competition = Competition::create([
            'name' => $this->name,
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
            'timekeeping' => $this->timekeeping,
            'ils_sanctioned' => $this->ils_sanctioned,
            'file_link' => $this->file_link,
        ]);

        foreach ($this->files as $file) {
            $competition->addMedia($file)->toMediaCollection('files');
        }

        if ($this->venue_type === 'pool' || $this->venue_type === 'both') {
            if ($this->pool) {
                $pool = Venue::find($this->pool);
            } else {
                $pool = Venue::create([
                    'name' => $this->pool_name,
                    'country' => $this->pool_country,
                    'city' => $this->pool_city,
                    'pool_size' => $this->pool_size,
                    'type' => VenueType::Pool,
                ]);
            }
            $competition->venues()->attach($pool);
        }

        if ($this->venue_type === 'beach' || $this->venue_type === 'both') {
            if ($this->beach) {
                $beach = Venue::find($this->beach);
            } else {
                $beach = Venue::create([
                    'name' => $this->beach_name,
                    'country' => $this->beach_country,
                    'city' => $this->beach_city,
                    'type' => VenueType::Beach,
                ]);
            }

            $competition->venues()->attach($beach);
        }

        $this->created = true;
    }
}
