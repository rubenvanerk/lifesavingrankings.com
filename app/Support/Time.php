<?php namespace App\Support;

use Carbon\CarbonInterval;

class Time extends CarbonInterval
{
    public function __toString()
    {
        if ($this->minutes) {
            return sprintf('%s:%s.%s',
                $this->minutes,
                str_pad((string) $this->seconds, 2, '0', STR_PAD_LEFT),
                str_pad((string) ($this->microseconds / 10000), 2, '0', STR_PAD_LEFT)
            );
        }
        return sprintf('%s.%s',
            $this->seconds,
            str_pad((string) ($this->microseconds / 10000), 2, '0', STR_PAD_LEFT)
        );
    }
}
