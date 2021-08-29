{{-- TODO: add option to hide columns --}}

<div wire:init="loadResults">
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
            <x-table.heading>{{ trans_choice('app.athletes', 1) }}</x-table.heading>
            <x-table.heading class="text-right">{{ trans_choice('app.time', 1) }}</x-table.heading>
            <x-table.heading>{{ trans_choice('app.date', 1) }}</x-table.heading>
            <x-table.heading class="hidden lg:block">{{ trans_choice('app.competitions', 1) }}</x-table.heading>
        </x-slot>

        <x-slot name="body">
            @if (is_null($results))
                <x-table.placeholder-rows amount="7"/>
            @else
                @forelse($results as $result)
                    <x-table.row>
                        <x-table.columns.athletes :athletes="[$result->entrant]"/>
                        <x-table.columns.times :results="[$result]"/>
                        <x-table.columns.dates :competitions="[$result->competition]"/>
                        <x-table.columns.competitions :competitions="[$result->competition]"/>
                    </x-table.row>
                @empty
                    <x-empty-row colspan="4"/>
                @endforelse
            @endif
        </x-slot>

        <x-slot name="mobileBody">
            @if (is_null($results))
                <x-table.placeholder-mobile-rows amount="7"/>
            @else
                @foreach($results as $result)
                    {{--                    <x-result-row-mobile :athlete="$athlete"/>--}}
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
