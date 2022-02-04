<?php

namespace App\Jobs;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Models\Media;
use App\Models\Result;
use App\Parser\ParserService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class ImportCompetitionFile implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(protected Media $competitionFile)
    {
    }

    /**
     * Execute the job.
     *
     * @return void
     * @throws UnsupportedMimeTypeException
     */
    public function handle()
    {
        $this->competitionFile->results()->delete();
        $parser = new ParserService($this->competitionFile);
        $results = $parser->getParsedResults();

        /** @var Result $result */
        foreach ($results as $result) {
            $result->competition()->associate($this->competitionFile->model);
            $result->media_source()->associate($this->competitionFile);
            if ($result->parsedCategory) {
                $result->competition_category()->associate($result->parsedCategory->toDatabase(['competition_id' => $this->competitionFile->model->id]));
            }
            $result->entrant()->associate($result->parsedEntrant->toDatabase());
            $result->team()->associate($result->parsedTeam->toDatabase());
            $result->save();

            foreach ($result->parsedSegments as $segment) {
                $segment->entrant()->associate($segment->parsedEntrant->toDatabase());
                $segment->competition()->associate($this->competitionFile->model);
                $segment->media_source()->associate($this->competitionFile);
                $segment->save();
                $result->segments()->save($segment);
            }

            $result->save();
        }
    }
}
