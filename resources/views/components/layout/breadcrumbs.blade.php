@unless ($breadcrumbs->isEmpty())
    <nav class="flex text-white py-4" aria-label="Breadcrumb">
        <ol role="list" class="flex items-center space-x-4">
            @foreach ($breadcrumbs as $breadcrumb)
                @if($loop->first)
                    <li>
                        <div>
                            <a href="{{ $breadcrumb->url }}" class="hover:text-yellow-300">
                                <x-heroicon-s-home class="flex-shrink-0 h-5 w-5"/>
                                <span class="sr-only">Home</span>
                            </a>
                        </div>
                    </li>
                @else
                    <li>
                        <div class="flex items-center">
                            <x-heroicon-s-chevron-right class="flex-shrink-0 h-5 w-5"/>
                            <a href="{{ $breadcrumb->url }}" class="ml-4 text-sm font-medium hover:text-yellow-300">{{ $breadcrumb->title }}</a>
                        </div>
                    </li>
                @endif
            @endforeach
        </ol>
    </nav>
@endunless
