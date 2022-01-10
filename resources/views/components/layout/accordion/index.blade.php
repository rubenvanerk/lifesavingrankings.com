<div x-data="{ active: 1 }" {{ $attributes->merge(['class' => 'space-y-4']) }}>
    {{ $slot }}
</div>
