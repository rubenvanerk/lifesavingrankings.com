<div class="grid grid-cols-3 gap-4">
    <x-layout.panel title="Config">
        @foreach($media->parser_config->options as $option)
            {{-- TODO: use $option->render function --}}
            <x-forms.input.with-label wire:model="media.parser_config.{{ $option->name }}" name="media.parser_config.{{ $option->name }}" :label="$option->label"/>
        @endforeach

            <x-base.button wire:click="save">Save</x-base.button>
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
                            <span aria-hidden="true"
                                  x-show="previewTab == 'table'"
                                  class="bg-blue-800 absolute inset-x-0 bottom-0 h-0.5">
                        </span>
                        </a>
                    </nav>
                </div>
                <div class="border-t border-gray-200 px-4 py-5 sm:p-0">
                    <div class="sm:divide-y sm:divide-gray-200  py-5 px-4 sm:px-6 lg:px-8" x-show="previewTab == 'text'">
                        <x-well class="p-3 rounded-md">
                            <pre class="overflow-scroll max-h-screen">{{ $rawText }}</pre>
                        </x-well>
                    </div>
                    <div class="sm:divide-y sm:divide-gray-200  py-5 px-4 sm:px-6 lg:px-8" x-show="previewTab == 'table'">
                        Table
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
