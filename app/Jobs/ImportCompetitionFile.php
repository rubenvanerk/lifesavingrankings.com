<?php

namespace App\Jobs;

use App\Actions\SaveResultValueObject;
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
        $competition = $this->competitionFile->model;
        $saveResultAction = new SaveResultValueObject();

        /** @var \App\Parser\ValueObjects\Result $resultValueObject */
        foreach ($results as $resultValueObject) {
            $saveResultAction->handle(
                $resultValueObject,
                $competition,
                $this->competitionFile,
            );
        }
    }
}
