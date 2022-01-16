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
                <x-base.button wire:click="save">Save</x-base.button>
            </div>
        </div>
    </x-layout.panel>

    <div class="bg-white shadow overflow-hidden md:rounded-lg col-span-2">
        <div class="border-t border-gray-200 h-full">
            <div x-data="{ previewTab: 'text' }"
                 class="bg-white shadow overflow-hidden md:rounded-lg col-span-2 md:col-span-1 mt-4 md:mt-0 h-full">
                <div>
                    <nav class="relative z-0 shadow flex divide-x divide-gray-200">
                        <a href="#"
                           @click.prevent="previewTab = 'text'"
                           :class="previewTab == 'text' ? 'text-gray-900' : 'text-gray-500'"
                           class="group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-6 text-sm font-medium text-center hover:bg-gray-50 focus:z-10 hover:no-underline">
                            <span>Text</span>
                            @if(!is_null($matchCount))
                                <x-base.badge class="ml-1" wire:loading.class="animate-pulse">{{ $matchCount }} regex matches</x-base.badge>
                            @endif
                            <span aria-hidden="true"
                                  x-show="previewTab == 'text'"
                                  class="bg-blue-800 absolute inset-x-0 bottom-0 h-0.5">
                        </span>
                        </a>
                        <a href="#"
                           @click.prevent="previewTab = 'table'"
                           :class="previewTab == 'table' ? 'text-gray-900' : 'text-gray-500'"
                           class="group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-6 text-sm font-medium text-center hover:bg-gray-50 focus:z-10 hover:no-underline">
                            <span>Table</span>
                            <x-base.badge class="ml-1">{{ $results->count() }}</x-base.badge>
                            <span aria-hidden="true"
                                  x-show="previewTab == 'table'"
                                  class="bg-blue-800 absolute inset-x-0 bottom-0 h-0.5">
                        </span>
                        </a>
                    </nav>
                </div>
                <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
                    <div class="sm:divide-y sm:divide-gray-200  py-5 px-4 sm:px-6 lg:px-8"
                         x-show="previewTab == 'text'">
                        <x-well class="p-3 rounded-md">
                            <pre class="numbered overflow-scroll max-h-screen leading-4">{!! $rawText !!}</pre>
                        </x-well>
                    </div>
                    <div class="sm:divide-y sm:divide-gray-200  py-5 px-4 sm:px-6 lg:px-8"
                         x-show="previewTab == 'table'">
                        Table
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
