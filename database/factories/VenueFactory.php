<?php

namespace Database\Factories;

use App\Enums\VenueType;
use App\Models\Venue;
use Illuminate\Database\Eloquent\Factories\Factory;

class VenueFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Venue::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $venueType = VenueType::getRandomInstance();
        return [
            'name' => ucfirst($this->faker->words(asText: true)),
            'city' => $this->faker->city,
            'country_code' => $this->faker->countryISOAlpha3,
            'type' => $venueType->value,
            'pool_size' => $venueType->is(VenueType::Pool) ? $this->faker->numberBetween(1, 2) * 25 : null,
        ];
    }
}
