@extends('layouts.app')

@php
    SEO::setTitle($team->name)
@endphp

@section('page-title')
    {{ $team->name }}
@endsection

@section('content')
    <livewire:tables.events
        blade-template="team"
        :event-type="\App\Enums\EventType::Pool()"
        :team="$team"
        :limit="1"
        :title="trans_choice('app.teams', 1) . ' ' . trans_choice('app.records', 2) . ' ' . strtolower(\App\Enums\Gender::Women()->description)"
        :gender="\App\Enums\Gender::Women()"/>

    <livewire:tables.events
        blade-template="team"
        :event-type="\App\Enums\EventType::Pool()"
        :team="$team"
        :limit="1"
        :title="trans_choice('app.teams', 1) . ' ' . trans_choice('app.records', 2) . ' ' . strtolower(\App\Enums\Gender::Men()->description)"
        :gender="\App\Enums\Gender::Men()"/>
@endsection
