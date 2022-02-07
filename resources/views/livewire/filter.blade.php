<div class="fixed inset-x-0 bottom-0 max-w-7xl mx-auto lg:pb-6" x-data="{ filter: false }">
    <button type="button" title="Filter"
            @click="filter = ! filter"
            x-show="!filter"
            class="absolute z-10 bottom-0 right-0 block -translate-y-10 -translate-x-10 inline-flex items-center p-2 border border-transparent rounded-full text-white bg-amber-500 hover:bg-amber-600 focus:outline-none shadow-2xl transition">
        <x-heroicon-s-filter class="h-12 w-12 p-2"/>
        @if ($filter->countActive())
            <span
                class="absolute top-0 right-0 block h-5 w-5 rounded-full ring-2 ring-white bg-blue-800 text-sm font-semibold">
                {{ $filter->countActive() }}
            </span>
        @endif
    </button>

    <div class="bg-blue-800 lg:rounded-lg shadow-2xl lg:mx-5 xl:mx-0"
         @click.away="filter = false"
         x-show="filter" x-cloak
         x-transition:enter="transition ease-in-out duration-300"
         x-transition:enter-start="opacity-0 scale-y-0 translate-y-64"
         x-transition:enter-end="opacity-100 scale-y-100 translate-y-0"
         x-transition:leave="transition ease-in-out duration-300"
         x-transition:leave-start="opacity-100 scale-y-100 translate-y-0"
         x-transition:leave-end="opacity-0 scale-y-0 translate-y-64">

        <div class="py-4 px-6 text-white">
            <div class="flex">
                <h2 class="text-lg font-bold pb-4 w-0 grow">Filter results on this page</h2>
                <span>
                    <x-base.button icon="s-refresh" wire:click="clear">
                        Reset
                    </x-base.button>
                    <x-base.button icon="s-x-circle" @click="filter = false">
                        Close
                    </x-base.button>
                </span>

            </div>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                {{-- TODO: Dynamically show filters based on $fields and visibility --}}
                <div>
                    <x-forms.input.with-label label="From date" name="from_date" labelClasses="text-white" wire:model="fields.from_date.value" type="date"/>
                </div>
                <div>
                    <x-forms.input.with-label label="To date" name="to_date" labelClasses="text-white" wire:model="fields.to_date.value" type="date"/>
                </div>
                <div>
                    <x-forms.input.with-label label="From year of birth" name="from_year_of_birth" labelClasses="text-white" wire:model="fields.from_year_of_birth.value" type="number" min="0"/>
                </div>
                <div>
                    <x-forms.input.with-label label="To year of birth" name="to_year_of_birth" labelClasses="text-white" wire:model="fields.to_year_of_birth.value" type="number" min="0"/>
                </div>
                <div>
                    <x-forms.label for="category" color-class="text-white">Category</x-forms.label>
                    <select wire:model="fields.competition_category.value" name="competition_category" id="category" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-blue-800 focus:border-blue-800 sm:text-sm rounded-md text-gray-900">
                        <option value="">---</option>
                        @foreach($this->options['competition_category'] ?? [] as $key => $option)
                            <option value="{{ $key }}">{{ $option }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <x-forms.label for="venue" color-class="text-white">Venue</x-forms.label>
                    <select wire:model="fields.venue.value" name="competition_category" id="venue" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-blue-800 focus:border-blue-800 sm:text-sm rounded-md text-gray-900">
                        <option value="">---</option>
                        @foreach(\App\Models\Venue::orderBy('name')->get()->pluck('name', 'id') as $key => $option)
                            <option value="{{ $key }}">{{ $option }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
    </div>
</div>
