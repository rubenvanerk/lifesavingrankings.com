<div class="fixed inset-x-0 bottom-0 max-w-7xl mx-auto lg:pb-6" x-data="{ filter: false }">
    <button type="button" title="Filter"
            @click="filter = ! filter"
            x-show="!filter"
            class="absolute z-10 bottom-0 right-0 block -translate-y-10 -translate-x-10 inline-flex items-center p-2 border border-transparent rounded-full text-white bg-amber-500 hover:bg-amber-600 focus:outline-none shadow-2xl transition">
        <x-heroicon-s-filter class="h-12 w-12 p-2"/>
        @if ($filter->countActive())
            <span
                class="absolute top-0 right-0 block h-5 w-5 rounded-full ring-2 ring-white bg-blue-800 text-sm font-semibold">
                {{ $filter->countActive() }}
            </span>
        @endif
    </button>

    <div class="bg-blue-800 lg:rounded-lg shadow-2xl lg:mx-5 xl:mx-0"
         @click.away="filter = false"
         x-show="filter" x-cloak
         x-transition:enter="transition ease-in-out duration-300"
         x-transition:enter-start="opacity-0 scale-y-0 translate-y-64"
         x-transition:enter-end="opacity-100 scale-y-100 translate-y-0"
         x-transition:leave="transition ease-in-out duration-300"
         x-transition:leave-start="opacity-100 scale-y-100 translate-y-0"
         x-transition:leave-end="opacity-0 scale-y-0 translate-y-64">

        <div class="py-4 px-6 text-white">
            <div class="flex">
                <h2 class="text-lg font-bold pb-4 w-0 grow">{{ __('filter.title') }}</h2>
                <span>
                    <x-base.button icon="s-refresh" wire:click="resetFilter">
                        {{ __('filter.reset') }}
                    </x-base.button>
                    <x-base.button icon="s-x-circle" @click="filter = false">
                        {{ __('filter.close') }}
                    </x-base.button>
                </span>
            </div>

            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">

                @foreach($this->filter->getVisibleFields() as $name => $field)
                    <x-input.group :error="$errors->first($name)" :id="$name">
                        <x-input.label class="text-white" color="tex-white">{{ __("filter.fields.$name") }}</x-input.label>
                        @if ($field->type === \App\Enums\FilterFieldType::Select)
                            <x-input.select wire:model="fieldValues.{{ $name }}"
                                            :options="$field->options ?? []"
                            />
                        @else
                            <x-dynamic-component :component="'input.' . strtolower($field->type->value)"
                                                 :value="$fieldValues[$name]"
                                                 wire:model="fieldValues.{{ $name }}"
                            />
                        @endif
                    </x-input.group>
                @endforeach

            </div>
        </div>
    </div>
</div>
