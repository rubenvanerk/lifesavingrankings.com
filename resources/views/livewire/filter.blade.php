<div class="fixed inset-x-0 bottom-0 max-w-7xl mx-auto lg:pb-6" x-data="{ filter: false }">
    <button type="button" title="Filter"
            @click="filter = ! filter"
            x-show="!filter"
            class="absolute z-10 bottom-0 right-0 block transform -translate-y-10 -translate-x-10 inline-flex items-center p-2 border border-transparent rounded-full text-white bg-yellow-500 hover:bg-yellow-600 focus:outline-none shadow-2xl">
        <x-heroicon-s-filter class="h-12 w-12 p-2"/>
        @if ($filter->countActive())
            <span
                class="absolute top-0 right-0 block h-5 w-5 rounded-full ring-2 ring-white bg-blue-800 text-sm font-semibold">
                {{ $filter->countActive() }}
            </span>
        @endif
    </button>

    <div class="bg-blue-800 lg:rounded-lg shadow-2xl border-2 border-blue-900 lg:mx-5 xl:mx-0"
         @click.away="filter = false"
         x-show="filter"
         x-transition:enter="transition ease-in-out duration-300"
         x-transition:enter-start="opacity-0 transform scale-y-0 translate-y-64"
         x-transition:enter-end="opacity-100 transform scale-y-100 translate-y-0"
         x-transition:leave="transition ease-in-out duration-300"
         x-transition:leave-start="opacity-100 transform scale-y-100 translate-y-0"
         x-transition:leave-end="opacity-0 transform scale-y-0 translate-y-64">

        <div class="py-4 px-6 text-white">
            <div class="flex">
                <h2 class="text-lg font-bold pb-4 w-0 flex-grow">Filter results on this page</h2>
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
                <div>
                    <x-buk-label for="from_date"/>
                    <x-buk-input name="from_date" type="date" wire:model="fromDate"/>
                </div>
                <div>
                    <x-buk-label for="to_date"/>
                    <x-buk-input name="to_date" type="date" wire:model="toDate"/>
                </div>
                <div>
                    <x-buk-label for="from_year_of_birth"/>
                    <x-buk-input name="from_year_of_birth" type="number" wire:model="fromYearOfBirth"/>
                </div>
                <div>
                    <x-buk-label for="to_year_of_birth"/>
                    <x-buk-input name="to_year_of_birth" type="number" wire:model="toYearOfBirth"/>
                </div>
            </div>
        </div>
    </div>
</div>
