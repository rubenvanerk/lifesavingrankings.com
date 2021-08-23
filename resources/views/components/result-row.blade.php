<x-table.row>
    @if (!in_array('event', $without ?? []))
        <x-table.cell class="max-w-0 w-full">
            <span class="flex">
                <a href="#" class="truncate">
                    {{ $result->event->name }}
                </a>
            </span>
        </x-table.cell>
    @endif

    @if (!in_array('athlete', $without ?? []))
    <x-table.cell>
        <a href="#" class="inline-flex items-center space-x-1">
            @foreach($result->entrant->nationalities ?? [] as $country)
                <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                     class="h-3.5"/>
            @endforeach
            <span>
                {{ $result->entrant->name }}
            </span>
        </a>
    </x-table.cell>
    @endif

    <x-table.cell>
        {{ $result->time_formatted }}
    </x-table.cell>

    @if (!in_array('date', $without ?? []))
        <x-table.cell>
            <span class="hidden lg:block">{{ $result->competition->start_date->isoFormat('LL') }}</span>
            <a href="{{ route('competitions.show', $result->competition) }}" class="block lg:hidden">
                {{ $result->competition->start_date->isoFormat('LL') }}
            </a>
        </x-table.cell>
    @endif

    @if (!in_array('competition', $without ?? []))
        <x-table.cell class="hidden lg:block">
            <a href="{{ route('competitions.show', $result->competition) }}">
                {{ $result->competition->name }}
            </a>
        </x-table.cell>
    @endif
</x-table.row>
