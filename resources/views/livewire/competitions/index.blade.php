@section('title')
    {{ trans_choice('app.competitions', 2) }}
@endsection

@section('breadcrumbs')
    {{ Breadcrumbs::render('competitions') }}
@endsection

@section('meta-breadcrumbs')
    {{ Breadcrumbs::view('breadcrumbs::json-ld', 'competitions') }}
@endsection

<div>
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
                    <x-table.cell class="flex items-center space-x-1">
                        <a href="{{ route('competitions.show', $competition) }}"
                           class="flex items-center space-x-1">
                            {{ $competition->name }}
                        </a>
                        @if($competition->ils_sanctioned)
                            <x-base.tooltip :title="__('app.ils_sanctioned')">
                                <x-heroicon-s-badge-check class="h-5 w-5 text-green-800"
                                                          aria-label="{{ __('app.ils_sanctioned') }}"/>
                            </x-base.tooltip>
                        @endif
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
                        <span class="flex items-center space-x-1">
                            <x-dynamic-component
                                :component="'flag-4x3-' . $competition->venues->first()->country_code"
                                class="h-3.5 flex-none block lg:hidden"/>
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
                        </span>
                    </x-table.cell>
                    <x-table.cell class="hidden lg:table-cell max-w-0 w-full">
                        <span class="flex items-center space-x-1">
                            <x-dynamic-component
                                :component="'flag-4x3-' . $competition->venues->first()->country_code"
                                class="h-3.5 flex-none"/>
                            <span class="truncate">
                                {{ $competition->venues->first()->country_name }}
                            </span>
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
                    <span class="truncate flex items-center space-x-1">
                        <span>{{ $competition->name }}</span>
                        @if ($competition->ils_sanctioned)
                            <x-base.tooltip :title="__('app.ils_sanctioned')">
                                <x-heroicon-s-badge-check class="h-5 w-5 text-green-800" @click.prevent
                                                          aria-label="{{ __('app.ils_sanctioned') }}"/>
                            </x-base.tooltip>
                        @endif
                    </span>
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
                    <span class="flex items-center space-x-1">
                        <x-dynamic-component
                            :component="'flag-4x3-' . $competition->venues->first()->country_code"
                            class="h-3.5 flex-none"/>
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
                    </span>
                </x-table.mobile-row>
            @endforeach
        </x-slot>

        <x-slot name="pagination">
            {{ $competitions->links() }}
        </x-slot>
    </x-table>
</div>
