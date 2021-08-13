<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Venue extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function competitions(): BelongsToMany
    {
        return $this->belongsToMany(Competition::class);
    }
}
