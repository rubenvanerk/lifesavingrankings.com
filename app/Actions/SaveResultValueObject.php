<?php

namespace App\Actions;

use App\Models\Competition;
use App\Models\Media;
use App\Parser\ValueObjects\Result;

class SaveResultValueObject
{
    public function handle(
        Result $resultValueObject,
        Competition $competition,
        Media $competitionFile,
    ): \App\Models\Result {
        $result = $resultValueObject->toModel();
        $result->competition()->associate($competition);
        $result->media_source()->associate($competitionFile);

        $entrant = $resultValueObject->entrant->toModel($competition);
        $entrant->save();
        $result->entrant()->associate($entrant);

        $result->save();

        if ($resultValueObject->category) {
            $category = $resultValueObject->category->toModel($competition);
            $category->save();
            $result->competition_category()->associate($category);
        }

        if ($resultValueObject->team) {
            $team = $resultValueObject->team->toModel($competition);
            $team->save();
            $result->team()->associate($team);
        }

        foreach ($resultValueObject->getSegments() as $segment) {
            $result
                ->segments()
                ->save($this->handle($segment, $competition, $competitionFile));
        }

        $result->save();

        return $result;
    }
}
