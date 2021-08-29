<?php

use App\Http\Controllers\AthleteController;
use App\Http\Controllers\Auth\EmailVerificationController;
use App\Http\Controllers\Auth\LogoutController;
use App\Http\Controllers\CompetitionController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\LocaleController;
use App\Http\Controllers\TeamController;
use App\Http\Livewire\Auth\Login;
use App\Http\Livewire\Auth\Passwords\Confirm;
use App\Http\Livewire\Auth\Passwords\Email;
use App\Http\Livewire\Auth\Passwords\Reset;
use App\Http\Livewire\Auth\Register;
use App\Http\Livewire\Auth\Verify;
use Illuminate\Support\Facades\Route;

Route::get('set-locale/{locale}', LocaleController::class)->name('set-locale');

Route::view('/', 'home')->name('home');

Route::prefix('competitions')->group(function () {
    Route::view('/', 'competitions.index')->name('competitions.index');
    Route::get('/{competition:slug}', [CompetitionController::class, 'show'])->name('competitions.show');
    Route::get('/{competition:slug}/events/{event}/{gender}', [CompetitionController::class, 'event'])->name('competitions.event');
});

Route::prefix('events')->group(function () {
    Route::view('/', 'events.index')->name('events.index');
    Route::get('/{event:slug}/{gender}', [EventController::class, 'show'])->name('events.show');
});

Route::prefix('athletes')->group(function () {
    Route::get('/{athlete:slug}', [AthleteController::class, 'show'])->name('athletes.show');
    Route::get('/{athlete:slug}/events/{event}', [AthleteController::class, 'event'])->name('athletes.event');
});

Route::prefix('teams')->group(function () {
    Route::view('/', 'teams.index')->name('teams.index');
    Route::get('/{team:slug}', [TeamController::class, 'show'])->name('teams.show');
    Route::get('/{team:slug}/events/{event}/{gender}', [TeamController::class, 'event'])->name('teams.event');
});

Route::middleware('guest')->group(function () {
    Route::get('login', Login::class)
        ->name('login');

    Route::get('register', Register::class)
        ->name('register');
});

Route::get('password/reset', Email::class)
    ->name('password.request');

Route::get('password/reset/{token}', Reset::class)
    ->name('password.reset');

Route::middleware('auth')->group(function () {
    Route::get('email/verify', Verify::class)
        ->middleware('throttle:6,1')
        ->name('verification.notice');

    Route::get('password/confirm', Confirm::class)
        ->name('password.confirm');
});

Route::middleware('auth')->group(function () {
    Route::get('email/verify/{id}/{hash}', EmailVerificationController::class)
        ->middleware('signed')
        ->name('verification.verify');

    Route::post('logout', LogoutController::class)
        ->name('logout');
});
