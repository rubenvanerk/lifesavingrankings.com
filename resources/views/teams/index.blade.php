@extends('layouts.app')

@php
    SEO::setTitle(trans_choice('app.teams', 2))
@endphp

@section('page-title')
    {{ trans_choice('app.teams', 2) }}
@endsection

@section('content')
    <livewire:teams.index/>
@endsection
