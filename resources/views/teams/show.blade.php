@extends('layouts.app')

@section('title')
    {{ $team->name }}
@endsection

@section('content')
    <livewire:tables.events
        :event-type="\App\Enums\EventType::IndividualPool()"
        :team="$team"
        :limit="3"
        :title="trans_choice('app.teams', 1) . ' ' . trans_choice('app.records', 2) . ' ' . strtolower(\App\Enums\Gender::Women()->description)"
        :gender="\App\Enums\Gender::Women()"/>

    <livewire:tables.events
        :event-type="\App\Enums\EventType::IndividualPool()"
        :team="$team"
        :limit="3"
        :title="trans_choice('app.teams', 1) . ' ' . trans_choice('app.records', 2) . ' ' . strtolower(\App\Enums\Gender::Men()->description)"
        :gender="\App\Enums\Gender::Men()"/>
@endsection
