@section('title') Search @endsection

<div class="px-6">
    <div class="flex-col space-y-4 mt-5">
        @forelse($resultSets as $setName => $results)
            <div>
                <div class="bg-white px-4 py-5 border-b border-gray-200 sm:px-6 sm:rounded-t-md">
                    <h3 class="text-lg leading-6 font-medium text-gray-900">{{ trans_choice('app.' . $setName, 2) }}</h3>
                </div>
                <div class="bg-white shadow overflow-hidden sm:rounded-b-md">
                    <ul role="list" class="divide-y divide-gray-200">
                        @foreach($results as $result)
                            <x-search.result :result="$result"/>
                        @endforeach
                    </ul>
                </div>
            </div>
        @empty
            <x-layout.panel>
                <div class="flex items-center space-x-2">
                    @if (strlen($query) > 2)
                        No search results. Try searching for something else?
                    @else
                        <span>Start typing to search</span>
                        <x-heroicon-o-arrow-up class="rotate-45 h-5 w-5"/>
                    @endif
                </div>
            </x-layout.panel>

        @endforelse
    </div>
</div>
