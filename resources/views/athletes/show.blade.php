@extends('layouts.app')

@section('title')
    {{ $athlete->name }}
@endsection

@section('content')
    @can('edit athletes')
        <div class="px-4 sm:px-6 lg:px-8">
            <x-base.button href="/admin/athletes/{{ $athlete->id }}/edit"> {{-- TODO: use route generator --}}
                Edit
            </x-base.button>
        </div>
    @endcan

    <div class="mt-8 max-w-3xl mx-auto grid grid-cols-1 gap-6 sm:px-6 lg:max-w-7xl">
        <div class="space-y-6">
            <!-- Description list-->
            <section aria-labelledby="applicant-information-title">
                <div class="bg-white shadow sm:rounded-lg">
                    <div class="px-4 py-5 sm:px-6">
                        <h2 id="applicant-information-title" class="text-lg leading-6 font-medium text-gray-900">
                            {{ $athlete->name }}
                        </h2>
                        <p class="mt-1 max-w-2xl text-sm text-gray-500 flex space-x-2">
                            @if ($athlete->gender == \App\Enums\Gender::Men())
                                <x-tabler-mars class="h-5 w-5"/>
                            @else
                                <x-tabler-venus class="h-5 w-5"/>
                            @endif
                            <span>{{ $athlete->year_of_birth }}</span>
                            @foreach($athlete->nationalities as $nationality)
                                <x-flag :country="$nationality" class="shrink-0 h-3.5 rounded shadow mt-1"/>
                            @endforeach
                        </p>
                    </div>
                    <div class="border-t border-gray-200 px-4 py-5 sm:px-6">
                        <dl class="grid grid-cols-1 gap-x-4 gap-y-8 sm:grid-cols-3">
                            <div class="sm:col-span-1">
                                <dt class="text-sm font-medium text-gray-500">
                                    Total recorded competitions
                                </dt>
                                <dd class="mt-1 text-sm text-gray-900">
                                    {{ $athlete->competitions_count ?: '?' }}
                                </dd>
                            </div>
                            <div class="sm:col-span-1">
                                <dt class="text-sm font-medium text-gray-500">
                                    Total recorded results
                                </dt>
                                <dd class="mt-1 text-sm text-gray-900">
                                    {{ $athlete->results_count }}
                                </dd>
                            </div>
                            <div class="sm:col-span-1">
                                <dt class="text-sm font-medium text-gray-500">
                                    Last team
                                </dt>
                                <dd class="mt-1 text-sm text-gray-900">
                                    {{ $athlete->last_team->name }}
                                </dd>
                            </div>
                        </dl>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <livewire:tables.events
        blade-template="athlete"
        :athlete="$athlete"
        :event-type="\App\Enums\EventType::IndividualPool()"/>
@endsection
