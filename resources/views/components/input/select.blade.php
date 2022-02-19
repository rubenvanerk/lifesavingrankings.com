@props(['options' => [], 'value' => null])

<select {{ $attributes->class('mt-1 block w-full pl-3 pr-10 py-2 text-gray-800 border-gray-300 focus:outline-none focus:ring-blue-800 focus:border-blue-800 sm:text-sm rounded-md') }}>
    @foreach($options as $optionValue => $optionName)
        <option value="{{ $optionValue }}">{{ $optionName }}</option>
    @endforeach
</select>
