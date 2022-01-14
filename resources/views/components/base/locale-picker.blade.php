<div x-data="{ localePicker: false }" @click.away="localePicker = false"
     class="relative inline-block text-left hidden lg:block lg:ml-4">
    <div>
        <button type="button"
                class="h-8 w-8 p-1 bg-blue-900 rounded-full text-sm text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-blue-600 focus:ring-white"
                id="menu-button" x-ref="button" @click="localePicker = ! localePicker"
                aria-expanded="true" aria-haspopup="true" x-bind:aria-expanded="localePicker.toString()">
            <span class="sr-only">Open languages</span>
            <span class="font-bold">{{ strtoupper(App::currentLocale()) }}</span>
        </button>
    </div>

    <div x-show="localePicker"
         x-transition:enter="transition ease-out duration-100"
         x-transition:enter-start="opacity-0 scale-95"
         x-transition:enter-end="opacity-100 scale-100"
         x-transition:leave="transition ease-in duration-75"
         x-transition:leave-start="opacity-100 scale-100"
         x-transition:leave-end="opacity-0 scale-95"
         class="origin-top-right absolute right-0 mt-2 w-44 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none"
         x-ref="menu-items"
         role="menu" aria-orientation="vertical"
         aria-labelledby="menu-button" tabindex="-1">
        <div class="py-1" role="none">
            @foreach(config('app.locales') as $localeCode => $locale)
                <a href="{{ route('set-locale', ['locale' => $localeCode]) }}" class="block px-4 py-2 text-sm text-gray-700 space-x-2 hover:bg-gray-100 {{ app()->getLocale() == $localeCode ? 'font-semibold' : '' }}" role="menuitem">
                    <span>{{ $locale['label'] }}</span>
                </a>
            @endforeach
            <hr class="my-2">
            <a href="https://poeditor.com/join/project?hash=6P7Ma7RAPw" target="_blank" class="block px-4 py-2 text-sm text-gray-700 flex items-center space-x-2 hover:bg-gray-100" role="menuitem">
                <span>{{ __('app.help_translating') }}</span>
                <x-heroicon-s-external-link class="h-4 w-4"/>
            </a>
        </div>
    </div>
</div>
