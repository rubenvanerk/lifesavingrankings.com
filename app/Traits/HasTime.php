<?php namespace App\Traits;

trait HasTime
{
    public function getTimeFormattedAttribute(): string
    {
        if ($this->time->minutes) {
            return sprintf('%s:%s.%s',
                $this->time->minutes,
                str_pad($this->time->seconds, 2, '0', STR_PAD_LEFT),
                str_pad($this->time->microseconds / 10000, 2, '0', STR_PAD_LEFT)
            );
        }
        return sprintf('%s.%s',
            $this->time->seconds,
            str_pad($this->time->microseconds / 10000, 2, '0', STR_PAD_LEFT)
        );
    }
}
