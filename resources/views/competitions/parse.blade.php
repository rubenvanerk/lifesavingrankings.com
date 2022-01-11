@extends('layouts.app')

@section('title')
    Parsing {{ $competition->name }}
@endsection

@section('wide-content')
    <div class="md:mx-2 xl:mx-0 p-5">
        <livewire:competitions.parse :media="$media"/>
    </div>
@endsection
