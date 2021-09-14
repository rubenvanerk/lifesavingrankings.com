<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class RelaySplit extends Pivot
{
    protected $table = 'relay_segment_result';
    public $timestamps = false;
}
