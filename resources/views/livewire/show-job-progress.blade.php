<div class="bg-white rounded-md p-5 mb-4 flex justify-center" wire:poll>
    @if (!$jobStatus->is_queued)
        <div class="flex items-center space-x-1">
            @if($jobStatus->is_finished)
                <x-heroicon-s-check-circle class="w-5 h-5 text-green-700"/>
                <span>Done!</span>
            @else
                <progress value="{{ $jobStatus->progress_now }}" max="{{ $jobStatus->progress_max }}" class="text-green-700 w-64"> {{ $jobStatus->progress_percentage }}% </progress>
                <span>
                    {{ $jobStatus->progress_percentage }}%
                </span>
            @endif
        </div>
    @else
        <div>
            Job hasn't started yet.
        </div>
    @endif
</div>
