<?php namespace App\Traits;

use App\Services\Filter;
use View;

trait WithFilter
{
    public function __construct()
    {
        $this->listeners = array_merge($this->listeners ?? [], [
            'filtered' => '$refresh',
        ]);
        View::share('filter', app(Filter::class));
    }

    public function resetFilter(): void
    {
        Filter::reset();
        $this->emit('filtered');
    }
}
