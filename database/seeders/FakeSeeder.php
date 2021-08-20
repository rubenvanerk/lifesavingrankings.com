<?php

namespace Database\Seeders;

use App\Enums\VenueType;
use App\Models\Athlete;
use App\Models\Competition;
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
        $competitions = Competition::factory(100)->create();

        foreach ($competitions as $competition) {
            $venueTypes = collect(VenueType::getValues())->random(random_int(1, 2));
            foreach ($venueTypes as $venueType) {
                $randomVenue = Venue::query()->where('type', $venueType)->inRandomOrder()->first();
                $competition->venues()->attach($randomVenue);
            }
        }
    }
}
