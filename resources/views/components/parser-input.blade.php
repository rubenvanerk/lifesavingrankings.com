@if ($option->type->value == \App\Enums\ParserConfigOptionType::Regex)
    <x-forms.input.with-label
        wire:model="media.parser_config.options.{{ $option->name }}.value"
        name="media.parser_config.options.{{ $option->name }}.value"
        :label="$option->label"
        :class="$this->currentRegexOptionName == $option->name ? 'ring-2 ring-yellow-400 border-yellow-400' : ''"
        wire:input="highlight($event.target.value, '{{ $option->name }}')"/>
@else
    <x-forms.input.with-label
        wire:model="media.parser_config.options.{{ $option->name }}.value"
        name="media.parser_config.options.{{ $option->name }}.value"
        :label="$option->label"/>
@endif
