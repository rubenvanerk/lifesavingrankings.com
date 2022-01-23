@if (isset($mobileBody))
    <div class="shadow sm:hidden">
        <ul class="mobile-table mt-2 divide-y divide-gray-200 overflow-hidden shadow sm:hidden">
            {{ $mobileBody }}
        </ul>

        {{ $pagination ?? '' }}
    </div>
@endif

<div class="hidden sm:block">
    <div class="w-full mx-auto {{ ($addPadding ?? true) ? 'p-5' : '' }}">
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

                {{ $pagination ?? '' }}
            </div>
        </div>
    </div>
</div>
