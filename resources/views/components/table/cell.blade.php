<td {{ $attributes->merge(['class' => 'px-6 py-4 whitespace-nowrap text-sm text-gray-500']) }} wire:loading.class.delay="animate-pulse">
    {{ $slot }}
</td>
