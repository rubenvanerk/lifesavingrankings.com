<?php

namespace App\Http\Livewire;

use App\Models\ParserConfig;
use Illuminate\Contracts\View\View;
use LivewireUI\Modal\ModalComponent;

class CopyConfig extends ModalComponent
{
    public $configToCopy = null;

    public function render(): View
    {
        $configs = ParserConfig::with('media')->get();
        $configs = $configs->mapWithKeys(function ($config) {
            return [$config->id => $config->media->file_name];
        });
        $configs->prepend('Select a config');

        return view('livewire.copy-config', ['configs' => $configs]);
    }

    public function copy(): void
    {
        if (is_numeric($this->configToCopy)) {
            $this->configToCopy = ParserConfig::find($this->configToCopy);
        }
        if ($this->configToCopy instanceof ParserConfig) {
            $this->emit('copy-config', ['parserConfig' => $this->configToCopy]);
            $this->closeModal();
        }
    }
}
