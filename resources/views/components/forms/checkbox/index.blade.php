<x-buk-checkbox :name="$name" {{ $attributes->merge(['class' => 'focus:ring-blue-800 h-4 w-4 text-blue-800 border-gray-300 rounded']) }}/>
<x-forms.error :name="$name"/>
