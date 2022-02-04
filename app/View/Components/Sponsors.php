<?php

namespace App\View\Components;

use App\Models\Sponsor;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;
use function view;

class Sponsors extends Component
{
    public function render(): View
    {
        return view('components.sponsors', ['sponsors' => Sponsor::query()->visible()->get()]);
    }
}
