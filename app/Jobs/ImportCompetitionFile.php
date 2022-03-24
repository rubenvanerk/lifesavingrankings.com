<?php

namespace App\Jobs;

use App\Actions\SaveResultValueObject;
use App\Exceptions\UnsupportedMimeTypeException;
use App\Models\Media;
use App\Parser\ParserService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Imtigger\LaravelJobStatus\Trackable;

class ImportCompetitionFile implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels, Trackable;

    public function __construct(protected Media $competitionFile)
    {
        $this->prepareStatus();
    }

    /**
     * @throws UnsupportedMimeTypeException
     */
    public function handle(): void
    {
        $this->competitionFile->results()->delete();
        $parser = new ParserService($this->competitionFile);
        $results = $parser->getParsedResults();
        $competition = $this->competitionFile->model;
        $saveResultAction = new SaveResultValueObject();

        $this->setProgressMax($results->count());

        /** @var \App\Parser\ValueObjects\Result $resultValueObject */
        foreach ($results as $resultValueObject) {
            $saveResultAction->handle(
                $resultValueObject,
                $competition,
                $this->competitionFile,
            );

            $this->incrementProgress(1, 25);
        }
    }
}
