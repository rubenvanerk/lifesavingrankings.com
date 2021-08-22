<x-table>
    <x-slot name="head">
        <x-table.heading>{{ trans_choice('app.events', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.athletes', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.time', 1) }}</x-table.heading>
        <x-table.heading>{{ trans_choice('app.date', 1) }}</x-table.heading>
        <x-table.heading class="hidden lg:block">{{ trans_choice('app.competitions', 1) }}</x-table.heading>
    </x-slot>

    <x-slot name="body">
        @foreach($results as $result)
            <x-table.row>
                <x-table.cell class="max-w-0 w-full">
                    <span class="flex">
                        <a href="#" class="truncate">
                            {{ $result->event->name }}
                        </a>
                    </span>
                </x-table.cell>
                <x-table.cell>
                    <a href="#" class="inline-flex items-center space-x-1">
                        @foreach($result->entrant->nationalities ?? [] as $country)
                            <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())" class="h-3.5"/>
                        @endforeach
                        <span>
                            {{ $result->entrant->name }}
                        </span>
                    </a>
                </x-table.cell>
                <x-table.cell>
                    {{ $result->time_formatted }}
                </x-table.cell>
                <x-table.cell>
                    <span class="hidden lg:block">{{ $result->competition->start_date->isoFormat('LL') }}</span>
                    <a href="{{ route('competitions.show', $result->competition) }}" class="block lg:hidden">
                        {{ $result->competition->start_date->isoFormat('LL') }}
                    </a>
                </x-table.cell>
                <x-table.cell class="hidden lg:block">
                    <a href="{{ route('competitions.show', $result->competition) }}">
                        {{ $result->competition->name }}
                    </a>
                </x-table.cell>
            </x-table.row>
        @endforeach
    </x-slot>

    <x-slot name="mobileBody">
        <x-table.mobile-row>
            <x-slot name="icon">
                <x-dynamic-component :component="'flag-4x3-it'" class="flex-shrink-0 h-4 rounded shadow mt-1"/>
            </x-slot>

            <span class="flex flex-col text-gray-500 text-sm truncate w-full leading-relaxed">
                <a href="" class="truncate hover:text-gray-900">Lucrezia Fabretti</a>
                <a href="" class="truncate hover:text-gray-900">100m manikin carry with fins</a>
                <span class="flex">
                    <span class="font-medium flex-grow">0:49.33</span>
                    <a href="#" class="hover:text-gray-900">
                        <time datetime="{{ now()->format('Y-m-d') }}">
                            {{ now()->isoFormat('LL') }}
                        </time>
                    </a>
                </span>
            </span>
        </x-table.mobile-row>
    </x-slot>
</x-table>
