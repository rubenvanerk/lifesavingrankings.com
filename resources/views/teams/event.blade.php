@extends('layouts.app')

@section('title')
    {{ $team->name }} {{ $event->name }} {{ strtolower($gender->description) }}
@endsection

@section('content')
    <livewire:tables.results
        :team="$team"
        :event="$event"
        :gender="$gender"/>
@endsection
