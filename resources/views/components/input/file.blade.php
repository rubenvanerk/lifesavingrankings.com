@aware(['error', 'required', 'id'])

<input
    @if ($id) id="{{ $id }}" @else x-bind:id="$id('input')" @endif
    type="file"
    name="{{ $name }}"
    {{ $required ? 'required' : '' }}
    {{ $attributes->class([
        'text-gray-900 block w-full'
    ]) }}>
<div wire:loading.delay wire:target="files"><x-heroicon-o-upload class="animate-pulse h-5 w-5"/></div>

