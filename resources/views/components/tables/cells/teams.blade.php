<x-table.cell>
    <div class="flex flex-col space-y-1">
        @foreach($teams as $team)
            <span>
                <a href="{{ route('teams.show', $team) }}">
                    {{ $team->name }}
                </a>
            </span>
        @endforeach
    </div>
</x-table.cell>
