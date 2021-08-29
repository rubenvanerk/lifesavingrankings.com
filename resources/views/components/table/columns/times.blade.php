<x-table.cell>
    <div class="flex flex-col space-y-1">
        @foreach($results as $result)
            @if (!empty($athlete))
                <a href="{{ route('athletes.event', ['athlete' => $athlete, 'event' => $result->event->slug]) }}">{{ $result->time_formatted }}</a>
            @else
                <span>{{ $result->time_formatted }}</span>
            @endif
        @endforeach
    </div>
</x-table.cell>
