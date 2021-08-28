@for ($i = 0; $i < 7; $i++)
    <x-table.mobile-row>
        <x-slot name="icon">
            <div class="flex-shrink-0 h-4 w-5 rounded shadow mt-1 bg-gray-200"></div>
        </x-slot>
        <span class="flex flex-col">
            <div class="bg-gray-200 h-4 rounded w-44 my-1"></div>
            <div class="bg-gray-200 h-4 rounded w-64 my-1"></div>
            <span class="flex space-x-5">
                <div class="bg-gray-200 h-4 rounded flex-grow w-32 my-1"></div>
                <div class="bg-gray-200 h-4 rounded w-16 my-1"></div>
            </span>
        </span>
    </x-table.mobile-row>
@endfor
