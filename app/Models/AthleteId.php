<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AthleteId extends Model
{
    use HasFactory;

    public $guarded = ['id'];

    public function athlete(): BelongsTo
    {
        return $this->belongsTo(Athlete::class);
    }

    public function id_type(): BelongsTo
    {
        return $this->belongsTo(AthleteIdType::class);
    }
}
