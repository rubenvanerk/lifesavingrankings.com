<?php

namespace App\Models;

use Imtigger\LaravelJobStatus\JobStatus as LaravelJobStatus;

class JobStatus extends LaravelJobStatus
{
    public function getProgressPercentageAttribute()
    {
        return (int)$this->progress_max !== 0 ? round(100 * $this->progress_now / $this->progress_max) : 0;
    }
}
