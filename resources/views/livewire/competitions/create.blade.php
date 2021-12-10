<div class="px-4 py-5 sm:p-6">
    @if($created)
        <x-base.alert color="green">
            Thank you for adding a competition. I'll review and import this competition soon!
        </x-base.alert>
    @else
        <form wire:submit.prevent="submit" class="w-1/2 flex-col space-y-5">
            <div>
                <x-buk-label for="name"/>
                <x-buk-input name="name" type="text" wire:model="name"/>
                @error('name') <span class="text-red-900">{{ $message }}</span> @enderror
            </div>

            <div>
                <x-buk-label for="start_date"/>
                <x-buk-input name="start_date" type="date" wire:model="start_date"/>
                @error('start_date') <span class="text-red-900">{{ $message }}</span> @enderror
            </div>

            <div>
                <x-buk-label for="end_date"/>
                <x-buk-input name="end_date" type="date" wire:model="end_date"/>
                @error('end_date') <span class="text-red-900">{{ $message }}</span> @enderror
            </div>

            <x-base.button type="submit">Create competition</x-base.button>
        </form>
    @endif
</div>
