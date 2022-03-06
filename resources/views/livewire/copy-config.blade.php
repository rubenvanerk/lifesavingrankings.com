<div class="p-4 flex flex-col space-y-3">
    <x-input.group>
        <x-input.label>Config to copy</x-input.label>
        <x-input.select :options="$configs" wire:model.lazy="configToCopy"></x-input.select>
    </x-input.group>

    <div>
        <x-base.button wire:click="copy">Copy</x-base.button>
    </div>

</div>
