@extends('layouts.base')

@section('body')
    <div class="min-h-screen bg-gray-100" wire:loading.class="cursor-wait">
        <div class="bg-blue-800 pb-24 mb-6">
            <x-layout.menu/>

            <header class="py-10">
                @hasSection('title')
                    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                        <h1 class="text-3xl font-bold text-white">
                            @yield('title')
                        </h1>

                        @hasSection('subtitle')
                            <h2 class="text-xl font-bold text-white mt-3">@yield('subtitle')</h2>
                        @endif

                        {{ Breadcrumbs::render() }}
                    </div>
                @endif
            </header>
        </div>

        <main class="-mt-32">
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
