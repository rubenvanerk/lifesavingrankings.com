<?php

namespace App\Casts;

use App\Enums\ResultStatus;
use App\Models\Event;
use App\Models\ParserConfig;
use App\Support\ParserOptions\AthleteMatcher;
use App\Support\ParserOptions\CategoryMatcher;
use App\Support\ParserOptions\EventIndicator;
use App\Support\ParserOptions\EventMatcher;
use App\Support\ParserOptions\StatusMatcher;
use App\Support\ParserOptions\TimeMatcher;
use App\Support\ParserOptions\WomenMatcher;
use App\Support\ParserOptions\HorizontalOffsetOption;
use App\Support\ParserOptions\MenMatcher;
use App\Support\ParserOptions\Option;
use App\Support\ParserOptions\ResultIndicator;
use App\Support\ParserOptions\TeamMatcher;
use App\Support\ParserOptions\YearOfBirthMatcher;
use Illuminate\Contracts\Database\Eloquent\CastsAttributes;
use Illuminate\Support\Collection;

class Options implements CastsAttributes
{
    /**
     * Cast the given value.
     *
     * @param ParserConfig $model
     * @param string $key
     * @param mixed $value
     * @param array $attributes
     * @return Collection
     */
    public function get($model, string $key, $value, array $attributes): Collection
    {
        $options = $this->getDefaultOptions($model->media->mime_type);
        $optionValues = json_decode($value, true);
        foreach ($options as $option) {
            if (isset($optionValues[$option->name])) {
                $option->value = $optionValues[$option->name];
            }
        }

        return $options->mapWithKeys(function (Option $option) {
            return [$option->name => $option];
        });
    }

    /**
     * Prepare the given value for storage.
     *
     * @param ParserConfig $model
     * @param string $key
     * @param mixed $value
     * @param array $attributes
     * @return mixed
     */
    public function set($model, string $key, $value, array $attributes)
    {
        $optionsToSave = [];
        foreach ($value as $option) {
            $optionsToSave[$option->name] = $option->value;
        }
        return json_encode($optionsToSave);
    }

    protected function getDefaultOptions(string $mimeType): Collection
    {
        return match ($mimeType) {
            'application/pdf' => $this->getDefaultPdfOptions(),
            'text/plain' => $this->getDefaultTextOptions(),
            default => collect(),
        };
    }

    private function getDefaultPdfOptions(): Collection
    {
        return $this->getDefaultTextOptions()->merge(collect([
            new HorizontalOffsetOption(),
        ]));
    }

    private function getDefaultTextOptions(): Collection
    {
        return $this->getDefaultGeneralOptions()->merge(collect([
            new EventIndicator(),
            new CategoryMatcher(),
            new MenMatcher(),
            new WomenMatcher(),
            new ResultIndicator(),
            new TimeMatcher(),
            new StatusMatcher(status: ResultStatus::DSQ()),
            new StatusMatcher(status: ResultStatus::DNF()),
            new StatusMatcher(status: ResultStatus::DNS()),
            new StatusMatcher(status: ResultStatus::WDR()),
            new AthleteMatcher(),
            new YearOfBirthMatcher(),
            new TeamMatcher(),
        ]));
    }

    private function getDefaultGeneralOptions(): Collection
    {
        $options = collect();

        foreach (Event::all() as $event) {
            $options->add(new EventMatcher($event));
        }

        return $options;
    }
}
