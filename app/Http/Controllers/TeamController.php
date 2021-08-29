<?php

namespace App\Http\Controllers;

use App\Enums\Gender;
use App\Models\Event;
use App\Models\Team;
use Illuminate\Contracts\View\View;

class TeamController extends Controller
{
    public function show(Team $team): View
    {
        if (!$team->exists) {
            abort(404);
        }

        return view('teams.show', compact('team'));
    }

    public function event(Team $team, $event, $gender)
    {
        $gender = Gender::coerce(ucfirst($gender));
        $event = Event::where('slug', $event)->first();

        if (!$event->exists || !$team->exists) {
            abort(404);
        }

        return view('teams.event', compact('team', 'event', 'gender'));
    }
}
