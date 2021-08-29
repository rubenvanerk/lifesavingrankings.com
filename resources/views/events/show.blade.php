@extends('layouts.app')

@section('title')
    {{ $event->name }} {{ strtolower($gender->description) }}
@endsection

@section('content')
    <livewire:tables.results
        :event="$event"
        :gender="$gender"/>
@endsection
