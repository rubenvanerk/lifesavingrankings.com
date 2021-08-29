<div>
    <x-table>
        <x-slot name="head">
            <x-table.heading>{{ trans_choice('app.teams', 1) }}</x-table.heading>
            <x-table.heading>{{ __('app.country') }}</x-table.heading>
        </x-slot>
        <x-slot name="body">
            @foreach($teams as $team)
                <x-table.row>
                    <x-table.cell>
                        <a href="{{ route('teams.show', $team) }}">
                            {{ $team->name }}
                        </a>
                    </x-table.cell>
                    <x-table.cell class="hidden lg:table-cell max-w-0 w-full">
                        <span class="flex items-center space-x-1">
                            <x-dynamic-component
                                :component="'flag-4x3-' . $team->country_code"
                                class="h-3.5 flex-none"/>
                            <span class="truncate">
                                {{ $team->country_name }}
                            </span>
                        </span>
                    </x-table.cell>
                </x-table.row>
            @endforeach
        </x-slot>

        <x-slot name="mobileBody">
            @foreach($teams as $team)
                <x-table.mobile-row :link="route('teams.show', $team)">
                    <div class="flex items-center space-x-2">
                        <x-dynamic-component
                            :component="'flag-4x3-' . $team->country_code"
                            class="h-3.5 flex-none"/>
                        <span>{{ $team->name }}</span>
                    </div>
                </x-table.mobile-row>
            @endforeach
        </x-slot>

        <x-slot name="pagination">
            {{ $teams->links() }}
        </x-slot>
    </x-table>
</div>
