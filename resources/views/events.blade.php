@extends('layouts.app')

@section('title')
    {{  trans_choice('app.events', 2) }}
@endsection

@section('content')
    <livewire:records-table :limit="3"/>
@endsection
