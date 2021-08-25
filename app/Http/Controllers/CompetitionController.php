<?php

namespace App\Http\Controllers;

use App\Models\Competition;
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
}
