<?php

namespace App\Models;

use App\Casts\Options;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Livewire\Wireable;

class ParserConfig extends Model
{
    protected $casts = [
        'options' => Options::class,
    ];

    public function media(): BelongsTo
    {
        return $this->belongsTo(Media::class);
    }

    public function toLivewire()
    {
        dd('1');
    }

    public static function fromLivewire($value)
    {
        dd('2');
    }
}
