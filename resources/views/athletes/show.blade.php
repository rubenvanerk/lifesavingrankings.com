@extends('layouts.app')

@section('title')
    {{ $athlete->name }}
@endsection

@section('content')
    <livewire:records-table :athlete="$athlete->id"/>
@endsection
