@props(['error' => null, 'required' => null, 'id' => null])

<div
    x-data
    x-id="['input']"
    {{ $attributes }}
>
    {{ $slot }}

    @if($error)
        <p class="mt-2 text-sm text-red-600" id="email-error">{{ $error }}</p>
    @endif
</div>
