<x-table.cell>
    <div class="flex flex-col space-y-1">
        @foreach($results as $result)
            <span>{{ $result->time_formatted }}</span>
        @endforeach
    </div>
</x-table.cell>
