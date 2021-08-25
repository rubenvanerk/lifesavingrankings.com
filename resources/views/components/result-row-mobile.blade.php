<x-table.mobile-row>
    @if ($resultsByEvent->count() === 1)
        <x-slot name="icon">
            @foreach($resultsByEvent->first()->entrant->nationalities ?? [] as $country)
                <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                     class="flex-shrink-0 h-3.5 rounded shadow mt-1"/>
            @endforeach
        </x-slot>
        <span class="flex flex-col text-sm truncate w-full leading-relaxed">
            <a href="{{ route('athletes.show', $resultsByEvent->first()->entrant) }}" class="truncate">{{ $resultsByEvent->first()->entrant->name }}</a>
            <a href="" class="truncate">{{ $resultsByEvent->first()->event->name }}</a>
            <span class="flex">
                <span class="flex-grow font-medium">{{ $resultsByEvent->first()->time_formatted }}</span>
                <a href="{{ route('competitions.show', $resultsByEvent->first()->competition) }}">
                    <time datetime="{{ $resultsByEvent->first()->competition->start_date->format('Y-m-d') }}">
                        {{ $resultsByEvent->first()->competition->start_date->isoFormat('LL') }}
                    </time>
                </a>
            </span>
        </span>
    @else
        <span class="flex flex-col text-sm truncate w-full leading-relaxed">
            <a href="" class="truncate hover:text-gray-900">{{ $resultsByEvent->first()->event->name }}</a>

            @foreach($resultsByEvent as $result)
                <div class="flex space-x-1">
                    @foreach($result->entrant->nationalities ?? [] as $country)
                        <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                             class="flex-shrink-0 h-3.5 rounded shadow mt-1"/>
                    @endforeach
                    <a href="{{ route('athletes.show', $resultsByEvent->first()->entrant) }}" class="flex-grow truncate">{{ $result->entrant->name }}</a>
                    <span class="font-medium">{{ $result->time_formatted }}</span>
                </div>
            @endforeach
        </span>
    @endif
</x-table.mobile-row>
