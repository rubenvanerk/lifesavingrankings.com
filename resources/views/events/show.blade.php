@extends('layouts.app')

@php
    SEO::setTitle($event->name . ' ' . strtolower($gender->description));
@endphp

@section('page-title')
    {{ $event->name }} {{ strtolower($gender->description) }}
@endsection

@section('content')
    <livewire:tables.results
        blade-template="event"
        :event="$event"
        :gender="$gender"
        :valid="true"/>
@endsection
