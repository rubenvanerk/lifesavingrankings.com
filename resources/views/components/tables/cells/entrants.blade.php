<x-table.cell>
    <div class="flex flex-col space-y-1">
        @foreach($entrants as $entrant)
            <span>
                @if ($entrant instanceof \App\Models\Athlete)
                    <a href="{{ route('athletes.show', $entrant) }}" class="inline-flex items-center space-x-1">
                        @foreach($entrant->nationalities ?? [] as $country)
                            <x-dynamic-component
                                :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                class="h-3.5"/>
                        @endforeach
                        <span>
                            {{ $entrant->name }}
                        </span>
                    </a>
                    <sup>'{{ substr($entrant->year_of_birth, -2) }}</sup>
                @else
                    <span class="inline-flex items-center space-x-1">
                        @if ($entrant->country)
                            <x-dynamic-component
                                :component="'flag-4x3-' . strtolower($entrant->country->getIsoAlpha2())"
                                class="h-3.5"/>
                        @endif
                        <span>
                            {{ $entrant->name }}
                        </span>
                    </span>
                @endif
            </span>
        @endforeach
    </div>
</x-table.cell>