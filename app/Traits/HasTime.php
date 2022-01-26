<?php namespace App\Traits;

trait HasTime
{
    public function getTimeFormattedAttribute(): string
    {
        if ($this->status) {
            return $this->status->description;
        }

        return (string) $this->time;
    }
}
