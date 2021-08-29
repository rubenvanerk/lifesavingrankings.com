<x-table.cell class="max-w-0 w-full">
    <span class="flex">
        <a href="{{ route('events.show', ['event' => $event, 'gender' => $genderEnum->getSlug()]) }}" class="truncate">
            {{ $event->name }}
        </a>
    </span>
</x-table.cell>
