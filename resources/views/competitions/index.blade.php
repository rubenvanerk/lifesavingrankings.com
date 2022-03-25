@extends('layouts.app')

@php
    SEO::setTitle(trans_choice('app.competitions', 2));
@endphp

@section('page-title')
    {{ trans_choice('app.competitions', 2) }}
@endsection

@section('content')
    <div class="px-4 sm:px-6 lg:px-8">
        <x-base.button href="{{ route('competitions.create') }}">
            {{ __('app.add_competition') }}
        </x-base.button>
    </div>

    <livewire:competitions.index/>
@endsection
