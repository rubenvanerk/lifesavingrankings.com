@if ($paginator->hasPages())
    <div class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
        <div class="flex-1 flex justify-between sm:hidden">

            @if ($paginator->onFirstPage())
                <span
                    class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-500 bg-white cursor-default">
                    {!! __('pagination.previous') !!}
                </span>
            @else
                <button wire:click.prevent="previousPage" wire:loading.attr="disabled" dusk="previousPage.before"
                        class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                    {!! __('pagination.previous') !!}
                </button>
            @endif

            @if ($paginator->hasMorePages())
                <button wire:click.prevent="nextPage" wire:loading.attr="disabled" dusk="nextPage.before"
                        class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                    {!! __('pagination.next') !!}
                </button>
            @else
                <span
                    class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-500 bg-white cursor-default">
                    {!! __('pagination.next') !!}
                </span>
            @endif

        </div>
        <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
            <div>
                <p class="text-sm text-gray-700">
                    {!! __('pagination.showing') !!}
                    <span class="font-medium">{{ $paginator->firstItem() }}</span>
                    {!! __('pagination.to') !!}
                    <span class="font-medium">{{ $paginator->lastItem() }}</span>
                    {!! __('pagination.of') !!}
                    <span class="font-medium">{{ $paginator->total() }}</span>
                    {!! __('pagination.results') !!}
                </p>
            </div>
            <div>
                <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                    {{-- Previous Page Link --}}
                    @if ($paginator->onFirstPage())
                        <span aria-disabled="true" aria-label="{{ __('pagination.previous') }}"
                              class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-300 cursor-default">
                            <span class="sr-only">{!! __('pagination.previous') !!}</span>
                            <x-heroicon-s-chevron-left class="h-5 w-5"/>
                        </span>
                    @else
                        <button rel="prev" aria-label="{{ __('pagination.previous') }}"
                                wire:click="previousPage" dusk="previousPage.after"
                                class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                            <span class="sr-only">{!! __('pagination.previous') !!}</span>
                            <x-heroicon-s-chevron-left class="h-5 w-5"/>
                        </button>
                    @endif

                    {{-- Pagination Elements --}}
                    @foreach ($elements as $element)
                        {{-- "Three Dots" Separator --}}
                        @if (is_string($element))
                            <span aria-disabled="true"
                                  class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700">
                                ...
                            </span>
                        @endif

                        {{-- Array Of Links --}}
                        @if (is_array($element))
                            @foreach ($element as $page => $url)
                                <span wire:key="paginator-page{{ $page }}">
                                    @if ($page == $paginator->currentPage())
                                        <button aria-current="page"
                                                class="z-10 bg-blue-50 border-blue-600 text-blue-700 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                                            {{ $page }}
                                        </button>
                                    @else
                                        <button aria-label="{{ __('Go to page :page', ['page' => $page]) }}"
                                                wire:click="gotoPage({{ $page }})"
                                                class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                                            {{ $page }}
                                        </button>
                                    @endif
                                </span>
                            @endforeach
                        @endif

                    @endforeach

                    {{-- Next Page Link --}}
                    @if ($paginator->hasMorePages())
                        <button aria-label="{{ __('pagination.next') }}" rel="next"
                                wire:click="nextPage" dusk="nextPage.after"
                                class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                            <span class="sr-only">Next</span>
                            <x-heroicon-s-chevron-right class="h-5 w-5"/>
                        </button>
                    @else
                        <span aria-label="{{ __('pagination.next') }}" aria-disabled="true"
                              wire:click="nextPage" dusk="nextPage.after" rel="next"
                              class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-300 cursor-default">
                            <span class="sr-only">Next</span>
                            <x-heroicon-s-chevron-right class="h-5 w-5"/>
                        </span>
                    @endif
                </nav>
            </div>
        </div>
    </div>
@endif
