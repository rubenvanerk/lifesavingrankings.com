{{-- TODO: add option to hide columns --}}

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
            <x-table.heading>{{ trans_choice('app.athletes', 1) }}</x-table.heading>
            <x-table.heading class="text-right">{{ trans_choice('app.time', 1) }}</x-table.heading>
            <x-table.heading>{{ trans_choice('app.date', 1) }}</x-table.heading>
            <x-table.heading class="hidden lg:block">{{ trans_choice('app.competitions', 1) }}</x-table.heading>
        </x-slot>

        <x-slot name="body">
            @if (is_null($events))
                <x-table.placeholder-rows amount="7"/>
            @else
                @forelse($events as $event)
                    <x-table.row>
                        <x-table.columns.event :event="$event" :competition="$competition ?? null" :genderEnum="$genderEnum ?? $event->results->first()->entrant->gender"/>
                        <x-table.columns.athletes :athletes="$event->results->pluck('entrant')"/>
                        <x-table.columns.times :results="$event->results"/>
                        <x-table.columns.dates :competitions="$event->results->pluck('competition')"/>
                        <x-table.columns.competitions :competitions="$event->results->pluck('competition')"/>
                    </x-table.row>
                @empty
                    <x-empty-row colspan="5"/>
                @endforelse
            @endif
        </x-slot>

        <x-slot name="mobileBody">
            @if (is_null($events))
                <x-table.placeholder-mobile-rows amount="7"/>
            @else
                @foreach($events as $event)
                    <x-event-row-mobile :event="$event"/>
                @endforeach
            @endif
        </x-slot>
    </x-table>
</div>
