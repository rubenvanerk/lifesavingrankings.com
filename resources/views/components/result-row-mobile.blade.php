<x-table.mobile-row>
    <x-slot name="icon">
        @foreach($result->entrant->nationalities ?? [] as $country)
            <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                 class="flex-shrink-0 h-3.5 rounded shadow mt-1"/>
        @endforeach
    </x-slot>
    <span class="flex flex-col text-gray-500 text-sm truncate w-full leading-relaxed">
        <a href="" class="truncate hover:text-gray-900">{{ $result->entrant->name }}</a>
        <a href="" class="truncate hover:text-gray-900">{{ $result->event->name }}</a>
        <span class="flex">
            <span class="font-medium flex-grow">{{ $result->time_formatted }}</span>
            <a href="{{ route('competitions.show', $result->competition) }}" class="hover:text-gray-900">
                <time datetime="{{ $result->competition->start_date->format('Y-m-d') }}">
                    {{ $result->competition->start_date->isoFormat('LL') }}
                </time>
            </a>
        </span>
    </span>
</x-table.mobile-row>
