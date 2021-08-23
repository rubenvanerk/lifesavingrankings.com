<?php

namespace Database\Factories;

use App\Enums\CompetitionStatus;
use App\Enums\TimekeepingMethod;
use App\Models\Competition;
use Carbon\CarbonImmutable;
use Illuminate\Database\Eloquent\Factories\Factory;

class CompetitionFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Competition::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $startDate = new CarbonImmutable($this->faker->dateTimeThisDecade());
        $status = CompetitionStatus::getRandomInstance();
        return [
            'name' => ucfirst((string)$this->faker->words(asText: true)) . ' ' . $startDate->year,
            'start_date' => $startDate,
            'end_date' => $this->faker->boolean ? $this->faker->dateTimeBetween($startDate->addDay(), $startDate->addDays(4)) : null,
            'timekeeping' => TimekeepingMethod::getRandomValue(),
            'published_at' => $status->is(CompetitionStatus::Published) ? $this->faker->dateTimeBetween($startDate) : null,
            'status' => $status->value,
            'comment' => $this->faker->boolean ? $this->faker->text : null,
            'ils_sanctioned' => $this->faker->boolean(20),
        ];
    }
}
