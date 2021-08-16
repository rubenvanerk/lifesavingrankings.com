<div class="flow-root my-auto">
    <ul>

        @foreach(range(1, 5) as $i)
            <li>
                <div class="relative pb-8">
                    @if($i !== 5)
                        <span class="absolute top-2 left-2 -ml-px h-full w-0.5 bg-gray-200" aria-hidden="true"></span>
                    @endif

                    <div class="relative flex space-x-3">
                        <div class="pt-2">
                            <span class="h-4 w-4 rounded-full bg-gray-400 flex items-center justify-center ring-4 ring-white">
                            </span>
                        </div>
                        <div class="min-w-0 flex-1 flex justify-between space-x-4">
                            <div>
                                <p class="text-sm text-gray-500 leading-8">
                                    {!! __('app.added_competition', ['competition_name' => '<a href="#" class="font-medium text-gray-900">' . 'ILSE Dordrecht' . '</a>', 'result_count' => 3453]) !!}
                                </p>
                            </div>
                            <div class="text-right text-sm whitespace-nowrap text-gray-500 leading-8">
                                <time datetime="{{ now()->format('Y-m-d') }}">{{ now()->isoFormat('ll') }}</time>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        @endforeach

    </ul>
</div>
