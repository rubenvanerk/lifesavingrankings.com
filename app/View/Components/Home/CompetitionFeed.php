<?php

namespace App\View\Components\Home;

use App\Enums\CompetitionStatus;
use App\Models\Competition;
use Cache;
use Illuminate\View\Component;

class CompetitionFeed extends Component
{
    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        $competitions = Cache::remember('competition_feed', 60, function () {
            return Competition::latest('start_date')
                ->where('status', CompetitionStatus::Published)
                ->select(['id', 'name', 'slug', 'start_date'])
                ->withCount('results')
                ->limit(6)
                ->get();
        });
        return view('components.home.competition-feed', [
            'competitions' => $competitions,
        ]);
    }
}
