<?php

namespace Database\Factories;

use App\Models\Result;
use App\Models\Split;
use Illuminate\Database\Eloquent\Factories\Factory;

class SplitFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Split::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            //
        ];
    }


    public function result($count): SplitFactory
    {
        return $this->state(function (array $attributes, Result $result) {
            return [
                'time' => round($result->getRawOriginal('time') / $this->count),
                'distance' => 50,
            ];
        });
    }
}
