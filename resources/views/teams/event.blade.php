@extends('layouts.app')

@php
    SEO::setTitle($team->name . ': ' . $event->name . ' ' . strtolower($gender->description))
@endphp

@section('page-title')
    {{ $team->name }}: {{ $event->name }} {{ strtolower($gender->description) }}
@endsection

@section('content')
    <livewire:tables.results
        blade-template="team"
        :team="$team"
        :event="$event"
        :gender="$gender"
        :valid="true"/>
@endsection
