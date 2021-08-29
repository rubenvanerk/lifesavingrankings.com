@extends('layouts.app')

@section('title')
    {{ trans_choice('app.teams', 2) }}
@endsection

@section('content')
    <livewire:teams.index/>
@endsection
