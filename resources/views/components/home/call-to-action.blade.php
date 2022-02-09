<div class="max-w-7xl mx-auto py-16 px-4 sm:px-6 lg:px-8">
    <div class="bg-blue-800 rounded-lg shadow-xl overflow-hidden lg:grid lg:grid-cols-5 lg:gap-4">
        <div class="pt-10 pb-12 px-6 sm:pt-16 sm:px-16 lg:py-16 lg:pr-0 xl:py-20 xl:px-20  col-span-2">
            <div class="lg:self-center">
                <h2 class="text-3xl font-extrabold text-white sm:text-4xl">
                    <span class="block">{{ __('app.call_to_action.missing_a_result') }}</span>
                    <span class="block">{{ __('app.call_to_action.let_me_know') }}</span>
                </h2>
                <p class="mt-4 text-lg leading-6 text-blue-200">
                    {!! __('app.call_to_action.are_you_missing_a_result', ['break' => '<br>']) !!}
                </p>
                <a href="{{ route('competitions.create') }}"
                   class="mt-8 bg-white border border-transparent rounded-md shadow px-5 py-3 inline-flex items-center text-base font-medium text-gray-900 hover:bg-blue-50 hover:text-gray-900">
                    {{ __('app.call_to_action.add_competition') }}
                </a>
            </div>
        </div>
        <div class="bg-white p-6 sm:p-8 lg:p-12 overflow-hidden col-span-3">
            <x-home.competition-feed :competitions="[]"/>
        </div>
    </div>
</div>
