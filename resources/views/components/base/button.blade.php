@php
    $type = empty($attributes['href']) ? 'button' : 'a';
@endphp

<{{ $type }} {{ $attributes->merge([
    'class' => 'inline-flex items-center px-3 py-2 border border-transparent shadow-sm text-sm leading-4 font-medium rounded-md text-white bg-amber-500 hover:bg-amber-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500 transition',
    'type' => 'button',
]) }}>
    @if (!empty($icon))
        <x-dynamic-component :component="'heroicon-' . $icon" class="-ml-0.5 mr-2 h-4 w-4" />
    @endif
    {{ $slot }}
</{{ $type }}>
