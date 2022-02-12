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
                                <div class="flex items-center">
                                    <x-forms.radio
                                        name="timekeeping"
                                        id="timekeeping-{{ $timekeeping->value }}"
                                        :value="$timekeeping->value"
                                        wire:model.defer="timekeeping"
                                        required/>
                                    <x-forms.label class="ml-3" for="timekeeping-{{ $timekeeping->value }}">
                                        {{ $timekeeping->description }}
                                    </x-forms.label>
                                </div>
                            @endforeach
                            <x-forms.error name="timekeeping"/>
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
                                    <div class="flex items-center space-x-3">
                                        <x-forms.radio id="pool" name="venue-type" value="pool"
                                                       wire:model.defer="venue_type"
                                                       x-model="type"/>
                                        <x-forms.label for="pool">Pool</x-forms.label>
                                    </div>

                                    <div class="flex items-center space-x-4">
                                        <x-forms.radio id="beach" name="venue-type" value="beach"
                                                       wire:model.defer="venue_type"
                                                       x-model="type"/>
                                        <x-forms.label for="beach">Beach</x-forms.label>
                                    </div>

                                    <div class="flex items-center space-x-4">
                                        <x-forms.radio id="both" name="venue-type" value="both"
                                                       wire:model.defer="venue_type"
                                                       x-model="type"/>
                                        <x-forms.label for="both">Both</x-forms.label>
                                    </div>
                                </div>
                            </fieldset>
                        </div>

                        <x-well x-data="{ customPool: false }" x-show="type == 'pool' || type == 'both'">
                            <div class="px-4 py-5 sm:p-6">
                                <x-forms.label class="text-base text-gray-900">Pool</x-forms.label>
                                <fieldset class="mt-4">
                                    <div x-show="!customPool">
                                        <x-forms.label for="pool-venue">Choose an existing venue</x-forms.label>
                                        <select id="pool-venue"
                                                wire:model.defer="pool"
                                                class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                            @foreach($pools as $pool)
                                                <option value="{{ $pool->id }}">{{ $pool->name_for_select }}</option>
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

                                        <x-input.group :error="$errors->first('pool_name')">
                                            <x-input.label>Name</x-input.label>
                                            <x-input.text name="pool_name" wire:model.defer="pool_name"/>
                                        </x-input.group>

                                        <div>
                                            <x-forms.label for="pool-country">Country</x-forms.label>
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
                                            <x-forms.label for="pool-size">Pool size</x-forms.label>
                                            <fieldset class="mt-4">
                                                <legend class="sr-only">Pool size</legend>
                                                <div
                                                    class="space-y-4 sm:flex sm:items-center sm:space-y-0 sm:space-x-10">
                                                    <div class="flex items-center">
                                                        <x-forms.radio.with-inline-label name="pool_size"
                                                                                         label="25m" value="25"
                                                                                         wire:model.defer="pool_size"/>
                                                    </div>

                                                    <div class="flex items-center">
                                                        <x-forms.radio.with-inline-label name="pool_size"
                                                                                         label="50m" value="50"
                                                                                         wire:model.defer="pool_size"/>
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
                        </x-well>

                        <x-well x-data="{ customBeach: false }" x-show="type == 'beach' || type == 'both'">
                            <div class="px-4 py-5 sm:p-6">
                                <x-forms.label class="text-base text-gray-900">Beach</x-forms.label>
                                <fieldset class="mt-4">
                                    <div x-show="!customBeach">
                                        <x-forms.label for="beach-venue">Choose an existing venue</x-forms.label>
                                        <select id="beach-venue"
                                                wire:model.defer="beach"
                                                class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">
                                            @foreach($beaches as $beach)
                                                <option value="{{ $beach->id }}">{{ $beach->name_for_select }}</option>
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
                                        <x-input.group :error="$errors->first('beach_name')">
                                            <x-input.label>Name</x-input.label>
                                            <x-input.text name="beach_name" wire:model.defer="beach_name"/>
                                        </x-input.group>

                                        <div>
                                            <x-forms.label for="beach-country">Country</x-forms.label>
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
                        </x-well>
                    </div>
                </div>
            </div>

            <div class="pt-5">
                <div class="flex justify-end">
                    <x-base.button type="submit">Add competition</x-base.button>
                </div>
            </div>
        </form>
    @endif

</div>
