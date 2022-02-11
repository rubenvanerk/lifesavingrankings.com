@props(['type'])

@aware(['name', 'error', 'required', 'id'])

<div class="relative">
    <input
        @if ($id) id="{{ $id }}" @else x-bind:id="$id('input')" @endif
        type="{{ $type }}"
        name="{{ $name }}"
        {{ $required ? 'required' : '' }}
        {{ $attributes->class([
            'shadow-sm text-gray-900 block w-full sm:text-sm rounded-md',
            'border-gray-300 focus:ring-blue-800 focus:border-blue-800' => !$error,
            'border-red-300 text-red-900 placeholder-red-300 focus:ring-red-500 focus:border-red-500' => $error
        ]) }}>

    @if ($error)
        <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
            <x-heroicon-s-exclamation-circle class="h-5 w-5 text-red-500"/>
        </div>
    @endif
</div>

