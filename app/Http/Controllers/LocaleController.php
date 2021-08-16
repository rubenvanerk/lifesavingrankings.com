<?php

namespace App\Http\Controllers;

use App\Http\Middleware\Localize;
use Illuminate\Http\RedirectResponse;
use Request;

class LocaleController extends Controller
{
    public function __invoke(Request $request, $locale): RedirectResponse
    {
        session([Localize::SESSION_KEY => $locale]);
        return redirect()->back();
    }
}
