<x-table.cell>
    <div class="flex flex-col space-y-1">
        @foreach($competitions as $competition)
            <span class="hidden lg:inline">{{ $competition->start_date->isoFormat('LL') }}</span>
            <a href="{{ route('competitions.show', $competition) }}" class="block lg:hidden">
                {{ $competition->start_date->isoFormat('LL') }}
            </a>
        @endforeach
    </div>
</x-table.cell>
