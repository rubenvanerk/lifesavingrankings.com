@extends('layouts.app')

@section('title')
    Welcome to Lifesaving<wbr/>Rankings.com
@endsection

@section('subtitle')
    The <span class="text-yellow-300 font-extrabold">largest</span> lifesaving competition database
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
                                Athletes
                            </dt>
                            <dd class="order-1 text-5xl font-extrabold text-blue-800">
                                24K
                            </dd>
                        </div>
                        <div
                            class="flex flex-col border-t border-b border-gray-100 p-6 text-center sm:border-0 sm:border-l sm:border-r">
                            <dt class="order-2 mt-2 text-lg leading-6 font-medium text-gray-500">
                                Competitions
                            </dt>
                            <dd class="order-1 text-5xl font-extrabold text-blue-800">
                                204
                            </dd>
                        </div>
                        <div class="flex flex-col border-t border-gray-100 p-6 text-center sm:border-0 sm:border-l">
                            <dt class="order-2 mt-2 text-lg leading-6 font-medium text-gray-500">
                                Results
                            </dt>
                            <dd class="order-1 text-5xl font-extrabold text-blue-800">
                                250k
                            </dd>
                        </div>
                    </dl>
                </div>
            </div>
        </div>
    </div>


    <h2 class="max-w-7xl mx-auto mt-8 px-4 text-lg leading-6 font-medium text-gray-900 sm:px-6 lg:px-8">
        Filter any page
    </h2>

    <x-table :pagination="false"/>
    <x-table :pagination="false"/>
@endsection

