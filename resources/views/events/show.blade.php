@extends('layouts.app')

@section('title')
    {{ $event->name }} {{ strtolower($gender->description) }}
@endsection

@section('content')
    <livewire:tables.results
        blade-template="event"
        :event="$event"
        :gender="$gender"
        :valid="true"/>
@endsection
