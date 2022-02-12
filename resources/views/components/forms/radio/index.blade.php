@props(['name', 'value'])

<input :id="$id"
       name="{{ $name }}"
       value="{{ $value }}"
       type="radio"
    {{ $attributes->merge(['class' => 'focus:ring-blue-800 h-4 w-4 text-blue-800 border-gray-300']) }}>
