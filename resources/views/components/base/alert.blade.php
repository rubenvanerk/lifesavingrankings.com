@php
    list($backgroundColor, $titleColor, $textColor) = match($color) {
        'amber' => ['bg-amber-50', 'text-amber-800', 'text-amber-700'],
        'blue' => ['bg-blue-50', 'text-blue-800', 'text-blue-700'],
        'red' => ['bg-red-50', 'text-red-800', 'text-red-700'],
        'violet' => ['bg-violet-50', 'text-violet-800', 'text-violet-700'],
        'emerald' => ['bg-emerald-50', 'text-emerald-800', 'text-emerald-700'],
        default => throw new Exception("Unknown color $color, add it to base.alert component")
    }
@endphp

<div {{ $attributes->merge(['class' => 'rounded-md p-4 ' . $backgroundColor]) }}>
    <div class="ml-3">
        @if (isset($title))
            <h3 class="text-sm font-medium {{ $titleColor }}">
                {{ $title }}
            </h3>
        @endif
        <div class="mt-2 text-sm {{ $textColor }}">
            <p>
                {{ $body ?? $slot }}
            </p>
        </div>
    </div>
</div>
