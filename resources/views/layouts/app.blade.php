@extends('layouts.base')

@section('body')

    <x-menu />

    @yield('hero')

    <div class="max-w-7xl mx-auto">

        @yield('content')

        @isset($slot)
            {{ $slot }}
        @endisset
    </div>

    <x-footer />

@endsection
