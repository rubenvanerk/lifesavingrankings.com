<?php namespace App\Support;

use Illuminate\Support\Str;

class Time
{
    public readonly int $totalCentiseconds;

    public function __construct(
        public readonly ?int $minutes,
        public readonly int $seconds,
        public readonly int $centiseconds
    )
    {
        $this->totalCentiseconds = $this->minutes * 6000 + $this->seconds * 100 + $this->centiseconds;
    }

    public function __toString()
    {
        if ($this->minutes) {
            return $this->minutes . ':' . Str::padLeft((string)$this->seconds, 2, '0') . '.' . Str::padLeft((string)$this->centiseconds, 2, '0');
        }
        return $this->seconds . '.' . Str::padLeft((string)$this->centiseconds, 2, '0');
    }
}
