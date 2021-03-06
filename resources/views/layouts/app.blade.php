@extends('layouts.base')

@section('body')
    <div class="min-h-screen bg-gray-100">
        <div class="bg-gradient-to-b from-blue-800 to-blue-900 pb-24 mb-6">
            <x-layout.menu/>

            <header class="py-10">
                @hasSection('page-title')
                    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                        <h1 class="text-3xl font-bold text-white">
                            @yield('page-title')
                        </h1>

                        @hasSection('page-subtitle')
                            <h2 class="text-xl font-bold text-white mt-3">@yield('page-subtitle')</h2>
                        @endif

                        @if(!request()->routeIs('home'))
                            {{ Breadcrumbs::render() }}
                        @endif
                    </div>
                @endif
            </header>
        </div>

        <main class="-mt-32">
            @yield('wide-content')
            <div class="max-w-7xl mx-auto pb-12">
                @yield('content')

                @isset($slot)
                    {{ $slot }}
                @endisset
            </div>
        </main>
    </div>

    @if($filter ?? false)
        @livewire('filter')
    @endif

    <x-layout.footer/>
@endsection
