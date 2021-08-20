@extends('layouts.app')

@section('title')
    {{ $competition->name }} {{ strtolower(trans_choice('app.results', '2')) }}
@endsection

@section('content')
    <div class="grid grid-cols-2 md:grid-cols-3 gap-x-5 md:mx-2 xl:mx-0">
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
                                <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                                    <div class="w-0 flex-1 flex items-center">
                                        <x-heroicon-s-paper-clip class="flex-shrink-0 h-5 w-5 text-gray-400"/>
                                        <span class="ml-2 flex-1 w-0 truncate">
                                            2021-orangecup-day-1.pdf
                                        </span>
                                    </div>
                                    <div class="ml-4 flex-shrink-0">
                                        <a href="#" class="font-medium text-blue-700 hover:text-blue-500">
                                            {{ __('app.download') }}
                                        </a>
                                    </div>
                                </li>
                                <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                                    <div class="w-0 flex-1 flex items-center">
                                        <x-heroicon-s-paper-clip class="flex-shrink-0 h-5 w-5 text-gray-400"/>
                                        <span class="ml-2 flex-1 w-0 truncate">
                                            2021-orangecup-day-2.pdf
                                        </span>
                                    </div>
                                    <div class="ml-4 flex-shrink-0">
                                        <a href="#" class="font-medium text-blue-700 hover:text-blue-500">
                                            {{ __('app.download') }}
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </dd>
                    </div>
                    <div class="sm:col-span-2">
                        <dt class="text-sm font-medium text-gray-500">
                            {{ __('app.videos') }}
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900">
                            <ul class="border border-gray-200 rounded-md divide-y divide-gray-200">
                                <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                                    <div class="w-0 flex-1 flex items-center">
                                        <x-heroicon-s-video-camera class="flex-shrink-0 h-5 w-5 text-gray-400"/>
                                        <span class="ml-2 flex-1 w-0 truncate">
                                            Day 1
                                        </span>
                                    </div>
                                    <div class="ml-4 flex-shrink-0">
                                        <a href="#"
                                           class="font-medium text-blue-700 hover:text-blue-500 flex items-center">
                                            <span class="mr-1 flex-1 truncate">{{ __('app.watch') }}</span>
                                            <x-heroicon-s-external-link class="flex-shrink-0 h-4 w-4"/>
                                        </a>
                                    </div>
                                </li>
                                <li class="pl-3 pr-4 py-3 flex items-center justify-between text-sm">
                                    <div class="w-0 flex-1 flex items-center">
                                        <x-heroicon-s-video-camera class="flex-shrink-0 h-5 w-5 text-gray-400"/>
                                        <span class="ml-2 flex-1 w-0 truncate">
                                            Day 2
                                        </span>
                                    </div>
                                    <div class="ml-4 flex-shrink-0">
                                        <a href="#"
                                           class="font-medium text-blue-700 hover:text-blue-500 flex items-center">
                                            <span class="mr-1 flex-1 truncate">{{ __('app.watch') }}</span>
                                            <x-heroicon-s-external-link class="flex-shrink-0 h-4 w-4"/>
                                        </a>
                                    </div>
                                </li>
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
                            <span aria-hidden="true"
                                  x-show="venueTab == '{{ $venue->type->value }}'"
                                  class="bg-{{ $venue->type_color }}-500 absolute inset-x-0 bottom-0 h-0.5">
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
                                <x-dynamic-component :component="'flag-4x3-' . strtolower($venue->country_code)"
                                                     class="h-3.5 flex-none"/>
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
        <x-base.alert :color="$competition->status_color" class="mt-10">
            <x-slot name="title">
                {{ __('app.status') }}: {{ $competition->status->description }}
            </x-slot>
            <x-slot name="body">
                {!! __('app.status_descriptions')[$competition->status->value] !!}
            </x-slot>
        </x-base.alert>
    @endif

@endsection
