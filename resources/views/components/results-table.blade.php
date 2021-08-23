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
        @foreach($results as $result)
            @if(empty($result))
                <x-table.placeholder-row :without="$without ?? []"/>
            @else
                <x-result-row :result="$result" :without="$without ?? []"/>
            @endif
        @endforeach
    </x-slot>

    <x-slot name="mobileBody">
        @foreach($results as $result)
            @if(empty($result))
                <x-table.placeholder-mobile-row :without="$without ?? []"/>
            @else
                <x-result-row-mobile :result="$result" :without="$without ?? []"/>
            @endif
        @endforeach
    </x-slot>
</x-table>
