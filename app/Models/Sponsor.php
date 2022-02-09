<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Sponsor extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;

    protected $guarded = ['id'];

    protected $dates = ['valid_from', 'valid_until'];

    protected $casts = [
        'enabled' => 'boolean',
    ];

    public function scopeVisible(Builder $query)
    {
        $query
            ->where('enabled', true)
            ->where(function (Builder $query) {
                $query
                    ->whereNull('valid_from')
                    ->orWhereDate('valid_from', '<', now());
            })
            ->where(function (Builder $query) {
                $query
                    ->whereNull('valid_until')
                    ->orWhereDate('valid_until', '>', now());
            });
    }

    public function getVisibleAttribute(): bool
    {
        return $this->enabled &&
            (is_null($this->valid_from) || $this->valid_from < now()) &&
            (is_null($this->valid_until) || $this->valid_until > now());
    }
}
