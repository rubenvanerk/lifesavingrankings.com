<?php

namespace App\Providers;

use App\Services\Filter;
use Illuminate\Support\ServiceProvider;

class FilterServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(Filter::class, function ($app) {
            return new Filter();
        });
    }
}
