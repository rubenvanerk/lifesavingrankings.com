<x-table.cell>
    <div class="flex flex-col gap-y-1">
        @for($i = 0; $i < $count; $i++)
            <div class="h-5 bg-gray-200 rounded w-64"></div>
        @endfor
    </div>
</x-table.cell>
