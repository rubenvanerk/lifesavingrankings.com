@extends('layouts.app')

@section('title')
    {{ trans_choice('app.competitions', 2) }}
@endsection

@section('content')
    <livewire:competitions.index/>
@endsection
