<div wire:init="loadRecords" @if($twoColumns) class="grid grid-cols-1 lg:grid-cols-2" @endif>
    @foreach($eventsByGender as $gender => $recordsByGender)
        <div>
            @if ($title)
                <h3 class="px-4 sm:px-6 lg:px-8 text-2xl font-extrabold text-gray-900 tracking-tight sm:text-3xl mt-8">
                    @if($filter->countActive())
                        <span class="text-yellow-500">{{ ucfirst(__('app.filtered')) }}</span>
                        {{ $filteredTitle ?: strtolower($title) }} {{ $gender }}
                    @else
                        {{ ucfirst($title) }} {{ $gender }}
                    @endif
                </h3>
            @endif

            <x-results-table :resultsByEvents="$recordsByGender" :without="$without ?? []" :limit="$limit"/>
        </div>
    @endforeach
</div>
