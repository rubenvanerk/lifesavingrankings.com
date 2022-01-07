<?php

namespace App\Providers;

use App\Services\Parsers\Parser;
use Illuminate\Support\ServiceProvider;

class ParserServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind('parser', function () {
            return new Parser();
        });
    }
}
