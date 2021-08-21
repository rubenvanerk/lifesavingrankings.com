<?php

namespace Database\Factories;

use App\Enums\EventType;
use App\Enums\ResultStatus;
use App\Models\Athlete;
use App\Models\Event;
use App\Models\Result;
use Illuminate\Database\Eloquent\Factories\Factory;

class ResultFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Result::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'status' => $this->faker->boolean(5) ? ResultStatus::getRandomValue() : null,
            'time' => $this->faker->numberBetween(2500, 25000),
            'event_id' => Event::where('type', EventType::IndividualPool)->inRandomOrder()->select('id')->first()->id,
            'entrant_type' => Athlete::class,
            'entrant_id' => Athlete::inRandomOrder()->select('id')->first()->id,
        ];
    }
}
