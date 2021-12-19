<div class="px-4 py-5 sm:p-6">

    <form class="space-y-8 divide-y divide-gray-200">
        <div class="space-y-8 divide-y divide-gray-200">
            <div>
                <div>
                    <h3 class="text-lg leading-6 font-medium text-gray-900">
                        Adding a competition
                    </h3>
                    <p class="mt-1 text-sm text-gray-500">
                        In this form you can add a competition to the database.
                        After submitting this form, I will review and process the results.
                    </p>
                </div>

                <div class="mt-6 grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-6">
                    <div class="sm:col-span-4">
                        <label for="name" class="block text-sm font-medium text-gray-700">
                            Competition name
                        </label>
                        <div class="mt-1">
                            <input id="name" name="email" type="email" required
                                   class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                                   wire:model.defer="name">
                        </div>
                    </div>

                    <div class="sm:col-span-4">
                        <fieldset class="space-y-5 ">
                            <div class="relative flex items-start">
                                <div class="flex items-center h-5">
                                    <input id="ils-sanctioned" aria-describedby="ils-sanctioned" name="ils-sanctioned"
                                           type="checkbox"
                                           wire:model.defer="ilsSanctioned"
                                           class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300 rounded">
                                </div>
                                <div class="ml-3 text-sm">
                                    <label for="ils-sanctioned" class="font-medium text-gray-700">
                                        ILS sanctioned competition
                                    </label>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                    <div class="sm:col-span-3">
                        <label for="start-date" class="block text-sm font-medium text-gray-700">
                            Start date
                        </label>
                        <div class="mt-1">
                            <input type="date" name="start-date" id="start-date"
                                   class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                                   wire:model.defer="startDate">
                        </div>
                    </div>

                    <div class="sm:col-span-3">
                        <label for="end-date" class="block text-sm font-medium text-gray-700">
                            End date
                        </label>
                        <div class="mt-1">
                            <input type="date" name="end-date" id="end-date" autocomplete="family-name"
                                   class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                                   wire:model.defer="endDate">
                        </div>
                    </div>
                </div>

                <fieldset class="mt-6">
                    <div>
                        <legend class="text-base font-medium text-gray-900">
                            Timekeeping
                        </legend>
                    </div>
                    <div class="mt-4 space-y-4">
                        @foreach(\App\Enums\TimekeepingMethod::getInstances() as $timekeeping)
                            <div class="flex items-center">
                                <input id="timekeeping-{{ $timekeeping->value }}" name="timekeeping" type="radio"
                                       value="{{ $timekeeping->value }}" required
                                       class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300"
                                       wire:model.defer="timekeeping">
                                <label for="timekeeping-{{ $timekeeping->value }}"
                                       class="ml-3 block text-sm font-medium text-gray-700">
                                    {{ $timekeeping->description }}
                                </label>
                            </div>
                        @endforeach
                    </div>
                </fieldset>

            </div>

            <div class="pt-8" x-data="{ type: 'pool' }">
                <div>
                    <h3 class="text-lg leading-6 font-medium text-gray-900"
                        x-text="type == 'both' ? 'Venues' : 'Venue'"></h3>
                </div>
                <div class="mt-6 grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-6">
                    <div class="sm:col-span-6">
                        <label class="text-base font-medium text-gray-900">Competition type</label>
                        <fieldset class="mt-4">
                            <legend class="sr-only">Venues</legend>
                            <div class="space-y-4 sm:flex sm:items-center sm:space-y-0 sm:space-x-10">
                                <div class="flex items-center">
                                    <input id="pool" name="competition-type" type="radio" checked value="pool"
                                           class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300"
                                           x-model="type">
                                    <label for="pool" class="ml-3 block text-sm font-medium text-gray-700">
                                        Pool
                                    </label>
                                </div>

                                <div class="flex items-center">
                                    <input id="ocean" name="competition-type" type="radio" value="beach"
                                           class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300"
                                           x-model="type">
                                    <label for="ocean" class="ml-3 block text-sm font-medium text-gray-700">
                                        Beach
                                    </label>
                                </div>

                                <div class="flex items-center">
                                    <input id="both" name="competition-type" type="radio" value="both"
                                           class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300"
                                           x-model="type">
                                    <label for="both" class="ml-3 block text-sm font-medium text-gray-700">
                                        Both
                                    </label>
                                </div>
                            </div>
                        </fieldset>
                    </div>

                    <div class="bg-gray-50 overflow-hidden sm:col-span-6 md:col-span-3"
                         x-data="{ customPool: false }" x-show="type == 'pool' || type == 'both'">
                        <div class="px-4 py-5 sm:p-6">
                            <label class="text-base font-medium text-gray-900">Pool</label>
                            <fieldset class="mt-4">
                                <div x-show="!customPool">
                                    <label for="pool-venue" class="block text-sm font-medium text-gray-700">
                                        Choose an existing venue
                                    </label>
                                    <select id="pool-venue" name="pool_venue"
                                            class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                        @foreach($pools as $pool)
                                            <option>{{ $pool->name_for_select }}</option>
                                        @endforeach
                                    </select>

                                    <div class="mt-1">
                                        <a href=""
                                           class="text-sm "
                                           @click.prevent="customPool = true">
                                            Or create a new venue
                                        </a>
                                    </div>
                                </div>

                                <div x-show="customPool" class="space-y-8">
                                    <div>
                                        <label for="pool-name" class="block text-sm font-medium text-gray-700">
                                            Name
                                        </label>
                                        <div class="mt-1">
                                            <input id="pool-name" name="pool[name]" type="text" required
                                                   class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                                                   wire:model.defer="poolName">
                                        </div>
                                    </div>

                                    <div>
                                        <label for="pool-country" class="block text-sm font-medium text-gray-700">
                                            Country
                                        </label>
                                        <select id="pool-country" name="pool_country"
                                                class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                            @foreach(countries() as $country)
                                                <option
                                                    value="{{ $country['iso_3166_1_alpha3'] }}">{{ $country['name'] }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div>
                                        <label for="pool-name" class="block text-sm font-medium text-gray-700">
                                            City
                                        </label>
                                        <div class="mt-1">
                                            <input id="pool-name" name="pool[name]" type="text" required
                                                   class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                                                   wire:model.defer="poolName">
                                        </div>
                                    </div>

                                    <div>
                                        <label class="block text-sm font-medium text-gray-700">Pool size</label>
                                        <fieldset class="mt-4">
                                            <legend class="sr-only">Pool size</legend>
                                            <div class="space-y-4 sm:flex sm:items-center sm:space-y-0 sm:space-x-10">
                                                <div class="flex items-center">
                                                    <input id="25m" name="pool-size" type="radio" checked class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300">
                                                    <label for="25m" class="ml-3 block text-sm font-medium text-gray-700">
                                                        25m
                                                    </label>
                                                </div>

                                                <div class="flex items-center">
                                                    <input id="50m" name="pool-size" type="radio" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300">
                                                    <label for="50m" class="ml-3 block text-sm font-medium text-gray-700">
                                                        50m
                                                    </label>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>

                                    <div class="mt-1">
                                        <a href=""
                                           class="text-sm "
                                           @click.prevent="customPool = false">
                                            Choose from existing venues
                                        </a>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>

                    <div class="bg-gray-50 overflow-hidden sm:rounded-lg sm:col-span-6 md:col-span-3"
                         x-data="{ customBeach: false }" x-show="type == 'beach' || type == 'both'">
                        <div class="px-4 py-5 sm:p-6">
                            <label class="text-base font-medium text-gray-900">Beach</label>
                            <fieldset class="mt-4">
                                <div x-show="!customBeach">
                                    <label for="pool-venue" class="block text-sm font-medium text-gray-700">
                                        Existing venue
                                    </label>
                                    <select id="pool-venue" name="pool_venue"
                                            class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                        @foreach($beaches as $beach)
                                            <option>{{ $beach->name_for_select }}</option>
                                        @endforeach
                                    </select>

                                    <div class="mt-1">
                                        <a href=""
                                           class="text-sm "
                                           @click.prevent="customBeach = true">
                                            Or create a new venue
                                        </a>
                                    </div>
                                </div>

                                <div x-show="customBeach" class="space-y-8">
                                    <div>
                                        <label for="pool-name" class="block text-sm font-medium text-gray-700">
                                            Name
                                        </label>
                                        <div class="mt-1">
                                            <input id="pool-name" name="pool[name]" type="text" required
                                                   class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                                                   wire:model.defer="poolName">
                                        </div>
                                    </div>

                                    <div>
                                        <label for="pool-country" class="block text-sm font-medium text-gray-700">
                                            Country
                                        </label>
                                        <select id="pool-country" name="pool_country"
                                                class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                            @foreach(countries() as $country)
                                                <option
                                                    value="{{ $country['iso_3166_1_alpha3'] }}">{{ $country['name'] }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div>
                                        <label for="pool-name" class="block text-sm font-medium text-gray-700">
                                            City
                                        </label>
                                        <div class="mt-1">
                                            <input id="pool-name" name="pool[name]" type="text" required
                                                   class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                                                   wire:model.defer="poolName">
                                        </div>
                                    </div>

                                    <div class="mt-1">
                                        <a href=""
                                           class="text-sm "
                                           @click.prevent="customBeach = false">
                                            Choose from existing venues
                                        </a>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="pt-5">
            <div class="flex justify-end">
                <button type="submit"
                        class="ml-3 inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Add
                </button>
            </div>
        </div>
    </form>

</div>
