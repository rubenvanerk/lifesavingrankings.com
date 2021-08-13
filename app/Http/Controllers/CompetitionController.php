<?php

namespace App\Http\Controllers;

use App\Models\Competition;
use Illuminate\Contracts\View\View;

class CompetitionController extends Controller
{
    public function index(): View
    {
        $competitions = Competition::with('venues')->get();
        return view('competitions.index', compact('competitions'));
    }

    public function show(Competition $competition): View
    {
        if (!$competition->exists) {
            abort(404);
        }
        return view('competitions.show', compact('competition'));
    }
}
