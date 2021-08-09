<div class="fixed inset-x-0 bottom-0 max-w-7xl mx-auto" x-data="{ open: false }" >
    <button @click.away="open = false" @click="open = ! open" type="button" class="absolute z-10 bottom-0 right-0 block transform -translate-y-10 -translate-x-10 inline-flex items-center p-2 border border-transparent rounded-full shadow-sm text-white bg-yellow-500 hover:bg-yellow-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500">
        <template x-if="open">
            <x-heroicon-s-x class="h-12 w-12 p-2"/>
        </template>
        <template x-if="!open">
            <x-heroicon-s-filter class="h-12 w-12 p-2"/>
        </template>
        <span
            class="absolute top-0 right-0 block h-5 w-5 rounded-full ring-2 ring-white bg-blue-800 text-sm font-semibold" @load="">
            3
        </span>
    </button>

    <div class="bg-blue-800 rounded-lg rounded-b-none" id="filter" x-show="open"
         x-transition:enter="transition ease-in-out duration-300"
         x-transition:enter-start="opacity-0 transform scale-y-0 translate-y-1/2"
         x-transition:enter-end="opacity-100 transform scale-y-100 translate-y-0"
         x-transition:leave="transition ease-in-out duration-300"
         x-transition:leave-start="opacity-100 transform scale-y-100 translate-y-0"
         x-transition:leave-end="opacity-0 transform scale-y-0 translate-y-1/2">

        <div class="pt-10 pb-12 px-6 sm:pt-16 sm:px-10 lg:py-12 lg:pr-0 xl:py-14 xl:px-12">
            <div class="text-white font-semibold">

            </div>
        </div>
    </div>
</div>
