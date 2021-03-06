@extends('layouts.app')

@php
    SEO::setTitle('LifesavingRankings.com: the largest lifesaving results database', false);
@endphp

@section('page-title')
    {!! config('app.name') !!}
@endsection

@section('page-subtitle')
    {!! __('app.tagline', ['style_open' => '<span class="text-amber-300 font-extrabold">', 'style_close' => '</span>']) !!}
@endsection

@section('meta-breadcrumbs')
    {{ Breadcrumbs::view('breadcrumbs::json-ld', 'home') }}
@endsection

@section('content')
    <x-home.stats/>

    <livewire:tables.events
        blade-template="home"
        :event-type="\App\Enums\EventType::IndividualPool()"
        :gender="\App\Enums\Gender::Women()"
        :title="__('app.world') . ' ' . __('app.records') . ' ' . strtolower(\App\Enums\Gender::Women()->description)"
        :title-filtered="__('app.records') . ' ' . strtolower(\App\Enums\Gender::Women()->description)"/>

    <livewire:tables.events
        blade-template="home"
        :event-type="\App\Enums\EventType::IndividualPool()"
        :gender="\App\Enums\Gender::Men()"
        :title="__('app.world') . ' ' . __('app.records') . ' ' . strtolower(\App\Enums\Gender::Men()->description)"
        :title-filtered="__('app.records') . ' ' . strtolower(\App\Enums\Gender::Women()->description)"/>

    <x-home.call-to-action/>
@endsection
