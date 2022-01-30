@extends('layouts.app')

@section('title')
    {{  trans_choice('app.events', 2) }}
@endsection

@section('content')
    {{-- TODO: add titles --}}
    {{-- TODO: show only 1 result per athlete --}}
    <livewire:tables.events
        blade-template="events"
        :limit="1"
        :event-type="\App\Enums\EventType::Pool()"
        :gender="\App\Enums\Gender::Women()"/>

    <livewire:tables.events
        blade-template="events"
        :limit="1"
        :event-type="\App\Enums\EventType::Pool()"
        :gender="\App\Enums\Gender::Men()"/>
@endsection
