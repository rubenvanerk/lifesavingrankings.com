<?php

namespace Database\Factories;

use App\Enums\Gender;
use App\Models\Athlete;
use Illuminate\Database\Eloquent\Factories\Factory;

class AthleteFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Athlete::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $gender = Gender::getRandomValue();

        $multipleNationalitiesChance = 100;
        $nationalities = [];
        while ($multipleNationalitiesChance > 1) {
            if ($this->faker->boolean($multipleNationalitiesChance)) {
                $nationalities[] = $this->faker->countryCode();
            }
            $multipleNationalitiesChance /= 20;
        }

        return [
            'name' => $this->faker->name($gender),
            'year_of_birth' => $this->faker->year(now()->subYears(16)),
            'gender' => $gender,
            'nationalities' => $nationalities,
        ];
    }
}
