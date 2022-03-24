<div>
    @if($parser_config->job_status && !$parser_config->job_status->is_finished)
        <livewire:show-job-progress :job-status="$parser_config->job_status"/>
    @endif

    @if (!empty($errorMessage))
        <x-base.alert color="red" class="mb-3">
            {{ $errorMessage }}
        </x-base.alert>
    @endif

    <div class="grid grid-cols-3 gap-4">
        <x-layout.panel title="Config">

            <div class="flex flex-col gap-y-4">
                <x-layout.accordion>
                    @foreach($media->parser_config->options->groupBy('group') as $group => $options)

                        <x-layout.accordion.panel :title="ucfirst($group)" :panelId="$loop->iteration"
                                                  :active="$options->contains(fn($option) => $option->name == $this->currentRegexOptionName)">
                            @foreach($options as $option)
                                <div>
                                    <x-parser-input :option="$option"/>
                                </div>
                            @endforeach
                        </x-layout.accordion.panel>
                    @endforeach
                </x-layout.accordion>

                <div>
                    <x-base.button wire:click="save">
                        <x-heroicon-s-refresh wire:loading class="animate-spin h-4 w-4 mr-3 transform rotate-180"
                                              wire:target="save"/>
                        Save
                    </x-base.button>
                    <x-base.button wire:click="saveAndImport">
                        <x-heroicon-s-refresh wire:loading class="animate-spin h-4 w-4 mr-3 transform rotate-180"
                                              wire:target="saveAndImport"/>
                        Save & import
                    </x-base.button>
                    <x-base.button wire:click="$emit('openModal', 'copy-config')">
                        Copy from other comp
                    </x-base.button>
                </div>
            </div>
        </x-layout.panel>

        <div class="bg-white shadow overflow-hidden md:rounded-lg col-span-2">
            <div class="border-t border-gray-200 h-full">
                <div x-data="{ currentTab: '{{ $currentTab }}' }"
                     class="bg-white shadow overflow-hidden md:rounded-lg col-span-2 md:col-span-1 mt-4 md:mt-0 h-full">
                    <div>
                        <nav class="relative z-0 shadow flex divide-x divide-gray-200">
                            <a href="#"
                               @click="currentTab = '{{ self::TAB_TEXT }}'"
                               wire:click="$set('currentTab', '{{ self::TAB_TEXT }}')"
                               :class="currentTab == 'text' ? 'text-gray-900' : 'text-gray-500'"
                               class="group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-6 text-sm font-medium text-center hover:bg-gray-50 focus:z-10">
                                <span>Text</span>
                                <x-base.badge class="ml-1" x-show="currentTab == 'text'">
                                    <span wire:loading.remove>{{ $matchCount ?? '?' }} regex matches</span>
                                    <x-heroicon-s-refresh class="animate-spin h-4 w-4 transform rotate-180"
                                                          wire:loading/>
                                </x-base.badge>
                                <span aria-hidden="true"
                                      x-show="currentTab == 'text'"
                                      class="bg-blue-800 absolute inset-x-0 bottom-0 h-0.5">
                                </span>
                            </a>
                            <a href="#"
                               @click="currentTab = '{{ self::TAB_TABLE }}'"
                               wire:click="$set('currentTab', '{{ self::TAB_TABLE }}')"
                               :class="currentTab == 'table' ? 'text-gray-900' : 'text-gray-500'"
                               class="group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-6 text-sm font-medium text-center hover:bg-gray-50 focus:z-10">
                                <span>Table</span>
                                <x-base.badge class="ml-1" x-show="currentTab == 'table'">
                                    <span wire:loading.remove>{{ $results?->count() ?: '?' }}</span>
                                    <x-heroicon-s-refresh class="animate-spin h-4 w-4 transform rotate-180"
                                                          wire:loading/>
                                </x-base.badge>
                                <span aria-hidden="true"
                                      x-show="currentTab == 'table'"
                                      class="bg-blue-800 absolute inset-x-0 bottom-0 h-0.5">
                                </span>
                            </a>
                            <a href="#"
                               @click="currentTab = '{{ self::TAB_EVENTS }}'"
                               wire:click="$set('currentTab', '{{ self::TAB_EVENTS }}')"
                               :class="currentTab == 'events' ? 'text-gray-900' : 'text-gray-500'"
                               class="group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-6 text-sm font-medium text-center hover:bg-gray-50 focus:z-10">
                                <span>Events</span>
                                <x-base.badge class="ml-1" x-show="currentTab == 'events'">
                                    <span wire:loading.remove>{{ isset($events) ? $events->count() : '?' }}</span>
                                    <x-heroicon-s-refresh class="animate-spin h-4 w-4 transform rotate-180"
                                                          wire:loading/>
                                </x-base.badge>
                                <span aria-hidden="true"
                                      x-show="currentTab == 'events'"
                                      class="bg-blue-800 absolute inset-x-0 bottom-0 h-0.5">
                                </span>
                            </a>
                        </nav>
                    </div>
                    <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
                        <div class="sm:divide-y sm:divide-gray-200  py-5 px-4 sm:px-6 lg:px-8"
                             x-show="currentTab == 'text'">
                            @if ($currentTab == self::TAB_TEXT)
                                <x-well class="p-3 rounded-md">
                                    <pre class="numbered overflow-scroll max-h-screen leading-4">{!! $rawText !!}</pre>
                                </x-well>
                            @else
                                <div type="button" class="relative block w-full rounded-lg p-12 text-center">
                                    <x-heroicon-s-refresh
                                        class="mx-auto h-12 w-12 text-gray-400 animate-spin transform rotate-180"/>
                                </div>
                            @endif
                        </div>
                        <div class="py-5 px-4 sm:px-6 lg:px-8"
                             x-show="currentTab == 'table'">
                            <div class="flex-col space-y-3">
                                <x-base.button wire:click="refreshResults"
                                               wire:loading.attr="disabled"
                                               wire:target="refreshResults">
                                    <x-heroicon-s-refresh wire:loading
                                                          class="animate-spin h-4 w-4 mr-3 transform rotate-180"/>
                                    Load table
                                </x-base.button>

                                <x-input.group class="mt-1 flex space-x-2 items-start">
                                    <div class="flex items-center h-5">
                                        <x-input.checkbox name="autoloadTable" wire:model="autoloadTable"/>
                                    </div>
                                    <x-input.label>Autoload</x-input.label>
                                </x-input.group>
                            </div>
                            @if ($results)
                                <x-table :add-padding="false" class="overflow-scroll">
                                    <x-slot name="head">
                                        <x-table.heading>Line #</x-table.heading>
                                        <x-table.heading>Name</x-table.heading>
                                        <x-table.heading>Team</x-table.heading>
                                        <x-table.heading>Category</x-table.heading>
                                        <x-table.heading>Event</x-table.heading>
                                        <x-table.heading>Time</x-table.heading>
                                        <x-table.heading>Splits</x-table.heading>
                                    </x-slot>
                                    <x-slot name="body">
                                        @foreach($results as $result)
                                            <x-table.row>
                                                <x-table.cell>{{ $result->originalLineNumber }}</x-table.cell>
                                                <x-table.cell>
                                                    {{ $result->entrant?->gender->is(\App\Enums\Gender::Men) ? '♂' : '♀' }}
                                                    {{ $result->entrant?->name }}
                                                    <small>{{ $result->entrant?->yearOfBirth }}</small>
                                                    @if (count($result->getSegments()) > 0)
                                                        <small>
                                                            @foreach($result->getSegments() as $segment)
                                                                {{ $segment->entrant->name }}{{ $loop->last ? '' : ',' }}
                                                            @endforeach
                                                        </small>
                                                    @endif
                                                </x-table.cell>
                                                <x-table.cell>{{ $result->team?->name }}</x-table.cell>
                                                <x-table.cell>{{ $result->category?->name }}</x-table.cell>
                                                <x-table.cell>{{ $result->event?->name }}</x-table.cell>
                                                <x-table.cell>{{ $result->getFormattedTime() }}</x-table.cell>
                                                <x-table.cell>{{ is_iterable($result->splits) ? implode(', ', $result->splits) : '' }}</x-table.cell>
                                            </x-table.row>
                                        @endforeach
                                    </x-slot>
                                </x-table>
                            @elseif($currentTab != self::TAB_TABLE)
                                <div type="button" class="relative block w-full rounded-lg p-12 text-center">
                                    <x-heroicon-s-refresh
                                        class="mx-auto h-12 w-12 text-gray-400 animate-spin transform rotate-180"/>
                                </div>
                            @endif
                        </div>
                        <div class="sm:divide-y sm:divide-gray-200  py-5 px-4 sm:px-6 lg:px-8"
                             x-show="currentTab == 'events'">
                            @if($currentTab == self::TAB_EVENTS)
                                <x-table :add-padding="false">
                                    <x-slot name="head">
                                        <x-table.heading>Line</x-table.heading>
                                        <x-table.heading>Match</x-table.heading>
                                    </x-slot>
                                    <x-slot name="body">
                                        @foreach($events as $event)
                                            <x-table.row>
                                                <x-table.cell>{{ $event['line'] }}</x-table.cell>
                                                <x-table.cell>{{ $event['match'] }}</x-table.cell>
                                            </x-table.row>
                                        @endforeach
                                    </x-slot>
                                </x-table>
                            @else
                                <div type="button" class="relative block w-full rounded-lg p-12 text-center">
                                    <x-heroicon-s-refresh
                                        class="mx-auto h-12 w-12 text-gray-400 animate-spin transform rotate-180"/>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
