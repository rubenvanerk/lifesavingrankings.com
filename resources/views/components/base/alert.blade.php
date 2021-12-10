<div {{ $attributes->merge(['class' => 'rounded-md p-4 bg-' . ($color ?? 'gray') . '-50']) }}>
    <div class="ml-3">
        @if (isset($title))
            <h3 class="text-sm font-medium text-{{ $color ?? 'gray' }}-800">
                {{ $title }}
            </h3>
        @endif
        <div class="mt-2 text-sm text-{{ $color ?? 'gray' }}-700">
            <p>
                {{ $body ?? $slot }}
            </p>
        </div>
    </div>
</div>
