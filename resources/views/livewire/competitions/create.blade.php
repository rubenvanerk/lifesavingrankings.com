<div class="px-4 py-5 sm:p-6">
    @if($this->created)
        <x-base.alert color="emerald">
            Thanks for adding the competition! It will be processed as soon as possible.
        </x-base.alert>
    @else
        <form class="space-y-8 divide-y divide-gray-200" wire:submit.prevent="submit">
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
                            <x-input.group :error="$errors->first('name')" :required="true">
                                <x-input.label>Competition name</x-input.label>
                                <x-input.text name="name" wire:model.defer="name"/>
                            </x-input.group>
                        </div>

                        <div class="sm:col-span-4">
                            <x-input.group :error="$errors->first('files')" :required="false">
                                <x-input.label>File(s)</x-input.label>
                                <div class="flex">
                                    <x-input.file name="files" wire:model="files" multiple/>
                                </div>

                                <p class="mt-1 text-sm text-gray-500">
                                    If you can, please also provide a link to the source of the file.
                                </p>
                            </x-input.group>
                        </div>

                        <div class="sm:col-span-4">
                            <x-input.group :error="$errors->first('file_link')" :required="false">
                                <x-input.label>File link</x-input.label>
                                <x-input.text name="file_link" wire:model="file_link"/>
                            </x-input.group>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="mt-6 grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-6">
                        <div class="sm:col-span-4">
                            <x-input.group class="flex space-x-2 items-start" :error="$errors->first('ils_sanctioned')">
                                <div class="flex items-center h-5">
                                    <x-input.checkbox name="ils_sanctioned" wire:model.defer="ils_sanctioned"/>
                                </div>
                                <x-input.label>ILS sanctioned competition</x-input.label>
                            </x-input.group>
                        </div>

                        <div class="sm:col-span-3">
                            <x-input.group :error="$errors->first('start_date')" :required="true">
                                <x-input.label>Start date</x-input.label>
                                <x-input.date name="start_date" wire:model="start_date"/>
                            </x-input.group>
                        </div>

                        <div class="sm:col-span-3">
                            <x-input.group :error="$errors->first('end_date')" :required="false">
                                <x-input.label>End date</x-input.label>
                                <x-input.date name="end_date" wire:model="end_date"/>
                            </x-input.group>
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
                                <x-input.group class="flex space-x-2 items-center">
                                    <x-input.radio name="timekeeping" :value="$timekeeping->value"
                                                   wire:model.defer="timekeeping" required/>
                                    <x-input.label>{{ $timekeeping->description }}</x-input.label>
                                </x-input.group>
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
                                <div class="space-y-4 sm:flex sm:items-center sm:space-y-0 sm:space-x-10">
                                    <x-input.group class="flex space-x-2 items-center">
                                        <x-input.radio name="venue_type" value="pool" wire:model.defer="venue_type"
                                                       required x-model="type"/>
                                        <x-input.label>Pool</x-input.label>
                                    </x-input.group>

                                    <x-input.group class="flex space-x-2 items-center">
                                        <x-input.radio name="venue_type" value="beach" wire:model.defer="venue_type"
                                                       required x-model="type"/>
                                        <x-input.label>Beach</x-input.label>
                                    </x-input.group>

                                    <x-input.group class="flex space-x-2 items-center">
                                        <x-input.radio name="venue_type" value="both" wire:model.defer="venue_type"
                                                       required x-model="type"/>
                                        <x-input.label>Both</x-input.label>
                                    </x-input.group>
                                </div>
                            </fieldset>
                        </div>

                        <x-well x-data="{ customPool: false }" x-show="type == 'pool' || type == 'both'"
                                class="px-4 py-5 sm:p-6">
                            <x-input.label class="text-base text-gray-900">Pool</x-input.label>
                            <fieldset class="mt-4">
                                <div x-show="!customPool">
                                    <x-input.label for="pool-venue">Choose an existing venue</x-input.label>
                                    <select id="pool-venue"
                                            wire:model.defer="pool"
                                            class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                        @foreach($pools as $pool)
                                            <option value="{{ $pool->id }}">{{ $pool->name_for_select }}</option>
                                        @endforeach
                                    </select>

                                    <x-link href="" class="mt-1 text-sm" x-on:click.prevent="customPool = true">
                                        Or create a new venue
                                    </x-link>
                                </div>

                                <div x-show="customPool" class="space-y-8">
                                    <x-input.group :error="$errors->first('pool_name')">
                                        <x-input.label>Name</x-input.label>
                                        <x-input.text name="pool_name" wire:model.defer="pool_name"/>
                                    </x-input.group>

                                    <div>
                                        <x-input.label for="pool-country">Country</x-input.label>
                                        <select id="pool-country" wire:model.defer="pool_country"
                                                class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                            @foreach(countries() as $country)
                                                <option
                                                    value="{{ $country['iso_3166_1_alpha2'] }}">{{ $country['name'] }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <x-input.group :error="$errors->first('pool_city')">
                                        <x-input.label>City</x-input.label>
                                        <x-input.text name="pool_city" wire:model.defer="pool_city"/>
                                    </x-input.group>

                                    <div>
                                        <x-input.label for="pool-size">Pool size</x-input.label>
                                        <fieldset class="mt-4">
                                            <legend class="sr-only">Pool size</legend>
                                            <div
                                                class="space-y-4 sm:flex sm:items-center sm:space-y-0 sm:space-x-10">
                                                <x-input.group class="flex space-x-2 items-center">
                                                    <x-input.radio name="pool_size" value="25"
                                                                   wire:model.defer="pool_size" required/>
                                                    <x-input.label>25m</x-input.label>
                                                </x-input.group>

                                                <x-input.group class="flex space-x-2 items-center">
                                                    <x-input.radio name="pool_size" value="50"
                                                                   wire:model.defer="pool_size" required/>
                                                    <x-input.label>50m</x-input.label>
                                                </x-input.group>
                                            </div>
                                        </fieldset>
                                    </div>

                                    <x-link href="" x-on:click.prevent="customPool = false" class="mt-1 text-sm">
                                        Choose from existing venues
                                    </x-link>
                                </div>
                            </fieldset>
                        </x-well>

                        <x-well x-data="{ customBeach: false }" x-show="type == 'beach' || type == 'both'"
                                class="px-4 py-5 sm:p-6">
                            <x-input.label class="text-base text-gray-900">Beach</x-input.label>
                            <fieldset class="mt-4">
                                <div x-show="!customBeach">
                                    <x-input.label for="beach-venue">Choose an existing venue</x-input.label>
                                    <select id="beach-venue"
                                            wire:model.defer="beach"
                                            class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                        @foreach($beaches as $beach)
                                            <option value="{{ $beach->id }}">{{ $beach->name_for_select }}</option>
                                        @endforeach
                                    </select>

                                    <x-link href="" class="mt-1 text-sm" x-on:click.prevent="customBeach = true">
                                        Or create a new venue
                                    </x-link>
                                </div>

                                <div x-show="customBeach" class="space-y-8">
                                    <x-input.group :error="$errors->first('beach_name')">
                                        <x-input.label>Name</x-input.label>
                                        <x-input.text name="beach_name" wire:model.defer="beach_name"/>
                                    </x-input.group>

                                    <div>
                                        <x-input.label for="beach-country">Country</x-input.label>
                                        <select id="beach-country" wire:model.defer="beach_country"
                                                class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                            @foreach(countries() as $country)
                                                <option
                                                    value="{{ $country['iso_3166_1_alpha2'] }}">{{ $country['name'] }}</option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <x-input.group :error="$errors->first('beach_city')">
                                        <x-input.label>City</x-input.label>
                                        <x-input.text name="beach_city" wire:model.defer="beach_city"/>
                                    </x-input.group>


                                    <x-link href="" class="mt-1 text-sm" x-on:click.prevent="customBeach = true">
                                        Choose from existing venues
                                    </x-link>
                                </div>
                            </fieldset>
                        </x-well>
                    </div>
                </div>
            </div>

            <div class="pt-5 flex justify-end">
                <x-base.button type="submit">Add competition</x-base.button>
            </div>
        </form>
    @endif

</div>
