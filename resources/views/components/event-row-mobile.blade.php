<x-table.mobile-row>
    @if ($event->results->count() === 1)
        @php
            $result = $event->results->first();
        @endphp
        <x-slot name="icon">
            @foreach($result->entrant->nationalities ?? [] as $country)
                <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                     class="flex-shrink-0 h-3.5 rounded shadow mt-1"/>
            @endforeach
        </x-slot>
        <span class="flex flex-col text-sm truncate w-full leading-relaxed">
            <a href="{{ route('athletes.show', $result->entrant) }}" class="truncate">{{ $result->entrant->name }}</a>
            <a href="" class="truncate">{{ $result->event->name }}</a>
            <span class="flex">
                <span class="flex-grow font-medium">{{ $result->time_formatted }}</span>
                <a href="{{ route('competitions.show', $result->competition) }}">
                    <time datetime="{{ $result->competition->start_date->format('Y-m-d') }}">
                        {{ $result->competition->start_date->isoFormat('LL') }}
                    </time>
                </a>
            </span>
        </span>
    @else
        <span class="flex flex-col text-sm truncate w-full leading-relaxed">
            @if (!empty($competition))
                <a href="{{ route('competitions.event', ['competition' => $competition, 'event' => $event->slug, 'gender' => $genderEnum->getSlug()]) }}"
                   class="truncate mb-2">
                    {{ $event->name }}
                </a>
            @elseif (!empty($team))
                <a href="{{ route('teams.event', ['team' => $team, 'event' => $event->slug, 'gender' => $genderEnum->getSlug()]) }}"
                   class="truncate mb-2">
                    {{ $event->name }}
                </a>
            @else
                <a href="{{ route('events.show', ['event' => $event, 'gender' => $genderEnum->getSlug()]) }}"
                   class="truncate mb-2">
                    {{ $event->name }}
                </a>
            @endif

            @foreach($event->results as $result)
                <div class="flex space-x-1">
                    @foreach($result->entrant->nationalities ?? [] as $country)
                        <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                             class="flex-shrink-0 h-3.5 rounded shadow mt-1"/>
                    @endforeach
                    <a href="{{ route('athletes.show', $result->entrant) }}" class="flex-grow truncate">{{ $result->entrant->name }}</a>
                    <span class="font-medium">{{ $result->time_formatted }}</span>
                </div>
            @endforeach
        </span>
    @endif
</x-table.mobile-row>
