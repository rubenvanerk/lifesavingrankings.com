@extends('layouts.app')

@section('title')
    {{ $athlete->name }}
@endsection

@section('content')
    <livewire:tables.events
        :athlete="$athlete"
        :event-type="\App\Enums\EventType::IndividualPool()"/>
@endsection
