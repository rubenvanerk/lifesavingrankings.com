<x-table.cell class="hidden lg:block">
    <div class="flex flex-col space-y-1">
        @foreach($competitions as $competition)
            <a href="{{ route('competitions.show', $competition) }}">{{ $competition->name }}</a>
        @endforeach
    </div>
</x-table.cell>
