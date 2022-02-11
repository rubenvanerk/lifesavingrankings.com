@if ($option->type->value == \App\Enums\ParserConfigOptionType::Regex)

    <x-input.group id="{{ $option->name }}">
        <x-input.label class="text-white">{{ $option->label }}</x-input.label>
        <x-input.text wire:model="parser_config.options.{{ $option->name }}.value"
                      wire:input="highlight($event.target.value, '{{ $option->name }}')"
                      wire:click="highlight($event.target.value, '{{ $option->name }}')"
                      name="parser_config.options.{{ $option->name }}.value"
                      :class="$this->currentRegexOptionName == $option->name ? 'ring-2 ring-amber-400 border-amber-400 font-mono' : 'font-mono'"/>
    </x-input.group>
    {{-- TODO: install regex highlighter --}}
@else
    <x-input.group id="{{ $option->name }}">
        <x-input.label>{{ $option->label }}</x-input.label>
        <x-input.text
            wire:model="parser_config.options.{{ $option->name }}.value"
            name="parser_config.options.{{ $option->name }}.value"
            class="font-mono"/>
    </x-input.group>
@endif

@if ($option->canOccurOnNextLine)
    <div class="mt-1">
        <x-forms.checkbox.with-inline-label
            label="Occurs on next line"
            name="parser_config.options.{{ $option->name }}.occursOnNextLine"
            wire:model="parser_config.options.{{ $option->name }}.occursOnNextLine"/>
    </div>
@endif
