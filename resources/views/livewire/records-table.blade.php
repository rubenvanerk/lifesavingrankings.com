<div>
    @foreach($eventsByGender as $gender => $recordsByGender)
        <h3 class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-2xl font-extrabold text-gray-900 tracking-tight sm:text-3xl mt-8">
            @if($filter->countActive())
                <span class="text-yellow-500">{{ ucfirst(__('app.filtered')) }}</span>
            @else
                {{ ucfirst(__('app.world')) }}
            @endif
            {{ __('app.records') }} {{ $gender }}
        </h3>

        <x-results-table :results="$recordsByGender"/>
    @endforeach
</div>
