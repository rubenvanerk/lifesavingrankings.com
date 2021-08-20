<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RelaySegment extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function relay()
    {
        return $this->belongsTo(Event::class, 'segment_id');
    }

    public function event()
    {
        return $this->belongsTo(Event::class);
    }
}
