<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class SponsorFactory extends Factory
{
    public function definition(): array
    {
        $validUntil = $this->faker->dateTimeThisYear(now()->addMonths($this->faker->numberBetween(0, 3)));

        return [
            'name' => $this->faker->company(),
            'valid_from' => $this->faker->dateTimeThisYear($validUntil),
            'valid_until' => $validUntil,
            'enabled' => $this->faker->boolean()
        ];
    }
}
