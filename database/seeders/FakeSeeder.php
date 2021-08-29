<?php

namespace Database\Seeders;

use App\Enums\EventType;
use App\Enums\VenueType;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Event;
use App\Models\Result;
use App\Models\Team;
use App\Models\Venue;
use DB;
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
        Athlete::factory(500)->create();
        Team::factory(25)->create();

        Venue::factory(10)->create();
        $competitionsFactory = Competition::factory(25);

        $events = Event::where('type', EventType::IndividualPool)->get();
        foreach ($events as $event) {
            $competitionsFactory = $competitionsFactory->has(
                Result::factory()
                    ->count(random_int(25, 50))
                    ->state(function (array $attributes, Competition $competition) use ($event) {
                        return [
                            'event_id' => $event->id,
                            'competition_id' => $competition->id,
                            'entrant_type' => Athlete::class,
                            'entrant_id' => DB::table('athletes')->select(['id'])->inRandomOrder()->first()->id,
                            'team_id' => DB::table('teams')->select(['id'])->inRandomOrder()->first()->id,
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
