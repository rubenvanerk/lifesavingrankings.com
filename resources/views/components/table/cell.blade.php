<td {{ $attributes->merge(['class' => 'px-6 py-4 whitespace-nowrap text-sm text-gray-600']) }} wire:loading.class="animate-pulse">
    {{ $slot }}
</td>
