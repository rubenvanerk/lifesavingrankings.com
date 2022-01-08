<?php

namespace App\Http\Livewire\Auth\Passwords;

use Illuminate\Contracts\Auth\PasswordBroker;
use Illuminate\Contracts\View\View;
use Livewire\Component;
use Illuminate\Support\Facades\Password;

class Email extends Component
{
    public string $email;
    public string|bool|null $emailSentMessage = false;

    public function sendResetPasswordLink()
    {
        $this->validate([
            'email' => ['required', 'email'],
        ]);

        $response = $this->broker()->sendResetLink(['email' => $this->email]);

        if ($response == Password::RESET_LINK_SENT) {
            $this->emailSentMessage = trans($response);

            return;
        }

        $this->addError('email', trans($response));
    }

    /**
     * Get the broker to be used during password reset.
     */
    public function broker(): PasswordBroker
    {
        return Password::broker();
    }

    public function render(): View
    {
        return view('livewire.auth.passwords.email')->extends('layouts.auth');
    }
}
