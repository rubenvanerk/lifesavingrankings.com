<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Verified;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Access\AuthorizationException;

class EmailVerificationController extends Controller
{
    public function __invoke(string $id, string $hash): RedirectResponse
    {
        if (!hash_equals($id, (string) Auth::user()->getKey())) {
            throw new AuthorizationException();
        }

        if (!hash_equals($hash, sha1(Auth::user()->getEmailForVerification()))) {
            throw new AuthorizationException();
        }

        if (Auth::user()->hasVerifiedEmail()) {
            return redirect(route('home'));
        }

        if (Auth::user()->markEmailAsVerified()) {
            if (!is_null(Auth::user())) {
                event(new Verified(Auth::user())); // @phpstan-ignore-line
            }
        }

        return redirect(route('home'));
    }
}
