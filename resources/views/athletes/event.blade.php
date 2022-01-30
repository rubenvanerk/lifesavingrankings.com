@extends('layouts.app')

@section('title')
    {{ $athlete->name }} {{ $event->name }}
@endsection

@section('content')
    <livewire:tables.results
        blade-template="athlete"
        :athlete="$athlete"
        :event="$event"
        :valid="true"/>
@endsection
