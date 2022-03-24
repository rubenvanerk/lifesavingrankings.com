@props(['entrants', 'segments' => []])

<x-table.cell>
    <div class="flex flex-col space-y-1">
        @foreach($entrants as $entrant)
            <x-tables.cells.contents.entrant :entrant="$entrant" :segments="$segments"/>
        @endforeach
    </div>
</x-table.cell>
