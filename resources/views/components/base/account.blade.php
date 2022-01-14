<div x-data="{ accountOpen: false }" @click.away="accountOpen = false" class="relative">
    <div class="hidden lg:block lg:ml-4">
        <div class="flex items-center">
            <div class="ml-3 relative shrink-0">
                <div>
                    <a
                        class="bg-blue-900 rounded-full flex text-sm text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-blue-600 focus:ring-white"
                        @if(!auth()->check())
                            href="{{ route('login') }}"
                        @else
                            href="#"
                            @click.prevent="accountOpen = ! accountOpen"
                        @endif
                        id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                        <span class="sr-only">{{ __('app.open_user_menu') }}</span>
                        <x-heroicon-o-user class="h-8 w-8 p-1"/>
                    </a>
                </div>
            </div>
        </div>
    </div>

    @if (auth()->check())
        <div x-show="accountOpen"
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
                <a href="#" class="block px-4 py-2 text-sm text-gray-700 flex items-center space-x-2 hover:bg-gray-100"
                   role="menuitem">
                    <span>Account</span>
                </a>
                <a href="#" class="block px-4 py-2 text-sm text-gray-700 flex items-center space-x-2 hover:bg-gray-100"
                   role="menuitem"
                   @click.prevent="document.getElementById('logout-form').submit();">
                    <span>Log out</span>
                </a>
            </div>
        </div>

        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
            @csrf
        </form>
    @endif
</div>
