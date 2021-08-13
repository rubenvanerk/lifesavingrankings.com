@extends('layouts.app')

@section('title')
    Competitions
@endsection

@section('content')
    <ul>
        @foreach($competitions as $competition)
            <li><a href="{{ route('competitions.show', [$competition]) }}">{{ $competition->name }}</a></li>
        @endforeach
    </ul>
@endsection
