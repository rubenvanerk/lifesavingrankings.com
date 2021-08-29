<?php

namespace App\Http\Controllers;

use App\Enums\Gender;
use App\Models\Competition;
use App\Models\Event;
use Illuminate\Contracts\View\View;

class CompetitionController extends Controller
{
    public function show(Competition $competition): View
    {
        if (!$competition->exists) {
            abort(404);
        }

        $competition->load(['venues' => function ($query) {
            $query->orderBy('type');
        }]);

        return view('competitions.show', compact('competition'));
    }

    public function event(Competition $competition, $event, $gender)
    {
        $gender = Gender::coerce(ucfirst($gender));
        $event = Event::where('slug', $event)->first();

        if (!$event) {
            abort(404);
        }

        return view('competitions.event', compact('competition', 'event', 'gender'));
    }
}
