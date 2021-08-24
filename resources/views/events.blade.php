@extends('layouts.app')

@section('title')
    {{  trans_choice('app.events', 2) }}
@endsection

@section('breadcrumbs')
    {{ Breadcrumbs::render('events') }}
@endsection

@section('meta-breadcrumbs')
    {{ Breadcrumbs::view('breadcrumbs::json-ld', 'events') }}
@endsection

@section('content')
    <livewire:records-table :limit="3"/>
@endsection
