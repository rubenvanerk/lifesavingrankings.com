@switch(get_class($result))
    @case(\App\Models\Athlete::class)
        <x-search.athlete :athlete="$result"/>
        @break

    @case(\App\Models\Team::class)
        <x-search.team :team="$result"/>
        @break

    @case(\App\Models\Competition::class)
        <x-search.competition :competition="$result"/>
        @break
@endswitch
