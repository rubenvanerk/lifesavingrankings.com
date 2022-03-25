@extends('layouts.app')

@php
    SEO::setTitle($athlete->name . ': ' . $event->name)
@endphp

@section('page-title')
    {{ $athlete->name }}: {{ $event->name }}
@endsection

@section('content')
    <livewire:tables.results
        blade-template="athlete"
        :athlete="$athlete"
        :event="$event"
        :valid="true"/>
@endsection
