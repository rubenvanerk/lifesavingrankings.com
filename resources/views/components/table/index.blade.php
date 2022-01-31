@php $title = $title ?? null @endphp

<div class="hidden sm:block">
    <div class="w-full mx-auto {{ ($addPadding ?? true) ? 'p-5' : '' }}">
        <div class="flex flex-col mt-2 @if ($title) bg-white shadow sm:rounded-md sm:overflow-hidden @endif">
            @if ($title)
                <div class="px-4 sm:px-6 py-6">
                    <h2 class="text-2xl font-extrabold text-gray-900 tracking-tight sm:text-2xl">
                        @if($filter->countActive())
                            <span class="text-amber-500">{{ ucfirst(__('app.filtered')) }}</span>
                            {{ strtolower($title) }}
                        @else
                            {{ ucfirst($title) }}
                        @endif
                    </h2>
                </div>
            @endif
            <div class="align-middle min-w-full overflow-x-auto shadow overflow-hidden @if(empty($title)) sm:rounded-lg @else border-t border-gray-20 @endif">
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

@if (isset($mobileBody))
    <div class="shadow sm:hidden">
        <ul class="mobile-table mt-4 divide-y divide-gray-200 overflow-hidden shadow sm:hidden">
            @if ($title)
                <div class="px-4 sm:px-6 py-4 bg-white">
                    <h2 class="text-2xl font-extrabold text-gray-900 tracking-tight sm:text-2xl">
                        @if($filter->countActive())
                            <span class="text-amber-500">{{ ucfirst(__('app.filtered')) }}</span>
                            {{ strtolower($title) }}
                        @else
                            {{ ucfirst($title) }}
                        @endif
                    </h2>
                </div>
            @endif

            {{ $mobileBody }}
        </ul>

        {{ $pagination ?? '' }}
    </div>
@endif
