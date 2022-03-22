<?php

namespace App\Http\Livewire;

use App\Models\JobStatus;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class ShowJobProgress extends Component
{
    public JobStatus $jobStatus;

    public function mount(JobStatus $jobStatus): void
    {
        $this->jobStatus = $jobStatus;
    }

    public function render(): View
    {
        return view('livewire.show-job-progress');
    }

    public function refresh(): void
    {
        $this->jobStatus->refresh();
    }
}
