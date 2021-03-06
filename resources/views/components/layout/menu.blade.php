<nav class="border-b border-blue-300 border-opacity-25 lg:border-none" x-data="{ open: false }">
    <div class="max-w-7xl mx-auto px-2 sm:px-4 lg:px-8">
        <div
            class="relative h-16 flex items-center justify-between lg:border-b lg:border-blue-400 lg:border-opacity-25">
            <div class="px-2 flex items-center lg:px-0">
                <div class="shrink-0">
                    <a href="{{ url('/') }}" class="flex space-x-2 group">
                        <x-logo class="block h-8 w-8 text-white group-hover:text-gray-200 transition"/>
                        <span
                            class="text-white font-bold tracking-wide leading-4 group-hover:text-gray-200 transition hidden sm:block">
                            Lifesaving<br/>Rankings {{-- TODO: vertically align text --}}
                        </span>
                    </a>
                </div>
                <div class="hidden lg:block lg:ml-10">
                    <div class="flex space-x-4">
                        <x-layout.menu-item :active="request()->routeIs('competitions.*')"
                                            :url="route('competitions.index')">
                            {{ trans_choice('app.competitions', 2) }}
                        </x-layout.menu-item>
                        <x-layout.menu-item :active="request()->routeIs('events.*')" :url="route('events.index')">
                            {{ trans_choice('app.events', 2) }}
                        </x-layout.menu-item>
                        <x-layout.menu-item :active="request()->routeIs('teams.*')" :url="route('teams.index')">
                            {{ trans_choice('app.teams', 2) }}
                        </x-layout.menu-item>
                    </div>
                </div>
            </div>
            <div class="flex-1 px-2 flex justify-center lg:ml-6 lg:justify-end">
                <div class="max-w-lg w-full lg:max-w-xs">
                    <livewire:search.input/>
                </div>
            </div>

            <div class="flex lg:hidden">
                <button type="button" aria-controls="mobile-menu" aria-expanded="false"
                        x-bind:aria-expanded="open.toString()"
                        x-on:click="open = ! open"
                        class="bg-blue-600 p-2 rounded-md inline-flex items-center justify-center text-blue-200 hover:text-white hover:bg-blue-500 hover:bg-opacity-75 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-blue-600 focus:ring-white">
                    <span class="sr-only">{{ __('app.open_main_menu') }}</span>
                    <x-heroicon-o-menu x-show="!open" class="h-6 w-6"/>
                    <x-heroicon-o-x x-show="open" x-cloak class="h-6 w-6"/>
                </button>
            </div>

            <x-base.account/>

            <x-base.locale-picker/>

        </div>
    </div>

    <div class="lg:hidden shadow-2xl" id="mobile-menu" x-show="open" x-cloak>
        <div class="px-2 pt-2 pb-3 space-y-1">
            <x-layout.menu-item-mobile :active="request()->routeIs('competitions.*')"
                                       :url="route('competitions.index')">
                {{ trans_choice('app.competitions', 2) }}
            </x-layout.menu-item-mobile>

            <x-layout.menu-item-mobile :active="request()->routeIs('events.*')" :url="route('events.index')">
                {{ trans_choice('app.events', 2) }}
            </x-layout.menu-item-mobile>

            <x-layout.menu-item-mobile :active="request()->routeIs('teams.*')" :url="route('teams.index')">
                {{ trans_choice('app.teams', 2) }}
            </x-layout.menu-item-mobile>
        </div>
        <div class="pt-4 pb-3 border-t border-blue-700">
            <div class="mt-3 px-2 space-y-1">
                {{--                <a href="#"--}}
                {{--                   class="block rounded-md py-2 px-3 text-base font-medium text-white hover:bg-blue-500 hover:bg-opacity-75">--}}
                {{--                    Your Profile--}}
                {{--                </a>--}}

                {{--                <a href="#"--}}
                {{--                   class="block rounded-md py-2 px-3 text-base font-medium text-white hover:bg-blue-500 hover:bg-opacity-75">--}}
                {{--                    Settings--}}
                {{--                </a>--}}

                {{--                <a href="#"--}}
                {{--                   class="block rounded-md py-2 px-3 text-base font-medium text-white hover:bg-blue-500 hover:bg-opacity-75">--}}
                {{--                    Sign out--}}
                {{--                </a>--}}
            </div>
        </div>
    </div>
</nav>
