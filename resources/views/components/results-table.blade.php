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
            @if(empty($result))
                <x-table.placeholder-row/>
                @continue
            @endif
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
                            <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                                 class="h-3.5"/>
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
        @foreach($results as $result)
            @if(empty($result))
                <x-table.placeholder-mobile-row/>
                @continue
            @endif
            <x-table.mobile-row>
                <x-slot name="icon">
                    @foreach($result->entrant->nationalities ?? [] as $country)
                        <x-dynamic-component :component="'flag-4x3-' . strtolower($country->getIsoAlpha2())"
                                             class="flex-shrink-0 h-3.5 rounded shadow mt-1"/>
                    @endforeach
                </x-slot>
                <span class="flex flex-col text-gray-500 text-sm truncate w-full leading-relaxed">
                    <a href="" class="truncate hover:text-gray-900">{{ $result->entrant->name }}</a>
                    <a href="" class="truncate hover:text-gray-900">{{ $result->event->name }}</a>
                    <span class="flex">
                        <span class="font-medium flex-grow">{{ $result->time_formatted }}</span>
                        <a href="{{ route('competitions.show', $result->competition) }}" class="hover:text-gray-900">
                            <time datetime="{{ $result->competition->start_date->format('Y-m-d') }}">
                                {{ $result->competition->start_date->isoFormat('LL') }}
                            </time>
                        </a>
                    </span>
                </span>
            </x-table.mobile-row>
        @endforeach
    </x-slot>
</x-table>
