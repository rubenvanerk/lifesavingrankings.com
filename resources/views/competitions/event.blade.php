@extends('layouts.app')

@section('title')
    {{ $event->name }} {{ strtolower($gender->description) }} at {{ $competition->name }}
@endsection

@section('content')
    <livewire:tables.results
        blade-template="competition"
        :competition="$competition"
        :event="$event"
        :gender="$gender"/>
@endsection
