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

    <livewire:tables.events
        blade-template="athlete"
        :athlete="$athlete"
        :event-type="\App\Enums\EventType::IndividualPool()"/>
@endsection
