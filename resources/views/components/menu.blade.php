<nav class="bg-blue-800 border-b border-blue-300 border-opacity-25 lg:border-none" x-data="{ open: false }">
    <div class="max-w-7xl mx-auto px-2 sm:px-4 lg:px-8">
        <div class="relative h-16 flex items-center justify-between lg:border-b lg:border-blue-400 lg:border-opacity-25">
            <div class="px-2 flex items-center lg:px-0">
                <div class="flex-shrink-0">
                    <x-logo class="block h-8 w-8 text-white"/>
                </div>
                <div class="hidden lg:block lg:ml-10">
                    <div class="flex space-x-4">
                        <!-- Current: "bg-blue-700 text-white", Default: "text-white hover:bg-blue-500 hover:bg-opacity-75" -->
                        <a href="#" class="bg-blue-900 text-white rounded-md py-2 px-3 text-sm font-medium">
                            Competitions
                        </a>

                        <a href="#" class="text-white hover:bg-blue-700 hover:bg-opacity-75 rounded-md py-2 px-3 text-sm font-medium">
                            Events
                        </a>

                        <a href="#" class="text-white hover:bg-blue-700 hover:bg-opacity-75 rounded-md py-2 px-3 text-sm font-medium">
                            Teams
                        </a>

                        <a href="#" class="text-white hover:bg-blue-700 hover:bg-opacity-75 rounded-md py-2 px-3 text-sm font-medium">
                            Venues
                        </a>

                        <a href="#" class="text-white hover:bg-blue-700 hover:bg-opacity-75 rounded-md py-2 px-3 text-sm font-medium">
                            Analysis
                        </a>
                    </div>
                </div>
            </div>
            <div class="flex-1 px-2 flex justify-center lg:ml-6 lg:justify-end">
                <div class="max-w-lg w-full lg:max-w-xs">
                    <label for="search" class="sr-only">Search</label>
                    <div class="relative text-gray-400 focus-within:text-gray-600">
                        <div class="pointer-events-none absolute inset-y-0 left-0 pl-3 flex items-center">
                            <!-- Heroicon name: solid/search -->
                            <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
                            </svg>
                        </div>
                        <input id="search" class="block w-full bg-white py-2 pl-10 pr-3 border border-transparent rounded-md leading-5 text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-blue-600 focus:ring-yellow-300 focus:border-white sm:text-sm" placeholder="Search anything..." type="search" name="search">
                    </div>
                </div>
            </div>
            <div class="flex lg:hidden">
                <!-- Mobile menu button -->
                <button x-on:click="open = ! open"  type="button" class="bg-blue-600 p-2 rounded-md inline-flex items-center justify-center text-blue-200 hover:text-white hover:bg-blue-500 hover:bg-opacity-75 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-blue-600 focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
                    <span class="sr-only">Open main menu</span>
                    <x-heroicon-o-menu x-show="!open" class="h-6 w-6"/>
                    <x-heroicon-o-x x-show="open" class="h-6 w-6"/>
                </button>
            </div>
            <div class="hidden lg:block lg:ml-4">
                <div class="flex items-center">
                    <!-- Profile dropdown -->
                    <div class="ml-3 relative flex-shrink-0">
                        <div>
                            <a class="bg-blue-900 rounded-full flex text-sm text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-blue-600 focus:ring-white" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                                <span class="sr-only">Open user menu</span>
                                <x-heroicon-o-user class="h-8 w-8 p-1"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state. -->
    <div class="lg:hidden" id="mobile-menu" x-show="open">
        <div class="px-2 pt-2 pb-3 space-y-1">
            <!-- Current: "bg-blue-700 text-white", Default: "text-white hover:bg-blue-500 hover:bg-opacity-75" -->
            <a href="#" class="bg-blue-700 text-white block rounded-md py-2 px-3 text-base font-medium">
                Competitions
            </a>

            <a href="#" class="text-white hover:bg-blue-500 hover:bg-opacity-75 block rounded-md py-2 px-3 text-base font-medium">
                Events
            </a>

            <a href="#" class="text-white hover:bg-blue-500 hover:bg-opacity-75 block rounded-md py-2 px-3 text-base font-medium">
                Teams
            </a>

            <a href="#" class="text-white hover:bg-blue-500 hover:bg-opacity-75 block rounded-md py-2 px-3 text-base font-medium">
                Analysis
            </a>
        </div>
        <div class="pt-4 pb-3 border-t border-blue-700">
            <div class="mt-3 px-2 space-y-1">
                <a href="#" class="block rounded-md py-2 px-3 text-base font-medium text-white hover:bg-blue-500 hover:bg-opacity-75">
                    Your Profile
                </a>

                <a href="#" class="block rounded-md py-2 px-3 text-base font-medium text-white hover:bg-blue-500 hover:bg-opacity-75">
                    Settings
                </a>

                <a href="#" class="block rounded-md py-2 px-3 text-base font-medium text-white hover:bg-blue-500 hover:bg-opacity-75">
                    Sign out
                </a>
            </div>
        </div>
    </div>
</nav>
