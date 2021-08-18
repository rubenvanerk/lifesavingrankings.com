@section('title')
    {{ trans_choice('app.competitions', 2) }}
@endsection

@section('content')
    <x-table>
        <x-slot name="head">
            <x-table.heading>{{ trans_choice('app.competitions', 1) }}</x-table.heading>
            <x-table.heading>{{ __('app.date') }}</x-table.heading>
            <x-table.heading>{{ __('app.city') }}</x-table.heading>
            <x-table.heading class="hidden lg:table-cell">{{ __('app.country') }}</x-table.heading>
            <x-table.heading class="hidden xl:table-cell">{{ __('app.status') }}</x-table.heading>
        </x-slot>
        <x-slot name="body">
            @foreach($competitions as $competition)
                <x-table.row>
                    <x-table.cell>
                        <a href="{{ route('competitions.show', $competition) }}">{{ $competition->name }}</a>
                    </x-table.cell>
                    <x-table.cell>
                        <span class="flex space-x-1 items-center">
                            <time datetime="{{ $competition->start_date->format('Y-m-d') }}">
                                {{ $competition->start_date->isoFormat('ll') }}
                            </time>
                            @if($competition->end_date)
                                <x-heroicon-s-arrow-sm-right class="h-5"/>
                                <time datetime="{{ $competition->end_date->format('Y-m-d') }}">
                                    {{ $competition->end_date->isoFormat('ll') }}
                                </time>
                            @endif
                        </span>
                    </x-table.cell>
                    <x-table.cell>
                        <span class="flex items-center">
                            <x-dynamic-component :component="'flag-4x3-' . strtolower($competition->venues->first()->country_code)" class="h-3.5 mr-2 block lg:hidden"/>
                            @foreach($competition->venues as $venue)
                                <x-base.badge :color="$venue->type_color">
                                    {{ $venue->city }}
                                </x-base.badge>
                                @if (!$loop->last)
                                    <x-heroicon-s-plus-sm class="h-4"/>
                                @endif
                            @endforeach
                        </span>
                    </x-table.cell>
                    <x-table.cell class="hidden lg:table-cell">
                        <span class="flex items-center">
                            <x-dynamic-component :component="'flag-4x3-' . strtolower($competition->venues->first()->country_code)" class="h-3.5 mr-1"/>
                            {{ $competition->venues->first()->country_name }}
                        </span>
                    </x-table.cell>
                    <x-table.cell class="hidden xl:table-cell">
                        <x-base.badge :color="$competition->status_color">
                            {{ $competition->status->description }}
                        </x-base.badge>
                    </x-table.cell>
                </x-table.row>
            @endforeach
        </x-slot>

        <x-slot name="mobileBody">
            @foreach($competitions as $competition)
                <x-table.mobile-row :link="route('competitions.show', $competition)">
                    <span class="truncate">{{ $competition->name }}</span>
                    <span class="flex items-center space-x-1">
                        <time datetime="{{ $competition->start_date->format('Y-m-d') }}">
                            {{ $competition->start_date->isoFormat('ll') }}
                        </time>
                        @if($competition->end_date)
                            <x-heroicon-s-arrow-sm-right class="h-5"/>
                            <time datetime="{{ $competition->end_date->format('Y-m-d') }}">
                                {{ $competition->end_date->isoFormat('ll') }}
                            </time>
                        @endif
                    </span>
                    <span class="flex items-center">
                        <x-dynamic-component :component="'flag-4x3-' . strtolower($competition->venues->first()->country_code)" class="h-3.5 mr-2"/>
                        @foreach($competition->venues as $venue)
                            <x-base.badge :color="$venue->type_color">
                                {{ $venue->city }}
                            </x-base.badge>
                            @if (!$loop->last)
                                <x-heroicon-s-plus-sm class="h-4"/>
                            @endif
                        @endforeach
                    </span>
                </x-table.mobile-row>
            @endforeach
        </x-slot>
    </x-table>
@endsection