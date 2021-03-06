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
                    <x-table.cell class="max-w-0 w-full">
                        @if ($team->country)
                            <span class="flex items-center space-x-1">
                                <x-flag :country="$team->country"/>
                                <span class="truncate">
                                    {{ $team->country_name }}
                                </span>
                            </span>
                        @endif
                    </x-table.cell>
                </x-table.row>
            @endforeach
        </x-slot>

        <x-slot name="mobileBody">
            @foreach($teams as $team)
                <x-table.mobile-row :link="route('teams.show', $team)">
                    <div class="flex items-center space-x-2">
                        @if ($team->country)
                            <x-flag :country="$team->country"/>
                        @endif
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
