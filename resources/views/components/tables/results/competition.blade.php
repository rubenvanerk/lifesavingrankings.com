<x-table>
    <x-slot name="head">
        <x-table.heading>#</x-table.heading>
        <x-table.heading>{{ trans_choice('app.athletes', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.time', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.teams', 1) }}</x-table.heading>
    </x-slot>

    <x-slot name="body">
        @if (is_null($results))
            @for ($i = 0; $i < 15; $i++)
                <x-table.row>
                    <x-tables.cells.placeholders.rank/>
                    <x-tables.cells.placeholders.entrants :count="1"/>
                    <x-tables.cells.placeholders.times :count="1"/>
                    <x-tables.cells.placeholders.dates :count="1"/>
                </x-table.row>
            @endfor
        @else
            @forelse($results as $result)
                <x-table.row>
                    <x-table.cell>{{ $loop->index + 1 }}</x-table.cell>
                    <x-tables.cells.entrants :entrants="[$result->entrant]" :segments="$result->segments"/>
                    <x-tables.cells.times :results="[$result]"/>
                    <x-tables.cells.teams :teams="\Illuminate\Support\Arr::wrap($result->team)"/>
                </x-table.row>
            @empty
                <x-tables.empty-row/>
            @endforelse
        @endif
    </x-slot>

    <x-slot name="mobileBody">
        @if (is_null($results))
            <x-tables.placeholder-mobile-rows/>
        @else
            @foreach($results as $result)
                <x-table.mobile-row>
                    <x-slot name="icon">
                        <span>
                            #{{ $loop->index + 1 }}
                        </span>
                    </x-slot>
                    <span class="flex flex-col text-sm truncate w-full leading-relaxed">
                        <span class="flex space-x-2">
                            @foreach($result->entrant->countries ?? [] as $country)
                                <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                                     class="shrink-0 h-3.5 rounded shadow mt-1"/>
                            @endforeach
                            <span class="flex w-full">
                                <span class="grow">
                                    @if ($result->entrant instanceof \App\Models\Athlete)
                                        <a href="{{ route('athletes.show', $result->entrant) }}">
                                            {{ $result->entrant->name }}
                                        </a>
                                        <sup>'{{ substr($result->entrant->year_of_birth, 2) }}</sup>
                                    @else
                                        {{ $result->entrant->name }}
                                    @endif
                                </span>
                                <span>{{ $result->team?->name }}</span>
                            </span>
                        </span>
                        <span class="font-medium">
                            {{ $result->time_formatted }}
                        </span>
                    </span>
                </x-table.mobile-row>
            @endforeach
        @endif
    </x-slot>
</x-table>
