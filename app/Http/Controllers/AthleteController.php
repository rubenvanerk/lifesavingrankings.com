<?php

namespace App\Http\Controllers;

use App\Models\Athlete;
use Illuminate\Contracts\View\View;

class AthleteController extends Controller
{
    public function show(Athlete $athlete): View
    {
        if (!$athlete->exists) {
            abort(404);
        }

        return view('athletes.show', compact('athlete'));
    }
}
