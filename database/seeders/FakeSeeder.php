<?php

namespace Database\Seeders;

use App\Enums\EventType;
use App\Enums\VenueType;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Event;
use App\Models\Result;
use App\Models\Venue;
use Exception;
use Illuminate\Database\Seeder;

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
        Athlete::factory(1000)->create();

        Venue::factory(25)->create();
        $competitionsFactory = Competition::factory(50);

        $events = Event::where('type', EventType::IndividualPool)->get();
        foreach ($events as $event) {
            $competitionsFactory = $competitionsFactory->has(
                Result::factory()
                    ->count(random_int(25, 50))
                    ->state(function (array $attributes, Competition $competition) use ($event) {
                        return [
                            'event_id' => $event->id,
                            'competition_id' => $competition->id,
                        ];
                    })
            );
        }

        $competitions = $competitionsFactory->create();

        foreach ($competitions as $competition) {
            $venueTypes = collect(VenueType::getValues())->random(random_int(1, 2));
            foreach ($venueTypes as $venueType) {
                $randomVenue = Venue::query()->where('type', $venueType)->inRandomOrder()->first();
                $competition->venues()->attach($randomVenue);
            }
        }
    }
}
