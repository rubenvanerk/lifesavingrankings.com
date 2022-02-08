<div wire:ignore wire:init="search">
    <form method="get" action="{{ route('search') }}">
        <label for="search" class="sr-only">{{ __('app.search') }}</label>
        <div class="relative text-gray-400 focus-within:text-gray-600">
            <div class="pointer-events-none absolute inset-y-0 left-0 pl-3 flex items-center">
                <x-heroicon-s-search class="h-5 w-5"/>
            </div>
            <input id="search"
                   class="block w-full bg-white py-2 pl-10 pr-3 border border-transparent rounded-md leading-5 text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-blue-600 focus:ring-amber-300 focus:border-white sm:text-sm"
                   placeholder="{{ __('app.search') }}..." type="search" name="query" @if(request()->routeIs('search')) wire:model="query" @endif>
        </div>
    </form>
</div>

