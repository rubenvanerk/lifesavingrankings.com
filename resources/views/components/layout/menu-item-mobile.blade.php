@if ($active)
    <a href="{{ $url }}" class="bg-blue-900 text-white block rounded-md py-2 px-3 text-base font-medium hover:no-underline hover:text-white">
        {{ $slot }}
    </a>
@else
    <a href="{{ $url }}"
       class="text-white hover:bg-blue-700 hover:bg-opacity-75 block rounded-md py-2 px-3 text-base font-medium hover:no-underline hover:text-white">
        {{ $slot }}
    </a>
@endif
