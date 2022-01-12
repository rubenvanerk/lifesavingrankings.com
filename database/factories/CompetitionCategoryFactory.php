<?php

namespace Database\Factories;

use App\Models\CompetitionCategory;
use Illuminate\Database\Eloquent\Factories\Factory;

class CompetitionCategoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = CompetitionCategory::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->word()
        ];
    }
}
