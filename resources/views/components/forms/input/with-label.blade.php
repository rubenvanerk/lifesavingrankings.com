<x-forms.label :for="$name">
    {{ $label }}
</x-forms.label>

<div class="mt-1">
    <x-forms.input.index :name="$name" :type="$type ?? 'text'" required :wire:model.defer="$name"/>
</div>
