<?php

namespace App\Http\Controllers;

use App\Models\Athlete;
use App\Models\Competition;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function __invoke(Request $request): View
    {
        return view('home', [
            'athleteCount' => $this->shortNumber(Athlete::getCachedCount()),
            'competitionCount' => $this->shortNumber(Competition::getCachedCount()),
        ]);
    }

    protected function shortNumber(int $num): string
    {
        $units = ['', 'K', 'M', 'B', 'T'];
        for ($i = 0; $num >= 1000; $i++) {
            $num /= 1000;
        }
        return round($num, 1) . $units[$i];
    }
}
