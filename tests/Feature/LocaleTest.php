<?php

namespace Tests\Feature;

use App;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class LocaleTest extends TestCase
{
    public function test_locale_picker(): void
    {
        $response = $this->withHeader('Accept-Language', 'en')->get(
            route('set-locale', ['locale' => 'nl']),
        );
        $response->assertRedirect();
        $response->assertSessionHas(
            App\Http\Middleware\Localize::SESSION_KEY,
            'nl',
        );
    }

    public function test_auto_locale_nl(): void
    {
        $this->withHeader('Accept-Language', 'nl')->get(route('home'));
        $this->assertEquals('nl', $this->app->getLocale());
    }

    public function test_auto_locale_en(): void
    {
        $this->withHeader('Accept-Language', 'en')->get(route('home'));
        $this->assertEquals('en', $this->app->getLocale());
    }
}
