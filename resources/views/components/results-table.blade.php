<x-table>
    <x-slot name="head">
        @if (!in_array('event', $without ?? []))
            <x-table.heading>{{ trans_choice('app.events', 1) }}</x-table.heading>
        @endif
        @if (!in_array('athlete', $without ?? []))
            <x-table.heading>{{ trans_choice('app.athletes', 1) }}</x-table.heading>
        @endif
        <x-table.heading>{{ trans_choice('app.time', 1) }}</x-table.heading>
        @if (!in_array('date', $without ?? []))
            <x-table.heading>{{ trans_choice('app.date', 1) }}</x-table.heading>
        @endif
        @if (!in_array('competition', $without ?? []))
            <x-table.heading class="hidden lg:block">{{ trans_choice('app.competitions', 1) }}</x-table.heading>
        @endif
    </x-slot>

    <x-slot name="body">
        @foreach($resultsByEvents as $resultsByEvent)
            @if(empty($resultsByEvent))
                <x-table.placeholder-row :without="$without ?? []" :limit="$limit"/>
            @else
                <x-result-row :resultsByEvent="$resultsByEvent" :without="$without ?? []"/>
            @endif
        @endforeach
    </x-slot>

    <x-slot name="mobileBody">
        @foreach($resultsByEvents as $resultsByEvent)
            @if(empty($resultsByEvent))
                <x-table.placeholder-mobile-row :without="$without ?? []"/>
            @else
                <x-result-row-mobile :resultsByEvent="$resultsByEvent" :without="$without ?? []"/>
            @endif
        @endforeach
    </x-slot>
</x-table>
