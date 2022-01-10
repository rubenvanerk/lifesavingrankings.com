<?php

namespace App\Casts;

use App\Support\ParserOptions\HorizontalOffsetOption;
use App\Support\ParserOptions\Option;
use Illuminate\Contracts\Database\Eloquent\CastsAttributes;
use Illuminate\Support\Collection;

class Options implements CastsAttributes
{
    /**
     * Cast the given value.
     *
     * @param \Illuminate\Database\Eloquent\Model $model
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
            if (isset($optionValues[get_class($option)])) {
                $option->value = $optionValues[get_class($option)];
            }
        }

        return $options->mapWithKeys(function (Option $option) {
            return [$option->name => $option];
        });
    }

    /**
     * Prepare the given value for storage.
     *
     * @param \Illuminate\Database\Eloquent\Model $model
     * @param string $key
     * @param mixed $value
     * @param array $attributes
     * @return mixed
     */
    public function set($model, string $key, $value, array $attributes)
    {
        $optionsToSave = [];
        foreach ($value as $option) {
            $optionsToSave[get_class($option)] = $option->value;
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
        return collect();
    }
}
