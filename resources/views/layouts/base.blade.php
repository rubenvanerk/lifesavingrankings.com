<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" data-theme="lsr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        @hasSection('title')
            @hasSection('meta-title')
                <title>@yield('meta-title') | {{ config('app.name') }}</title>
            @else
                <title>@yield('title') | {{ config('app.name') }}</title>
            @endif
        @else
            <title>{{ config('app.name') }}</title>
        @endif

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
    </body>
</html>
