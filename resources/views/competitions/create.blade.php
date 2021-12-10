@extends('layouts.app')

@section('title')
    Add a competition
@endsection

@section('content')
    <div class="bg-white overflow-hidden shadow sm:rounded-lg sm:mx-6 lg:mx-8">
        <livewire:competitions.create/>
    </div>
@endsection
