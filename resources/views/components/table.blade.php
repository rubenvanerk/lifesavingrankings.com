<div class="shadow sm:hidden">
    <ul class="mt-2 divide-y divide-gray-200 overflow-hidden shadow sm:hidden">
        {{ $mobileBody }}
    </ul>

    {{ $pagination }}
{{--    @if ($pagination ?? false)--}}
{{--        <nav class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200"--}}
{{--             aria-label="Pagination">--}}
{{--            <div class="flex-1 flex justify-between">--}}
{{--                <a href="#"--}}
{{--                   class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:text-gray-500">--}}
{{--                    {{ __('pagination.previous') }}--}}
{{--                </a>--}}
{{--                <a href="#"--}}
{{--                   class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:text-gray-500">--}}
{{--                    {{ __('pagination.next') }}--}}
{{--                </a>--}}
{{--            </div>--}}
{{--        </nav>--}}
{{--    @endif--}}
</div>

<div class="hidden sm:block">
    <div class="w-full mx-auto p-5">
        <div class="flex flex-col mt-2">
            <div class="align-middle min-w-full overflow-x-auto shadow overflow-hidden sm:rounded-lg">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead>
                    <tr>
                        {{ $head }}
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        {{ $body }}
                    </tbody>
                </table>

                {{ $pagination }}
{{--                @if ($pagination ?? false)--}}
{{--                    <nav class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6"--}}
{{--                         aria-label="Pagination">--}}
{{--                        <div class="hidden sm:block">--}}
{{--                            --}}{{-- TODO: translate --}}
{{--                            <p class="text-sm text-gray-700">--}}
{{--                                Showing--}}
{{--                                <span class="font-medium">1</span>--}}
{{--                                to--}}
{{--                                <span class="font-medium">10</span>--}}
{{--                                of--}}
{{--                                <span class="font-medium">20</span>--}}
{{--                                results--}}
{{--                            </p>--}}
{{--                        </div>--}}
{{--                        <div class="flex-1 flex justify-between sm:justify-end">--}}
{{--                            <a href="#"--}}
{{--                               class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">--}}
{{--                                {{ __('pagination.previous') }}--}}
{{--                            </a>--}}
{{--                            <a href="#"--}}
{{--                               class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">--}}
{{--                                {{ __('pagination.next') }}--}}
{{--                            </a>--}}
{{--                        </div>--}}
{{--                    </nav>--}}
{{--                @endif--}}
            </div>
        </div>
    </div>
</div>
