<x-table.cell class="hidden lg:block">
    <div class="flex flex-col gap-y-1">
        @for($i = 0; $i < $count ?? 1; $i++)
            <div class="h-5 bg-gray-200 rounded w-44"></div>
        @endfor
    </div>
</x-table.cell>
