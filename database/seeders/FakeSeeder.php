<?php

namespace Database\Seeders;

use App\Enums\EventType;
use App\Enums\VenueType;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\CompetitionCategory;
use App\Models\Event;
use App\Models\Result;
use App\Models\Split;
use App\Models\Team;
use App\Models\Venue;
use DB;
use Exception;
use Illuminate\Database\Seeder;
use Illuminate\Support\Arr;

class FakeSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     * @throws Exception
     */
    public function run()
    {
        Athlete::factory(500)->create();
        Team::factory(25)->create();

        Venue::factory(10)->create();
        $competitionsFactory = Competition::factory(25);

        $events = Event::where('type', EventType::IndividualPool)->get();
        $competitionsFactory = $competitionsFactory->has(
            CompetitionCategory::factory()->count(random_int(2, 5)),
            'categories',
        );
        foreach ($events as $event) {
            preg_match('/^\d+(?=m)/', $event->name, $matches);
            $eventDistance = (int) Arr::first($matches);
            $splitCount = $eventDistance / 50;
            $competitionsFactory = $competitionsFactory->has(
                Result::factory()
                    ->count(random_int(25, 50))
                    ->competition($event)
                    ->has(
                        Split::factory()
                            ->count($splitCount)
                            ->result($splitCount),
                    ),
            );
        }

        $competitions = $competitionsFactory->create();

        foreach ($competitions as $competition) {
            $venueTypes = collect(VenueType::getValues())->random(
                random_int(1, 2),
            );
            foreach ($venueTypes as $venueType) {
                $randomVenue = Venue::query()
                    ->where('type', $venueType)
                    ->inRandomOrder()
                    ->first();
                $competition->venues()->attach($randomVenue);
            }
        }
    }
}
