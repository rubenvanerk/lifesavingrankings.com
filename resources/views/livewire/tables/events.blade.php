<div wire:init="loadEvents">
    @if ($title)
        <h3 class="px-4 sm:px-6 lg:px-8 text-2xl font-extrabold text-gray-900 tracking-tight sm:text-3xl mt-8">
            @if($filter->countActive())
                <span class="text-amber-400">{{ ucfirst(__('app.filtered')) }}</span>
                {{ strtolower($titleFiltered) ?: strtolower($title) }}
            @else
                {{ ucfirst($title) }}
            @endif
        </h3>
    @endif

    <x-dynamic-component :component="'tables.events.' . $bladeTemplate" :events="$events" :gender="$genderEnum" :resultLimit="$limit" :competition="$competition ?? null" :athlete="$athlete ?? null" :team="$team ?? null"/>
</div>
