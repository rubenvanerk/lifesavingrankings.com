@extends('layouts.app')

@section('title')
    {{ $competition->name }} {{ strtolower(trans_choice('app.results', '2')) }}
@endsection

@section('content')
    @can('edit competitions')
        <div class="px-4 sm:px-6 lg:px-8">
            <x-base.button href="/admin/competitions/{{ $competition->id }}/edit"> {{-- TODO: use route generator --}}
                Edit
            </x-base.button>
        </div>
    @endcan

    <div class="grid grid-cols-2 md:grid-cols-3 gap-x-5 md:mx-2 xl:mx-0 p-5">
        <div class="bg-white shadow overflow-hidden md:rounded-lg col-span-2">
            <div class="border-t border-gray-200 py-5 px-4 sm:px-6 lg:px-8">
                <dl class="grid grid-cols-1 gap-x-4 gap-y-6 sm:grid-cols-2">
                    <div class="sm:col-span-1">
                        <dt class="text-sm font-medium text-gray-500">
                            {{ __('app.date') }}
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900">
                            <time datetime="{{ $competition->start_date->format('Y-m-d') }}">
                                {{ $competition->start_date->isoFormat('LL') }}
                            </time>
                            @if ($competition->end_date)
                                <x-heroicon-s-arrow-sm-right class="h-5 pb-0.5 inline mx-0.5"/>
                                <time datetime="{{ $competition->end_date->format('Y-m-d') }}">
                                    {{ $competition->end_date->isoFormat('LL') }}
                                </time>
                            @endif
                        </dd>
                    </div>
                    <div class="sm:col-span-1">
                        <dt class="text-sm font-medium text-gray-500">
                            {{ __('app.timekeeping') }}
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900">
                            <x-base.badge color="{{ $competition->timekeeping_color }}">
                                {{ $competition->timekeeping->description }}
                            </x-base.badge>
                        </dd>
                    </div>
                    @if ($competition->comment)
                        <div class="sm:col-span-2">
                            <dt class="text-sm font-medium text-gray-500">
                                Comment
                            </dt>
                            <dd class="mt-1 text-sm text-gray-900">
                                {!! $competition->comment !!}
                            </dd>
                        </div>
                    @endif
                    <div class="sm:col-span-2">
                        <dt class="text-sm font-medium text-gray-500">
                            {{ __('app.original_files') }}
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900">
                            <ul class="border border-gray-200 rounded-md divide-y divide-gray-200">
                                @forelse($competition->getMedia('files') as $file)
                                    <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                                        <div class="w-0 flex-1 flex items-center">
                                            <x-heroicon-s-paper-clip class="shrink-0 h-5 w-5 text-gray-400"/>
                                            <span class="ml-2 flex-1 w-0 truncate">
                                                {{ $file->file_name }}
                                            </span>
                                        </div>
                                        <div class="ml-4 shrink-0">
                                            @can('parse competitions')
                                                <a href="{{ route('competitions.parse', [$competition, $file]) }}"
                                                   class="font-medium text-blue-700 hover:text-blue-500 mr-4">Parse</a>
                                            @endcan
                                            <a href="{{ route('competitions.download', [$competition, $file]) }}"
                                               class="font-medium text-blue-700 hover:text-blue-500">
                                                {{ __('app.download') }}
                                            </a>
                                        </div>
                                    </li>
                                @empty
                                    <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                                        <div class="w-0 flex-1 flex items-center">
                                            <span class="ml-2 flex-1 w-0 truncate">
                                                There are no files available for this competition.
                                                Please contact me if you have the original files.
                                            </span>
                                        </div>
                                    </li>
                                @endforelse
                            </ul>
                        </dd>
                    </div>
                    <div class="sm:col-span-2">
                        <dt class="text-sm font-medium text-gray-500">
                            {{ __('app.videos') }}
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900">
                            <ul class="border border-gray-200 rounded-md divide-y divide-gray-200">
                                @forelse($competition->videos ?? [] as $video)
                                    <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                                        <div class="w-0 flex-1 flex items-center">
                                            <x-heroicon-s-video-camera class="shrink-0 h-5 w-5 text-gray-400"/>
                                            <span class="ml-2 flex-1 w-0 truncate">
                                            {{ $video['title'] }}
                                        </span>
                                        </div>
                                        <div class="ml-4 shrink-0">
                                            <a href="{{ $video['url'] }}" target="_blank"
                                               class="font-medium text-blue-700 hover:text-blue-500 flex items-center">
                                                <span class="mr-1 flex-1 truncate">{{ __('app.watch') }}</span>
                                                <x-heroicon-s-external-link class="shrink-0 h-4 w-4"/>
                                            </a>
                                        </div>
                                    </li>
                                @empty
                                    <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                                        <div class="w-0 flex-1 flex items-center">
                                            <span class="ml-2 flex-1 w-0 truncate">
                                                There are no videos available for this competition.
                                                Please contact me if you have any videos.
                                            </span>
                                        </div>
                                    </li>
                                @endforelse
                            </ul>
                        </dd>
                    </div>
                </dl>
            </div>
        </div>

        <div x-data="{ venueTab: '{{ $competition->venues->first()->type->value }}' }"
             class="bg-white shadow overflow-hidden md:rounded-lg col-span-2 md:col-span-1 mt-4 md:mt-0">
            <div>
                <nav class="relative z-0 shadow flex divide-x divide-gray-200" aria-label="Tabs">
                    @foreach($competition->venues as $venue)
                        <a @if($competition->venues->count() > 1)href="#" @endif aria-current="page"
                           @click.prevent="venueTab = '{{ $venue->type->value }}'"
                           :class="venueTab == '{{ $venue->type->value }}' ? 'text-gray-900' : 'text-gray-500'"
                           class="group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-6 text-sm font-medium text-center @if($competition->venues->count() > 1)hover:bg-gray-50 @endif focus:z-10">
                            <span>{{ $venue->type->description }}</span>
                            @php
                                $colorClass = match($venue->type_color ?? 'blue') {
                                    'amber' => 'bg-amber-500',
                                    'blue' => 'bg-blue-500',
                                    default => throw new Exception("Unknown color $colorClass, add it to competition.show component")
                                }
                            @endphp
                            <span aria-hidden="true"
                                  x-show="venueTab == '{{ $venue->type->value }}'"
                                  class="{{ $colorClass }} absolute inset-x-0 bottom-0 h-0.5">
                            </span>
                        </a>
                    @endforeach
                </nav>
            </div>
            <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
                @foreach($competition->venues as $venue)
                    <dl class="sm:divide-y sm:divide-gray-200" x-show="venueTab == '{{ $venue->type->value }}'">
                        <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                            <dt class="text-sm font-medium text-gray-500">
                                {{ __('app.name') }}
                            </dt>
                            <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                                {{ $venue->name }}
                            </dd>
                        </div>
                        <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                            <dt class="text-sm font-medium text-gray-500">
                                {{ __('app.country') }}
                            </dt>
                            <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2 flex items-center space-x-1">
                                <x-flag :country="$venue->country"/>
                                <span>
                                    {{ $venue->country_name }}
                                </span>
                            </dd>
                        </div>
                        <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                            <dt class="text-sm font-medium text-gray-500">
                                {{ __('app.city') }}
                            </dt>
                            <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                                {{ $venue->city }}
                            </dd>
                        </div>
                        @if($venue->pool_size)
                            <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                <dt class="text-sm font-medium text-gray-500">
                                    {{ __('app.pool_size') }}
                                </dt>
                                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                                    {{ $venue->pool_size_label }}
                                </dd>
                            </div>
                        @endif
                    </dl>
                @endforeach
            </div>
        </div>
    </div>

    @if(__('app.status_descriptions')[$competition->status->value] ?? false)
        <x-base.alert :color="$competition->status_color" class="mt-10 mx-5">
            <x-slot name="title">
                {{ __('app.status') }}: {{ $competition->status->description }}
            </x-slot>
            <x-slot name="body">
                {!! __('app.status_descriptions')[$competition->status->value] !!}
            </x-slot>
        </x-base.alert>
    @endif

    @if ($competition->is_published)
        <livewire:tables.events
            blade-template="competition"
            :event-type="\App\Enums\EventType::Pool()"
            :competition="$competition"
            :limit="3"
            :title="trans_choice('app.results', 2) . ' ' . strtolower(\App\Enums\Gender::Women()->description)"
            :gender="\App\Enums\Gender::Women()"/>

        <livewire:tables.events
            blade-template="competition"
            :event-type="\App\Enums\EventType::Pool()"
            :competition="$competition"
            :limit="3"
            :title="trans_choice('app.results', 2) . ' ' . strtolower(\App\Enums\Gender::Men()->description)"
            :gender="\App\Enums\Gender::Men()"/>
    @endif

@endsection
