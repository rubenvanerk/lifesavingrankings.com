<li>
    <a href="{{ route('athletes.show', $athlete) }}" class="block hover:bg-gray-50">
        <div class="px-4 py-4 sm:px-6">
            <div class="flex items-center justify-between">
                <p class="text-sm font-medium text-blue-900 truncate">
                    <span class="inline-flex items-center space-x-1">
                        @foreach($athlete->countries ?? [] as $country)
                            <x-dynamic-component
                                :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                class="h-3.5"/>
                        @endforeach
                        <span>
                            {{ $athlete->name }}
                        </span>
                    </span>
                    <sup>'{{ substr($athlete->year_of_birth, -2) }}</sup>
                </p>
            </div>
        </div>
    </a>
</li>
