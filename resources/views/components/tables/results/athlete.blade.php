<x-table>
    <x-slot name="head">
        <x-table.heading>#</x-table.heading>
        <x-table.heading>{{ trans_choice('app.time', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.teams', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.date', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.competitions', 1) }}</x-table.heading>
    </x-slot>

    <x-slot name="body">
        @if (is_null($results))
            @for ($i = 0; $i < 15; $i++)
                <x-table.row>
                    <x-tables.cells.placeholders.rank/>
                    <x-tables.cells.placeholders.times :count="1"/>
                    <x-tables.cells.placeholders.teams :count="1"/>
                    <x-tables.cells.placeholders.dates :count="1"/>
                    <x-tables.cells.placeholders.competitions :count="1"/>
                </x-table.row>
            @endfor
        @else
            @forelse($results as $result)
                <x-table.row>
                    <x-table.cell>{{ $loop->index + $results->firstItem() }}</x-table.cell>
                    <x-tables.cells.times :results="[$result]"/>
                    <x-tables.cells.teams :teams="[$result->team]"/>
                    <x-tables.cells.dates :competitions="[$result->competition]"/>
                    <x-tables.cells.competitions :competitions="[$result->competition]"/>
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
                            #{{ $loop->index + $results->firstItem() }}
                        </span>
                    </x-slot>
                    <span class="flex flex-col text-sm truncate w-full leading-relaxed">
                        <span class="font-medium">
                            {{ $result->time_formatted }}
                        </span>
                        <span class="flex">
                            <span class="grow">{{ $result->competition->start_date->isoFormat('LL') }}</span>
                            <a href="{{ route('competitions.show', $result->competition) }}">{{ $result->competition->name }}</a>
                        </span>
                    </span>
                </x-table.mobile-row>
            @endforeach
        @endif
    </x-slot>

    @if(!is_null($results))
        <x-slot name="pagination">
            {{ $results->links() }}
        </x-slot>
    @endif
</x-table>
