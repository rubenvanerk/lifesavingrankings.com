<x-table.cell>
    <div class="flex flex-col space-y-1">
        @foreach($athletes as $athlete)
            <span>
                <a href="{{ route('athletes.show', $athlete) }}" class="inline-flex items-center space-x-1">
                    @foreach($athlete->nationalities ?? [] as $country)
                        <x-dynamic-component
                            :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                            class="h-3.5"/>
                    @endforeach
                    <span>
                        {{ $athlete->name }}
                    </span>
                </a>
                <sup>'{{ substr($athlete->year_of_birth, -2) }}</sup>
            </span>
        @endforeach
    </div>
</x-table.cell>