<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" data-theme="lsr">
    <head>
        @include('layouts.partials.meta')

        <!-- Favicon -->
		<link rel="shortcut icon" href="{{ url(asset('favicon.ico')) }}">
        <link rel="icon" type="image/svg+xml" href="{{ url(asset('favicon.svg')) }}">
        <link rel="icon" type="image/png" href="{{ url(asset('favicon.png')) }}">

        <!-- Fonts -->
        <link rel="stylesheet" href="https://rsms.me/inter/inter.css">

        <!-- Styles -->
        <link rel="stylesheet" href="{{ url(mix('css/app.css')) }}">
        @livewireStyles

        <!-- Scripts -->
        <script src="{{ url(mix('js/app.js')) }}" defer></script>
        <script defer data-domain="new.lifesavingrankings.com" src="https://plausible.wrve.nl/js/script.js"></script>

        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">

        {{ Breadcrumbs::view('breadcrumbs::json-ld') }}

        @if (request()->routeIs('home'))
            <script type="application/ld+json">
            {
              "@context": "https://schema.org",
              "@type": "WebSite",
              "url": "{{ url('/') }}",
              "potentialAction": {
                "@type": "SearchAction",
                "target": {
                  "@type": "EntryPoint",
                  "urlTemplate": "{{ route('search') }}?query={search_term_string}"
                },
                "query-input": "required name=search_term_string"
              }
            }
            </script>
        @endif

    </head>

    <body>
        @yield('body')

        @livewireScripts
        @livewire('livewire-ui-modal')
    </body>
</html>
