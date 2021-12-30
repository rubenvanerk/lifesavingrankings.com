<div class="relative flex items-start">
    <div class="flex items-center h-5">
        <x-forms.checkbox :name="$name" type="checkbox" :wire:model.defer="$name"/>
    </div>
    <div class="ml-3 text-sm">
        <x-forms.label :for="$name">{{ $label }}</x-forms.label>
    </div>
</div>
