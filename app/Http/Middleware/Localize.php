<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class Localize
{
    public const SESSION_KEY = 'locale';

    public function handle(Request $request, Closure $next)
    {
        $locales = array_keys(config('app.locales'));

        if (!session()->has(self::SESSION_KEY)) {
            session()->put(
                self::SESSION_KEY,
                $request->getPreferredLanguage($locales),
            );
        }

        app()->setLocale(session()->get(self::SESSION_KEY));

        return $next($request);
    }
}
