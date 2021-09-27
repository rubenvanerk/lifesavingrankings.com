@if ($active)
    <a href="{{ $url }}" class="bg-blue-900 text-white rounded-md py-2 px-3 text-sm font-medium transition ease-in-out duration-150">
        {{ $slot }}
    </a>
@else
    <a href="{{ $url }}"
       class="text-white hover:bg-blue-700 hover:bg-opacity-75 rounded-md py-2 px-3 text-sm font-medium transition ease-in-out duration-150">
        {{ $slot }}
    </a>
@endif

