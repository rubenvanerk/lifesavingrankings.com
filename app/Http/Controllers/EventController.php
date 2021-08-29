<?php

namespace App\Http\Controllers;

use App\Enums\Gender;
use App\Models\Event;

class EventController extends Controller
{
    public function show(Event $event, $gender)
    {
        $gender = Gender::coerce(ucfirst($gender));

        if (!$event->exists) {
            abort(404);
        }

        return view('events.show', compact('event', 'gender'));
    }
}
