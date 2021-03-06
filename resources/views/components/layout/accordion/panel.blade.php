<div x-data="{
        id: {{ $panelId }},
        get expanded() {
            return this.active === this.id
        },
        set expanded(value) {
            this.active = value ? this.id : null
        },
    }" x-cloak role="region" class="border rounded shadow-inner">
    <h2>
        <button
            x-on:click="expanded = !expanded"
            :aria-expanded="expanded"
            class="flex items-center justify-between w-full text-xl px-6 py-3 text-gray-900"
        >
            <span class="flex items-center truncate space-x-3">
                <span>{{ $title }}</span>
            @if ($active)
                    <span class="w-2.5 h-2.5 shrink-0 rounded-full bg-amber-400"></span>
                @endif
            </span>
            <span x-show="expanded" aria-hidden="true" class="ml-4 font-bold">&minus;</span>
            <span x-show="!expanded" aria-hidden="true" class="ml-4 font-bold">&plus;</span>
        </button>
    </h2>

    <div x-show="expanded" x-collapse>
        <div class="pb-4 px-6 flex flex-col gap-y-4">
            {{ $slot }}
        </div>
    </div>
</div>
