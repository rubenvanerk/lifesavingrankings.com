<?php namespace App\Traits;


trait HasCachedCount
{
    public static function getCachedCount(): int
    {
        return \Cache::remember(self::class . '_count', 120, function () {
            return self::count();
        });
    }
}
