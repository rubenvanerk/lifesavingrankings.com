@extends('layouts.app')

@php
    SEO::setTitle(trans_choice('app.events', 2))
@endphp

@section('page-title')
    {{ trans_choice('app.events', 2) }}
@endsection

@section('content')
    {{-- TODO: add titles --}}
    {{-- TODO: show only 1 result per athlete --}}
    <livewire:tables.events
        blade-template="events"
        :title="__('app.world') . ' ' . __('app.records') . ' ' . strtolower(\App\Enums\Gender::Women()->description)"
        :limit="1"
        :event-type="\App\Enums\EventType::Pool()"
        :gender="\App\Enums\Gender::Women()"/>

    <livewire:tables.events
        blade-template="events"
        :title="__('app.world') . ' ' . __('app.records') . ' ' . strtolower(\App\Enums\Gender::Men()->description)"
        :limit="1"
        :event-type="\App\Enums\EventType::Pool()"
        :gender="\App\Enums\Gender::Men()"/>
@endsection
