<span {{ $attributes }}>
    @if ($entrant instanceof \App\Models\Athlete)
        <a href="{{ route('athletes.show', $entrant) }}" class="inline-flex items-center space-x-1">
            @foreach($entrant->nationalities ?? [] as $country)
                <x-flag :country="$country"/>
            @endforeach
            <span>
                {{ $entrant->name }}
            </span>
        </a>
        <sup>'{{ substr($entrant->year_of_birth, -2) }}</sup>
    @else
        <span class="flex flex-col">
            <span class="inline-flex items-center space-x-1">
                @if ($entrant->country)
                    <x-flag :country="$entrant->country"/>
                @endif
                <span>
                    {{ $entrant->name }}
                </span>
            </span>
            @if (!empty($segments))
                <span>
                    @foreach($segments as $segment)
                        <small><a href="{{ route('athletes.show', $segment->entrant) }}">{{ $segment->entrant->name }}@if (!$loop->last),@endif</a></small>
                    @endforeach
                </span>
            @endif
        </span>
    @endif
</span>
