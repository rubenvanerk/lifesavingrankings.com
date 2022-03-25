@extends('layouts.app')

@php
    SEO::setTitle($competition->name . ': ' . $event->name . ' ' . strtolower($gender->description))
@endphp

@section('page-title')
    {{ $competition->name }}: {{ $event->name }} {{ strtolower($gender->description) }}
@endsection

@section('content')
    <livewire:tables.results
        blade-template="competition"
        :competition="$competition"
        :event="$event"
        :gender="$gender"/>
@endsection
