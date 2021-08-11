<div class="fixed inset-x-0 bottom-0 max-w-7xl mx-auto pb-6" x-data="{ open: false }" @click.away="open = false">
    <button type="button" title="Filter"
            @click="open = ! open"
            class="absolute z-10 bottom-0 right-0 block transform -translate-y-10 -translate-x-10 inline-flex items-center p-2 border border-transparent rounded-full text-white bg-yellow-500 hover:bg-yellow-600 focus:outline-none shadow-2xl">
        <template x-if="open">
            <x-heroicon-s-check class="h-12 w-12 p-2"/>
        </template>
        <template x-if="!open">
            <x-heroicon-s-filter class="h-12 w-12 p-2"/>
        </template>
        <span
            class="absolute top-0 right-0 block h-5 w-5 rounded-full ring-2 ring-white bg-blue-800 text-sm font-semibold">
            3
        </span>
    </button>

    <div class="bg-blue-800 rounded-lg shadow-2xl border-2 border-blue-900" x-show="open"
         x-transition:enter="transition ease-in-out duration-300"
         x-transition:enter-start="opacity-0 transform scale-y-0 translate-y-64"
         x-transition:enter-end="opacity-100 transform scale-y-100 translate-y-0"
         x-transition:leave="transition ease-in-out duration-300"
         x-transition:leave-start="opacity-100 transform scale-y-100 translate-y-0"
         x-transition:leave-end="opacity-0 transform scale-y-0 translate-y-64">

        <div class="py-4 px-6">
            <h2 class="text-lg text-white font-bold">Filter results on this page</h2>
        </div>
    </div>
</div>
