<?php

namespace App\Models;

use App\Casts\Options;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ParserConfig extends Model
{
    protected $casts = [
        'options' => Options::class,
    ];

    protected $appends = [
        'horizontal_offset',
    ];

    public function media(): BelongsTo
    {
        return $this->belongsTo(Media::class);
    }

    public function getHorizontalOffsetAttribute($value) // TODO: make generic
    {
        return $this->options->firstWhere('name', 'horizontal_offset')->value;
    }

    public function setAttribute($key, $value)
    {
        $option = $this->options->firstWhere('name', $key);
        if ($option) {
            $this->options = $this->options->map(function ($option) use ($key, $value) {
                if ($option->name == $key) {
                    $option->value = $value;
                }
                return $option;
            });
            return $this;
        }

        return parent::setAttribute($key, $value);
    }
}
