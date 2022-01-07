<?php

namespace App\Http\Livewire\Competitions;

use App\Exceptions\UnsupportedMimeTypeException;
use App\Models\Competition;
use Illuminate\Contracts\View\View;
use Livewire\Component;
use Parser;

class Parse extends Component
{
    public Competition $competition;

    public function render(): View
    {
        try {
            $data = [
                'rawText' => Parser::getRawText($this->competition->getFirstMedia('files')),
            ];
        } catch (UnsupportedMimeTypeException) {
            return view('livewire.competitions.parse_error', [
                'message' => sprintf('Mime type %s is not supported', $this->competition->getFirstMedia('files')->mime_type),
            ]);
        }

        return view('livewire.competitions.parse', $data);
    }
}
