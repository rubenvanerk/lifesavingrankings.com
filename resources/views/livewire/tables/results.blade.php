@php
    $without = ['event'];
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

<div wire:init="loadResults">
    @if ($title)
        <h3 class="px-4 sm:px-6 lg:px-8 text-2xl font-extrabold text-gray-900 tracking-tight sm:text-3xl mt-8">
            @if($filter->countActive())
                <span class="text-amber-400">{{ ucfirst(__('app.filtered')) }}</span>
                {{ strtolower($titleFiltered) ?: strtolower($title) }}
            @else
                {{ ucfirst($title) }}
            @endif
        </h3>
    @endif
    <x-table>
        <x-slot name="head">
            <x-table.heading>#</x-table.heading>
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
            @if (is_null($results))
                @for ($i = 0; $i < 15; $i++)
                    <x-table.placeholder-row :without="$without"/>
                @endfor
            @else
                @php
                    $rank = is_null($competition) ? $results->firstItem() : 1;
                @endphp
                @forelse($results as $result)
                    <x-table.row>
                        <x-table.cell>{{ $rank + $loop->index }}</x-table.cell>
                        @if (!in_array('athlete', $without))
                            <x-table.columns.athletes :athletes="[$result->entrant]"/>
                        @endif
                        @if (!in_array('team', $without))
                            <x-table.columns.teams :teams="[$result->team]"/>
                        @endif
                        <x-table.columns.times :results="[$result]"/>
                        @if (!in_array('competition', $without))
                            <x-table.columns.dates :competitions="[$result->competition]"/>
                            <x-table.columns.competitions :competitions="[$result->competition]"/>
                        @endif
                    </x-table.row>
                @empty
                    <x-empty-row :colspan="7 - count($without)"/>
                @endforelse
            @endif
        </x-slot>

        <x-slot name="mobileBody">
            @if (is_null($results))
                <x-table.placeholder-mobile-rows amount="7"/>
            @else
                @php
                    $rank = is_null($competition) ? $results->firstItem() : 1;
                @endphp
                @foreach($results as $result)
                    <x-result-row-mobile :result="$result"
                                         :rank="$rank + $loop->index"
                                         :without="$without"/>
                @endforeach
            @endif
        </x-slot>

        @if (is_null($competition) && !is_null($results))
            <x-slot name="pagination">
                {{ $results->links() }}
            </x-slot>
        @endif
    </x-table>
</div>
