<x-buk-input :name="$name" :type="$type ?? 'text'" :value="$value ?? null"
    {{ $attributes->merge(['class' => 'shadow-sm focus:ring-blue-800 focus:border-blue-800 block w-full sm:text-sm border-gray-300 rounded-md']) }} />
<x-forms.error :name="$name"/>
