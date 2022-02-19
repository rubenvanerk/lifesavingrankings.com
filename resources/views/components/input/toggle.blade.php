@props(['name' => null, 'value' => false])

<div
    x-data="{ value: @js($value) }"
    x-modelable="value"
    {{ $attributes }}
>

    <input hidden name="{{ $name }}" x-bind:value="value">

    <button
        type="button"
        role="switch"
        x-on:click="value = !value"
        x-bind:aria-checked="value.toString()"
        x-bind:class="value ? 'bg-blue-700' : 'bg-gray-200'"
        class="bg-gray-200 relative inline-flex flex-shrink-0 h-6 w-11 border-2 border-transparent rounded-full cursor-pointer transition-colors ease-in-out duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-700">
        <span class="sr-only">Use setting</span>
        <span aria-hidden="true"
              x-bind:class="value ? 'translate-x-5' : 'translate-x-0'"
              class="pointer-events-none inline-block h-5 w-5 rounded-full bg-white shadow transform ring-0 transition ease-in-out duration-200"></span>
    </button>
</div>

