@if (!empty($link))
    <li>
        <a href="{{ $link }}" class="block px-4 py-4 bg-white hover:bg-gray-50 focus:bg-gray-50">
            <span class="flex items-center space-x-4">
                <span class="flex-1 flex space-x-2 truncate">
                    {{ $icon ?? '' }}
                    <span class="flex flex-col text-gray-600 text-sm truncate w-full space-y-2">
                        {{ $slot }}
                    </span>
                </span>
                <x-heroicon-s-chevron-right class="shrink-0 h-5 w-5 text-gray-400"/>
            </span>
        </a>
    </li>
@else
    <li>
        <span class="block px-4 py-4 bg-white">
            <span class="flex items-center space-x-4">
                <span class="flex-1 flex space-x-2 truncate">
                    {{ $icon ?? '' }}
                    <span class="flex flex-col text-gray-600 text-sm truncate w-full space-y-2">
                        {{ $slot }}
                    </span>
                </span>
            </span>
        </span>
    </li>
@endif
