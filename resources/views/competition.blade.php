@extends('layouts.app')

@section('title')
    World Championships Interclub Teams Open 2016 results
@endsection

@section('content')
    <div class="grid grid-cols-2 md:grid-cols-3 gap-x-5 md:mx-2 xl:mx-0">
        <div class="bg-white shadow overflow-hidden md:rounded-lg col-span-2">
            <div class="border-t border-gray-200 py-5 px-4 sm:px-6 lg:px-8">
                <dl class="grid grid-cols-1 gap-x-4 gap-y-6 sm:grid-cols-2">
                    <div class="sm:col-span-1">
                        <dt class="text-sm font-medium text-gray-500">
                            Date
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900">
                            <time datetime="2021-09-20">Sep 12 2016</time>
                            <x-heroicon-s-arrow-sm-right class="h-5 pb-0.5 inline mx-0.5"/>
                            <time datetime="2021-09-20">Sep 16 2016</time>
                        </dd>
                    </div>
                    <div class="sm:col-span-1">
                        <dt class="text-sm font-medium text-gray-500">
                            Timekeeping
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900">
                        <span
                            class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">
                          Electronic
                        </span>
                            <span
                                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                          By hand
                        </span>
                            <span
                                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800">
                              Unknown
                            </span>
                        </dd>
                    </div>
                    <div class="sm:col-span-2">
                        <dt class="text-sm font-medium text-gray-500">
                            Comment
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900">
                            Fugiat ipsum ipsum deserunt culpa aute sint do nostrud anim incididunt cillum culpa
                            consequat. Excepteur qui ipsum aliquip consequat sint. Sit id mollit nulla mollit nostrud in
                            ea officia proident.
                        </dd>
                    </div>
                    <div class="sm:col-span-2">
                        <dt class="text-sm font-medium text-gray-500">
                            Original files
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
                                            Download
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
                                            Download
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </dd>
                    </div>
                    <div class="sm:col-span-2">
                        <dt class="text-sm font-medium text-gray-500">
                            Videos
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
                                            <span class="mr-1 flex-1 truncate">Watch</span>
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
                                            <span class="mr-1 flex-1 truncate">Watch</span>
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

        <div x-data="{ venueTab: 'pool' }"
             class="bg-white shadow overflow-hidden md:rounded-lg col-span-2 md:col-span-1 mt-4 md:mt-0">
            <div>
                <nav class="relative z-0 shadow flex divide-x divide-gray-200" aria-label="Tabs">

                    <a href="#" aria-current="page"
                       @click.prevent="venueTab = 'pool'" :class="venueTab == 'pool' ? 'text-gray-900' : 'text-gray-500'"
                       class="group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-6 text-sm font-medium text-center hover:bg-gray-50 focus:z-10">
                        <span>Pool</span>
                        <span aria-hidden="true"
                              x-show="venueTab == 'pool'"
                              class="bg-blue-500 absolute inset-x-0 bottom-0 h-0.5">
                        </span>
                    </a>

                    <a href="#"
                       @click.prevent="venueTab = 'beach'" :class="venueTab == 'beach' ? 'text-gray-900' : 'text-gray-500'"
                       class="hover:text-gray-700 group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-6 text-sm font-medium text-center hover:bg-gray-50 focus:z-10">
                        <span>Beach</span>
                        <span aria-hidden="true"
                              x-show="venueTab == 'beach'"
                              class="bg-yellow-500 absolute inset-x-0 bottom-0 h-0.5">
                        </span>
                    </a>

                </nav>
            </div>
            <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
                <dl class="sm:divide-y sm:divide-gray-200" x-show="venueTab == 'pool'">
                    <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-500">
                            Name
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                            Pieter van den Hoogenband zwemstadion
                        </dd>
                    </div>
                    <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-500">
                            Country
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2 flex">
                            <img class="w-5 h-5 rounded-md mr-1"
                                 src="{{ url('/pragmarx/countries/flag/download/nld.svg') }}">
                            Netherlands
                        </dd>
                    </div>
                    <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-500">
                            City
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                            Eindhoven
                        </dd>
                    </div>
                    <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-500">
                            Pool size
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                            50m
                        </dd>
                    </div>
                </dl>
                <dl class="sm:divide-y sm:divide-gray-200" x-show="venueTab == 'beach'">
                    <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-500">
                            Name
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                            Noordwijk strand
                        </dd>
                    </div>
                    <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-500">
                            Country
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2 flex">
                            <img class="w-5 h-5 rounded-md mr-1"
                                 src="{{ url('/pragmarx/countries/flag/download/nld.svg') }}">
                            Netherlands
                        </dd>
                    </div>
                    <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                        <dt class="text-sm font-medium text-gray-500">
                            City
                        </dt>
                        <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                            Noordwijk
                        </dd>
                    </div>
                </dl>
            </div>
        </div>

    </div>

@endsection
