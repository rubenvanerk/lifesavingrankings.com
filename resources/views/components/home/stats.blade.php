<div class="mt-8 pb-6 sm:pb-8">
    <div class="relative">
        <div class="absolute inset-0 h-1/2"></div>
        <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="max-w-4xl mx-auto">
                <dl class="rounded-lg bg-white shadow-lg sm:grid sm:grid-cols-3">
                    <div class="flex flex-col border-b border-gray-100 p-6 text-center sm:border-0 sm:border-r">
                        <dt class="order-2 mt-2 text-lg leading-6 font-medium text-gray-500">
                            {{ trans_choice('app.athletes', 2) }}
                        </dt>
                        <dd class="order-1 text-5xl font-extrabold text-blue-800">
                            {{ $athleteCount }}
                        </dd>
                    </div>
                    <div
                        class="flex flex-col border-t border-b border-gray-100 p-6 text-center sm:border-0 sm:border-l sm:border-r">
                        <dt class="order-2 mt-2 text-lg leading-6 font-medium text-gray-500">
                            {{ trans_choice('app.competitions', 2) }}
                        </dt>
                        <dd class="order-1 text-5xl font-extrabold text-blue-800">
                            {{ $competitionCount }}
                        </dd>
                    </div>
                    <div class="flex flex-col border-t border-gray-100 p-6 text-center sm:border-0 sm:border-l">
                        <dt class="order-2 mt-2 text-lg leading-6 font-medium text-gray-500">
                            {{ trans_choice('app.results', 2) }}
                        </dt>
                        <dd class="order-1 text-5xl font-extrabold text-blue-800">
                            {{ $resultCount }}
                        </dd>
                    </div>
                </dl>
            </div>
        </div>
    </div>
</div>
