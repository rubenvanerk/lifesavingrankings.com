@extends('layouts.app')

@section('title')
    Parsing {{ $competition->name }} {{ strtolower(trans_choice('app.results', '2')) }}
@endsection

@section('content')
    <div class="md:mx-2 xl:mx-0 p-5">
        <div class="bg-white shadow overflow-hidden md:rounded-lg">
            <div class="border-t border-gray-200 py-5 px-4 sm:px-6 lg:px-8">
                <span class="font-bold tracking-wider text-xl">
                    So it begins
                </span>
            </div>
        </div>
    </div>
@endsection
