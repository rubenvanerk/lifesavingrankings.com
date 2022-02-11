@aware(['required', 'id'])

@props(['color' => 'text-gray-700'])

<label
    @if ($id) for="{{ $id }}" @else x-bind:for="$id('input')" @endif
    {{ $attributes->class('block text-sm font-medium mb-1 ' . $color) }}
>

    {{ $slot }}

    @if (!is_null($required))
        @if ($required)
            <span class="text-xs text-red-500">*</span>
        @else
            <span class="text-xs text-gray-500">(optional)</span>
        @endif
    @endif
</label>
