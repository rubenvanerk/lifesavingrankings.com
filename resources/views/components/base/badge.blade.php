@php
    $colorClasses = match($color) {
        'amber' => 'bg-amber-100 text-amber-800',
        'blue' => 'bg-blue-100 text-blue-800',
        'red' => 'bg-red-100 text-red-800',
        'violet' => 'bg-violet-100 text-violet-800',
        'emerald' => 'bg-emerald-100 text-emerald-800',
        'gray' => 'bg-gray-100 text-gray-800',
        default => throw new Exception("Unknown color $color, add it to base.badge component")
    }
@endphp

<span {{ $attributes->merge(['class' => 'inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ' . $colorClasses]) }}>
    {{ $slot }}
</span>
