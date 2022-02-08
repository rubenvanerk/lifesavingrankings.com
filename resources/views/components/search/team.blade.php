<li>
    <a href="{{ route('teams.show', $team) }}" class="block hover:bg-gray-50">
        <div class="px-4 py-4 sm:px-6">
            <div class="flex items-center justify-between">
                <p class="text-sm font-medium text-blue-800 truncate">
                    {{ $team->name }}
                </p>
                <div class="ml-2 flex-shrink-0 flex">
                    @if ($team->country)
                        <p class="mt-2 flex items-center text-sm text-gray-500 sm:mt-0 sm:ml-6">
                            <x-heroicon-s-location-marker class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400"/>
                            {{ $team->country_name }}
                        </p>
                    @endif
                </div>
            </div>
        </div>
    </a>
</li>
