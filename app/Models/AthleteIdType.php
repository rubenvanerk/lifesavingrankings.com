<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class AthleteIdType extends Model
{
    use HasFactory;

    public $guarded = ['id'];

    public function athlete_ids(): HasMany
    {
        return $this->hasMany(AthleteId::class);
    }
}
