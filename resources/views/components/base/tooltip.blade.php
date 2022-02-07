<div x-data="{ tooltip: false }" x-cloak>
    <span @mouseenter="tooltip = true" @click="tooltip = ! tooltip" @mouseleave="tooltip = false" @click.away="tooltip = false">
        {{ $slot }}
    </span>
    <span x-show="tooltip" x-transition
          class="absolute px-3 py-0.5 rounded-full text-sm font-medium bg-gray-100 text-gray-800 -mt-12 -ml-4">
        {{ $title }}
    </span>
</div>
