@extends('layouts.app')

@section('title')
    {{ trans_choice('app.competitions', 2) }}
@endsection

@section('content')
    <ul>
        @foreach($competitions as $competition)
            <li><a href="{{ route('competitions.show', [$competition]) }}">{{ $competition->name }}</a></li>
        @endforeach
    </ul>
@endsection
