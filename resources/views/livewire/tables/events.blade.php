@php
    $without = ['rank'];
    if ($competition) {
        $without[] = 'competition';
    }
    if ($athlete) {
        $without[] = 'athlete';
    }
    if ($team) {
        $without[] = 'team';
    }
@endphp

<div wire:init="loadEvents">
    @if ($title)
        <h3 class="px-4 sm:px-6 lg:px-8 text-2xl font-extrabold text-gray-900 tracking-tight sm:text-3xl mt-8">
            @if($filter->countActive())
                <span class="text-yellow-400">{{ ucfirst(__('app.filtered')) }}</span>
                {{ strtolower($titleFiltered) ?: strtolower($title) }}
            @else
                {{ ucfirst($title) }}
            @endif
        </h3>
    @endif
    <x-table>
        <x-slot name="head">
            <x-table.heading>{{ trans_choice('app.events', 1) }}</x-table.heading>
            @if (!in_array('athlete', $without))
                <x-table.heading>{{ trans_choice('app.athletes', 1) }}</x-table.heading>
            @endif
            @if (!in_array('team', $without))
                <x-table.heading>{{ trans_choice('app.teams', 1) }}</x-table.heading>
            @endif
            <x-table.heading>{{ trans_choice('app.time', 1) }}</x-table.heading>
            @if (!in_array('competition', $without))
                <x-table.heading>{{ trans_choice('app.date', 1) }}</x-table.heading>
                <x-table.heading class="hidden lg:block">{{ trans_choice('app.competitions', 1) }}</x-table.heading>
            @endif
        </x-slot>

        <x-slot name="body">
            @if (is_null($events))
                @for ($i = 0; $i < 7; $i++)
                    <x-table.placeholder-row :without="$without"/>
                @endfor
            @else
                @forelse($events as $event)
                    <x-table.row>
                        <x-table.columns.event :event="$event"
                                               :competition="$competition ?? null"
                                               :team="$team ?? null"
                                               :athlete="$athlete ?? null"
                                               :genderEnum="$genderEnum ?? $event->results->first()->entrant->gender"/>
                        @if (!in_array('athlete', $without))
                            <x-table.columns.athletes :athletes="$event->results->pluck('entrant')"/>
                        @endif
                        @if (!in_array('team', $without))
                            <x-table.columns.teams :teams="$event->results->pluck('team')"/>
                        @endif
                        <x-table.columns.times :results="$event->results" :athlete="$athlete ?? null"/>
                        @if (!in_array('competition', $without))
                            <x-table.columns.dates :competitions="$event->results->pluck('competition')"/>
                            <x-table.columns.competitions :competitions="$event->results->pluck('competition')"/>
                        @endif
                    </x-table.row>
                @empty
                    <x-empty-row :colspan="7 - count($without)"/>
                @endforelse
            @endif
        </x-slot>

        <x-slot name="mobileBody">
            @if (is_null($events))
                <x-table.placeholder-mobile-rows amount="7"/>
            @else
                @foreach($events as $event)
                    <x-event-row-mobile :without="$without"
                                        :event="$event"
                                        :competition="$competition ?? null"
                                        :team="$team ?? null"
                                        :athlete="$athlete ?? null"
                                        :genderEnum="$genderEnum ?? $event->results->first()->entrant->gender"/>
                @endforeach
            @endif
        </x-slot>
    </x-table>
</div>
