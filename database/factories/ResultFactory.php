<?php

namespace Database\Factories;

use App\Enums\EventType;
use App\Enums\ResultStatus;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Event;
use App\Models\Result;
use DB;
use Illuminate\Database\Eloquent\Factories\Factory;
use JetBrains\PhpStorm\ArrayShape;

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
    #[
        ArrayShape([
            'status' => 'int|null',
            'time' => 'int',
            'event_id' => 'int',
        ]),
    ]
    public function definition(): array
    {
        return [
            'status' => $this->faker->boolean(5)
                ? ResultStatus::getRandomValue()
                : null,
            'time' => $this->faker->numberBetween(2500, 25000),
            'event_id' => Event::where('type', EventType::IndividualPool)
                ->inRandomOrder()
                ->select('id')
                ->first()->id,
        ];
    }

    public function competition(Event $event): ResultFactory
    {
        return $this->state(function (
            array $attributes,
            Competition $competition,
        ) use ($event) {
            return [
                'event_id' => $event->id,
                'entrant_type' => Athlete::class,
                'entrant_id' => DB::table('athletes')
                    ->select(['id'])
                    ->inRandomOrder()
                    ->first()->id,
                'team_id' => DB::table('teams')
                    ->select(['id'])
                    ->inRandomOrder()
                    ->first()->id,
                'competition_category_id' => DB::table('competition_categories')
                    ->where('competition_id', $competition->id)
                    ->inRandomOrder()
                    ->first()->id,
            ];
        });
    }
}
