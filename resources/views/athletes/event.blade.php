@extends('layouts.app')

@section('title')
    {{ $athlete->name }} {{ $event->name }}
@endsection

@section('content')
    <livewire:tables.results
        :athlete="$athlete"
        :event="$event"
        :valid="true"/>
@endsection
