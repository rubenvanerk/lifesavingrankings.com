@aware(['name', 'error', 'required', 'id'])

<input
    @if ($id) id="{{ $id }}" @else x-bind:id="$id('input')" @endif
    name="{{ $name }}"
    type="radio"
    {{ $attributes->class('focus:ring-blue-800 h-4 w-4 text-blue-800 border-gray-300') }}>
