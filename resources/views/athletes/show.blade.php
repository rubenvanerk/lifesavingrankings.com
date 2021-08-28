@extends('layouts.app')

@section('title')
    {{ $athlete->name }}
@endsection

@section('content')
    <livewire:tables.events
        :athlete="$athlete->id"
        :event-type="\App\Enums\EventType::IndividualPool()"/>
@endsection
