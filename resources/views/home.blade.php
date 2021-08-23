@extends('layouts.app')

@section('title')
    {!! __('app.welcome', ['html' => '<wbr/>']) !!}
@endsection

@section('meta-title')
    Home
@endsection

@section('subtitle')
    {!! __('app.tagline', ['style_open' => '<span class="text-yellow-300 font-extrabold">', 'style_close' => '</span>']) !!}
@endsection

@section('content')
    <x-home.stats/>

    @livewire('records-table')

    <x-home.call-to-action/>
@endsection
