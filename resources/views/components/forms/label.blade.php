<label {{ $attributes->merge(['class' => 'block text-sm font-medium'])->merge(['class' => $colorClass ?? 'text-gray-700']) }}>
    {{ $slot }}
</label>
