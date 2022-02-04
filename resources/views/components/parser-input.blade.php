@if ($option->type->value == \App\Enums\ParserConfigOptionType::Regex)
    <x-forms.input.with-label
        wire:model="parser_config.options.{{ $option->name }}.value"
        wire:input="highlight($event.target.value, '{{ $option->name }}')"
        wire:click="highlight($event.target.value, '{{ $option->name }}')"
        name="parser_config.options.{{ $option->name }}.value"
        :label="$option->label"
        :class="$this->currentRegexOptionName == $option->name ? 'ring-2 ring-amber-400 border-amber-400 font-mono' : 'font-mono'"/>
    {{-- TODO: install regex highlighter --}}
@else
    <x-forms.input.with-label
        wire:model="parser_config.options.{{ $option->name }}.value"
        name="parser_config.options.{{ $option->name }}.value"
        class="font-mono"
        :label="$option->label"/>
@endif

@if ($option->canOccurOnNextLine)
    <div class="mt-1">
        <x-forms.checkbox.with-inline-label
            label="Occurs on next line"
            name="parser_config.options.{{ $option->name }}.occursOnNextLine"
            wire:model="parser_config.options.{{ $option->name }}.occursOnNextLine"/>
    </div>
@endif
