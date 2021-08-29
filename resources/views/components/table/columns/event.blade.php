<x-table.cell class="max-w-0 w-full">
    <span class="flex">
        @if (!empty($competition))
            <a href="{{ route('competitions.event', ['competition' => $competition, 'event' => $event->slug, 'gender' => $genderEnum->getSlug()]) }}"
               class="truncate">
                {{ $event->name }}
            </a>
        @else
            <a href="{{ route('events.show', ['event' => $event, 'gender' => $genderEnum->getSlug()]) }}"
               class="truncate">
                {{ $event->name }}
            </a>
        @endif
    </span>
</x-table.cell>
