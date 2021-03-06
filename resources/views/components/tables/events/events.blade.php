<x-table :title="$title">
    <x-slot name="head">
        <x-table.heading>{{ trans_choice('app.events', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.athletes', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.time', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.teams', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.date', 1) }}</x-table.heading>
        <x-table.heading class="hidden lg:block">{{ trans_choice('app.competitions', 1) }}</x-table.heading>
    </x-slot>

    <x-slot name="body">
        @if (is_null($events))
            @for ($i = 0; $i < 10; $i++)
                <x-table.row>
                    <x-tables.cells.placeholders.event/>
                    <x-tables.cells.placeholders.entrants :count="$resultLimit"/>
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
                                          :url="route('events.show', ['event' => $event, 'gender' => $gender->getSlug()])"/>
                    <x-tables.cells.entrants :entrants="$event->results->pluck('entrant')"/>
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
                        <a href="{{ route('events.show', ['event' => $event, 'gender' => $gender->getSlug()]) }}"
                           class="truncate">
                            {{ $event->name }}
                        </a>
                        @foreach($event->results as $result)
                            <div class="flex space-x-1">
                                <x-tables.cells.contents.entrant :entrant="$result->entrant" class="flex-grow"/>
                                <span class="font-medium">{{ $result->time_formatted }}</span>
                            </div>
                        @endforeach
                    </span>
                </x-table.mobile-row>
            @endforeach
        @endif
    </x-slot>
</x-table>
