@unless ($breadcrumbs->isEmpty())
    <nav class="flex py-4" aria-label="Breadcrumb">
        <ol role="list" class="flex items-center md:space-x-4">
            @foreach ($breadcrumbs as $breadcrumb)
                @if($loop->first)
                    <li class="hidden sm:block">
                        <div>
                            <a href="{{ $breadcrumb->url }}" class="hover:text-gray-200 text-white">
                                <x-heroicon-s-home class="flex-shrink-0 h-5 w-5"/>
                                <span class="sr-only">Home</span>
                            </a>
                        </div>
                    </li>
                @else
                    <li class="hidden sm:block">
                        <div class="flex items-center">
                            <x-heroicon-s-chevron-right class="flex-shrink-0 h-5 w-5 mt-0.5 text-white"/>
                            @if ($loop->last)
                                <span class="ml-4 text-sm font-semibold text-yellow-300">{{ $breadcrumb->title }}</span>
                            @else
                                <a href="{{ $breadcrumb->url }}"
                                   class="ml-4 text-sm font-medium text-white hover:text-gray-100 hover:underline">{{ $breadcrumb->title }}</a>
                            @endif
                        </div>
                    </li>
                @endif
            @endforeach

            @php
                $parent = $breadcrumbs->slice($breadcrumbs->count() - 2, 1)->first();
            @endphp

            <li class="sm:hidden">
                <a href="{{ $parent->url }}"
                   class="text-sm font-medium hover:text-yellow-300 text-gray-100 flex items-center space-x-1">
                    <x-heroicon-s-chevron-left class="flex-shrink-0 h-4 w-4 mt-0.5"/>
                    <span>
                        {{ $parent->title }}
                    </span>
                </a>
            </li>
        </ol>
    </nav>
@endunless
