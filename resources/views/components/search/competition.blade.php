<li>
    <a href="{{ route('competitions.show', $competition) }}" class="block hover:bg-gray-50">
        <div class="px-4 py-4 sm:px-6">
            <div class="flex items-center justify-between">
                <p class="text-sm font-medium text-blue-800 truncate">
                    {{ $competition->name }}
                </p>
                <div class="ml-2 flex-shrink-0 flex">
                    <x-base.badge :color="$competition->status_color">
                        {{ $competition->status->description }}
                    </x-base.badge>
                </div>
            </div>
            <div class="mt-2 sm:flex sm:justify-between">
                <div class="sm:flex">
                    <p class="flex items-center text-sm text-gray-500">
                        <x-heroicon-s-users class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400"/>
                        {{ $competition->athlete_count }} {{ strtolower(trans_choice('app.athletes', 2)) }}
                    </p>
                    <p class="mt-2 flex items-center text-sm text-gray-500 sm:mt-0 sm:ml-6">
                        <x-heroicon-s-location-marker class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400"/>
                        @foreach($competition->venues as $venue)
                            <x-base.badge :color="$venue->type_color">
                                {{ $venue->city }}
                                @if($venue->is_pool)
                                    <span class="ml-1.5 text-blue-400">
                                        {{ $venue->pool_size_label }}
                                    </span>
                                @endif
                            </x-base.badge>
                            @if (!$loop->last)
                                <x-heroicon-s-plus-sm class="h-4"/>
                            @endif
                        @endforeach
                    </p>
                </div>
                <div class="mt-2 flex items-center text-sm text-gray-500 sm:mt-0">
                    <x-heroicon-s-calendar class="flex-shrink-0 mr-1.5 h-5 w-5 text-gray-400"/>
                    <p class="flex space-x-1 items-center">
                        <time datetime="{{ $competition->start_date->format('Y-m-d') }}">
                            {{ $competition->start_date->isoFormat('ll') }}
                        </time>
                        @if($competition->end_date)
                            <x-heroicon-s-arrow-sm-right class="h-5"/>
                            <time datetime="{{ $competition->end_date->format('Y-m-d') }}">
                                {{ $competition->end_date->isoFormat('ll') }}
                            </time>
                        @endif
                    </p>
                </div>
            </div>
        </div>
    </a>
</li>
