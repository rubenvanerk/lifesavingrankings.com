<div wire:init="loadEvents">
    <x-dynamic-component
        :title="$title"
        :component="'tables.events.' . $bladeTemplate"
        :events="$events"
        :gender="$genderEnum"
        :resultLimit="$limit"
        :competition="$competition ?? null"
        :athlete="$athlete ?? null"
        :team="$team ?? null"/>
</div>
