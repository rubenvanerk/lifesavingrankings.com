<?php

namespace App\Http\Controllers;

use App\Models\Athlete;
use App\Models\Event;
use Illuminate\Contracts\View\View;

class AthleteController extends Controller
{
    public function show(Athlete $athlete): View
    {
        if (!$athlete->exists) {
            abort(404);
        }

        // TODO: add competitions_count
        $athlete->loadCount(['results']);

        return view('athletes.show', compact('athlete'));
    }

    public function event(Athlete $athlete, $event): View
    {
        $event = Event::where('slug', $event)->first();

        if (!$event->exists || !$athlete->exists) {
            abort(404);
        }

        return view('athletes.event', compact('athlete', 'event'));
    }
}
