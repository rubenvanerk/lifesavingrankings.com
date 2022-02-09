<?php

namespace App\Providers;

use App\Services\Filter;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(Filter::class, function ($app) {
            return new Filter();
        });

        if ($this->app->environment('local')) {
            $this->app->register(
                \Laravel\Telescope\TelescopeServiceProvider::class,
            );
            $this->app->register(TelescopeServiceProvider::class);
        }
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
