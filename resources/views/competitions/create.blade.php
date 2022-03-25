@extends('layouts.app')

@php
    SEO::setTitle(__('app.add_competition'))
@endphp

@section('page-title')
    {{ __('app.add_competition') }}
@endsection

@section('content')
    <div class="bg-white overflow-hidden shadow sm:rounded-lg sm:mx-6 lg:mx-8">
        <livewire:competitions.create/>
    </div>
@endsection
