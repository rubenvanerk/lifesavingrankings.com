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
