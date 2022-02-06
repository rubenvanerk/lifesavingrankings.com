<?php

namespace App\Parser\ValueObjects;

use App\Enums\ResultStatus;
use App\Models\Competition;
use App\Models\Event;
use App\Models\Media;
use App\Support\Time;

class Result
{
    public function __construct(
        public readonly Event $event,
        public readonly Entrant $entrant,
        public readonly ?Team $team = null,
        public readonly ?Time $time = null,
        public readonly ?ResultStatus $status = null,
        public readonly ?Category $category = null,
        public readonly ?Segments $segments = null,
        public readonly ?array $splits = null, // TODO: rewrite to segments
        public readonly ?string $originalLine = null,
        public readonly ?int $originalLineNumber = null
    )
    {
        // TODO: check if count(this->segments) === count (event->segments)
    }

    public function toModel(): \App\Models\Result
    {
        return new \App\Models\Result([
            'time' => $this->time,
            'status' => $this->status,
            'splits' => $this->splits,
            'original_line' => $this->originalLine,
            'original_line_number' => $this->originalLineNumber,
            'event_id' => $this->event->id,
        ]);
    }

    public function getFormattedTime(): string
    {
        return (string)$this->time;
    }

    /**
     * @return Result[]
     */
    public function getSegments(): array
    {
        return $this->segments?->results ?: [];
    }
}
