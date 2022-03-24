@props(['entrant', 'segments' => []])

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
        @if($entrant->year_of_birth)
            <sup>'{{ substr($entrant->year_of_birth, -2) }}</sup>
        @endif
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
                        <small>
                            <a href="{{ route('athletes.show', $segment->entrant) }}">{{ $segment->entrant->name }}</a>@if (!$loop->last),@endif
                        </small>
                    @endforeach
                </span>
            @endif
        </span>
    @endif
</span>
