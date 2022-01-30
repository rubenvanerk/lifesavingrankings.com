<x-table>
    <x-slot name="head">
        <x-table.heading>{{ trans_choice('app.events', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.time', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.teams', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.date', 1) }}</x-table.heading>
        <x-table.heading class="hidden lg:block">{{ trans_choice('app.competitions', 1) }}</x-table.heading>
    </x-slot>

    <x-slot name="body">
        @if (is_null($events))
            @for ($i = 0; $i < 5; $i++)
                <x-table.row>
                    <x-tables.cells.placeholders.event/>
                    <x-tables.cells.placeholders.times :count="$resultLimit"/>
                    <x-tables.cells.placeholders.teams :count="$resultLimit"/>
                    <x-tables.cells.placeholders.dates :count="$resultLimit"/>
                    <x-tables.cells.placeholders.competitions :count="$resultLimit"/>
                </x-table.row>
            @endfor
        @else
            @forelse($events as $event)
                <x-table.row>
                    <x-tables.cells.event :event="$event"
                                          :url="route('athletes.event', ['event' => $event, 'athlete' => $athlete])"/>
                    <x-tables.cells.times :results="$event->results" :athlete="$athlete ?? null" :event="$event"/>
                    <x-tables.cells.teams :teams="$event->results->pluck('team')"/>
                    <x-tables.cells.dates :competitions="$event->results->pluck('competition')"/>
                    <x-tables.cells.competitions :competitions="$event->results->pluck('competition')"/>
                </x-table.row>
            @empty
                <x-tables.empty-row/>
            @endforelse
        @endif
    </x-slot>

    <x-slot name="mobileBody">
        @if (is_null($events))
            <x-tables.placeholder-mobile-rows/>
        @else
            @foreach($events as $event)
                <x-table.mobile-row>
                    <span class="flex flex-col text-sm truncate w-full leading-relaxed">
                        <a href="{{ route('athletes.event', ['event' => $event, 'athlete' => $athlete]) }}"
                           class="truncate">
                            {{ $event->name }}
                        </a>
                        @php $result = $event->results->first() @endphp
                        <div class="flex">
                            <span class="font-medium grow">{{ $result->time_formatted }}</span>
                            <a href="{{ route('competitions.show', $result->competition) }}">
                                {{ $result->competition->start_date->isoFormat('LL') }}
                            </a>
                        </div>
                    </span>
                </x-table.mobile-row>
            @endforeach
        @endif
    </x-slot>
</x-table>
