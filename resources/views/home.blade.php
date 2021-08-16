@extends('layouts.app')

@section('title')
    {!! __('app.welcome', ['html' => '<wbr/>']) !!}
@endsection

@section('subtitle')
    {!! __('app.tagline', ['style_open' => '<span class="text-yellow-300 font-extrabold">', 'style_close' => '</span>']) !!}
@endsection

@section('content')
    <div class="mt-8 pb-6 sm:pb-8">
        <div class="relative">
            <div class="absolute inset-0 h-1/2"></div>
            <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="max-w-4xl mx-auto">
                    <dl class="rounded-lg bg-white shadow-lg sm:grid sm:grid-cols-3">
                        <div class="flex flex-col border-b border-gray-100 p-6 text-center sm:border-0 sm:border-r">
                            <dt class="order-2 mt-2 text-lg leading-6 font-medium text-gray-500">
                                {{ trans_choice('app.athletes', 2) }}
                            </dt>
                            <dd class="order-1 text-5xl font-extrabold text-blue-800">
                                24K
                            </dd>
                        </div>
                        <div
                            class="flex flex-col border-t border-b border-gray-100 p-6 text-center sm:border-0 sm:border-l sm:border-r">
                            <dt class="order-2 mt-2 text-lg leading-6 font-medium text-gray-500">
                                {{ trans_choice('app.competitions', 2) }}
                            </dt>
                            <dd class="order-1 text-5xl font-extrabold text-blue-800">
                                204
                            </dd>
                        </div>
                        <div class="flex flex-col border-t border-gray-100 p-6 text-center sm:border-0 sm:border-l">
                            <dt class="order-2 mt-2 text-lg leading-6 font-medium text-gray-500">
                                {{ trans_choice('app.results', 2) }}
                            </dt>
                            <dd class="order-1 text-5xl font-extrabold text-blue-800">
                                250K
                            </dd>
                        </div>
                    </dl>
                </div>
            </div>
        </div>
    </div>

    <h3 class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-2xl font-extrabold text-gray-900 tracking-tight sm:text-3xl mt-8">
        <span class="text-yellow-500">{{ ucfirst(__('app.filtered')) }}</span> {{ __('app.records') }} {{ __('app.women') }}
    </h3>

    <x-table :pagination="false"/>

    <h3 class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-2xl font-extrabold text-gray-900 tracking-tight sm:text-3xl mt-8">
        {{ ucfirst(__('app.world')) }} {{ __('app.records') }} {{ __('app.men') }}
    </h3>

    <x-table :pagination="false"/>

    <div class="max-w-7xl mx-auto py-16 px-4 sm:px-6 lg:px-8">
        <div class="bg-blue-800 rounded-lg shadow-xl overflow-hidden lg:grid lg:grid-cols-2 lg:gap-4">
            <div class="pt-10 pb-12 px-6 sm:pt-16 sm:px-16 lg:py-16 lg:pr-0 xl:py-20 xl:px-20">
                <div class="lg:self-center">
                    <h2 class="text-3xl font-extrabold text-white sm:text-4xl">
                        <span class="block">{{ __('app.call_to_action.missing_a_result') }}</span>
                        <span class="block">{{ __('app.call_to_action.let_me_know') }}</span>
                    </h2>
                    <p class="mt-4 text-lg leading-6 text-blue-200">
                        {!! __('app.call_to_action.are_you_missing_a_result', ['break' => '<br>']) !!}
                    </p>
                    <a href="#"
                       class="mt-8 bg-white border border-transparent rounded-md shadow px-5 py-3 inline-flex items-center text-base font-medium text-gray-900 hover:bg-blue-50">
                        {{ __('app.call_to_action.add_competition') }}
                    </a>
                </div>
            </div>
            <div class="bg-white p-6 sm:p-8 lg:p-12 overflow-hidden">
                <x-home.competition-feed/>
            </div>
        </div>
    </div>

@endsection

