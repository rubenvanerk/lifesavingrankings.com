<?php

namespace App\Models;

use App\Casts\Time;
use App\Traits\HasTime;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Split extends Model
{
    use HasFactory, HasTime;

    protected $casts = [
        'time' => Time::class,
    ];
}
