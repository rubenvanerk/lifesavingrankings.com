<div x-data="{ tooltip: false }">
    <span x-on:mouseenter="tooltip = true" x-on:mouseleave="tooltip = false">
        {{ $slot }}
    </span>
    <span x-show="tooltip" x-transition
          class="absolute px-3 py-0.5 rounded-full text-sm font-medium bg-gray-100 text-gray-800 -mt-12 -ml-4">
        {{ $title }}
    </span>
</div>
