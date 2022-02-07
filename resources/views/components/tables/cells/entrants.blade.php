<x-table.cell>
    <div class="flex flex-col space-y-1">
        @foreach($entrants as $entrant)
            <x-tables.cells.contents.entrants :entrant="$entrant"/>
        @endforeach
    </div>
</x-table.cell>
