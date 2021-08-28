<?php namespace App\Traits;

use App\Services\Filter;

trait WithFilter
{
    public function __construct()
    {
        $this->listeners = array_merge($this->listeners ?? [], ['filtered' => '$refresh']);
    }

    public function resetFilter(): void
    {
        Filter::reset();
        $this->emit('filtered');
    }
}
