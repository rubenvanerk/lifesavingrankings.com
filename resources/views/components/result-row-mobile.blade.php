<x-table.mobile-row>
    <x-slot name="icon">
        @if ($rank)
            <span>
                #{{ $rank }}
            </span>
        @elseif (!in_array('athlete', $without))
            @foreach($result->entrant->nationalities ?? [] as $country)
                <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                     class="flex-shrink-0 h-3.5 rounded shadow mt-1"/>
            @endforeach
        @endif
    </x-slot>
    <span class="flex flex-col text-sm truncate w-full leading-relaxed">
        <span class="flex space-x-2">
            @if ($rank && !in_array('athlete', $without))
                @foreach($result->entrant->nationalities ?? [] as $country)
                    <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                         class="flex-shrink-0 h-3.5 rounded shadow mt-1"/>
                @endforeach
                <a href="{{ route('athletes.show', $result->entrant) }}" class="truncate">
                    {{ $result->entrant->name }}
                </a>
                <sup>'{{ substr($result->entrant->year_of_birth, -2) }}
            @endif
        </span>
        @if (!in_array('event', $without))
            <a href="" class="truncate">{{ $result->event->name }}</sup></a>
        @endif
        <span class="flex">
            <span class="flex-grow font-medium">{{ $result->time_formatted }}</span>
            @if (!in_array('competition', $without))
                <a href="{{ route('competitions.show', $result->competition) }}">
                    <time datetime="{{ $result->competition->start_date->format('Y-m-d') }}">
                        {{ $result->competition->start_date->isoFormat('LL') }}
                    </time>
                </a>
            @endif
        </span>
    </span>
</x-table.mobile-row>
