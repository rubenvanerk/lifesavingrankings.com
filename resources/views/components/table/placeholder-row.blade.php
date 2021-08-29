<x-table.row>
    <x-table.cell>
        <div class="flex flex-col gap-y-1">
            <div class="h-5 bg-gray-200 rounded w-10"></div>
        </div>
    </x-table.cell>

    @if (!in_array('event', $without))
        <x-table.cell class="max-w-0 w-full">
            <div class="h-5 bg-gray-200 rounded w-1/2"></div>
        </x-table.cell>
    @endif

    @if (!in_array('athlete', $without))
        <x-table.cell>
            <div class="flex flex-col gap-y-1">
                <div class="h-5 bg-gray-200 rounded w-64"></div>
            </div>
        </x-table.cell>
    @endif

    <x-table.cell>
        <div class="flex flex-col gap-y-1">
            <div class="h-5 bg-gray-200 rounded w-16"></div>
        </div>
    </x-table.cell>

    @if (!in_array('competition', $without))
        <x-table.cell>
            <div class="h-5 bg-gray-200 rounded w-16"></div>
        </x-table.cell>

        <x-table.cell class="hidden lg:block">
            <div class="h-5 bg-gray-200 rounded w-44"></div>
        </x-table.cell>
    @endif
</x-table.row>
