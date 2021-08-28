<x-table.row>
    <x-table.cell colspan="{{ $colspan }}">
        <div class="w-full text-center leading-loose">
            No results, would you like to
            <button wire:click.prevent="resetFilter"
                type="button" class="inline-flex items-center px-3 py-1.5 border border-transparent text-xs font-medium rounded-full shadow-sm text-white bg-blue-800 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                reset the filter?
            </button>
        </div>
    </x-table.cell>
</x-table.row>
