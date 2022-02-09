<?php

namespace App\View\Components\Home;

use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Result;
use Illuminate\View\Component;

class Stats extends Component
{
    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\View\View|string
     */
    public function render()
    {
        return view('components.home.stats', [
            'athleteCount' => $this->shortNumber(Athlete::getCachedCount()),
            'competitionCount' => $this->shortNumber(
                Competition::getCachedCount(),
            ),
            'resultCount' => $this->shortNumber(Result::getCachedCount()),
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
