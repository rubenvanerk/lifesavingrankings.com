@section('title') Search @endsection

<div class="px-6">
    <label for="search" class="sr-only">{{ __('app.search') }}</label>
    <div class="relative text-gray-400 focus-within:text-gray-600">
        <div class="pointer-events-none absolute inset-y-0 left-0 pl-3 flex items-center">
            <x-heroicon-s-search class="h-5 w-5"/>
        </div>
        <input id="search"
               class="block w-full bg-white py-2 pl-10 pr-3 border border-transparent rounded-md leading-5 text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-blue-600 focus:ring-amber-300 focus:border-white sm:text-sm"
               placeholder="{{ __('app.search') }}..." type="search" name="search" wire:model="query">
    </div>

    <div class="flex-col space-y-4">
        <div>
            <h2 class="text-lg text-bold">Athletes</h2>
            <ul>
                @foreach($athletes as $athlete)
                    <li>{{ $athlete->name }}</li>
                @endforeach
            </ul>
        </div>

        <div>
            <h2 class="text-lg text-bold">Teams</h2>
            <ul>
                @foreach($teams as $team)
                    <li>{{ $team->name }}</li>
                @endforeach
            </ul>
        </div>

        <div>
            <h2 class="text-lg text-bold">Competitions</h2>
            <ul>
                @foreach($competitions as $competition)
                    <li>{{ $competition->name }}</li>
                @endforeach
            </ul>
        </div>
    </div>

</div>
