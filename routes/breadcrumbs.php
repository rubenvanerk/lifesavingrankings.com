<?php

use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use App\Models\Event;
use App\Models\Team;
use Diglactic\Breadcrumbs\Breadcrumbs;
use Diglactic\Breadcrumbs\Generator as BreadcrumbTrail;

Breadcrumbs::for('home', function (BreadcrumbTrail $trail) {
    $trail->push('Home', route('home'));
});

Breadcrumbs::for('competitions.index', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push(trans_choice('app.competitions', 2), route('competitions.index'));
});

Breadcrumbs::for('competitions.create', function (BreadcrumbTrail $trail) {
    $trail->parent('competitions.index');
    $trail->push('Add a competition', route('competitions.create'));
});

Breadcrumbs::for('competitions.show', function (BreadcrumbTrail $trail, Competition $competition) {
    $trail->parent('competitions.index');
    $trail->push($competition->name, route('competitions.show', $competition));
});

Breadcrumbs::for('competitions.parse', function (BreadcrumbTrail $trail, Competition $competition) {
    $trail->parent('competitions.show', $competition);
    $trail->push('Parse', route('competitions.parse', $competition));
});

Breadcrumbs::for('competitions.event', function (BreadcrumbTrail $trail, Competition $competition, $event, $gender) {
    $gender = Gender::coerce(ucfirst($gender));
    $event = Event::where('slug', $event)->first();

    $trail->parent('competitions.show', $competition);
    $trail->push($event->name . ' ' . strtolower($gender->description), route('competitions.event', [
        'competition' => $competition,
        'event' => $event,
        'gender' => $gender->getSlug()
    ]));
});

Breadcrumbs::for('events.index', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push(trans_choice('app.events', 2), route('events.index'));
});

Breadcrumbs::for('events.show', function (BreadcrumbTrail $trail, App\Models\Event $event, $gender) {
    $gender = Gender::coerce(ucfirst($gender));
    $trail->parent('events.index');
    $trail->push($event->name . ' ' . strtolower($gender->description), route('events.show', [$event, $gender->getSlug()]));
});

Breadcrumbs::for('athletes.show', function (BreadcrumbTrail $trail, Athlete $athlete) {
    $trail->parent('home');
    $trail->push(trans_choice('app.athletes', 2));
    $trail->push($athlete->name, route('athletes.show', $athlete));
});

Breadcrumbs::for('athletes.event', function (BreadcrumbTrail $trail, Athlete $athlete, $event) {
    $event = Event::where('slug', $event)->first();

    $trail->parent('athletes.show', $athlete);
    $trail->push($event->name, route('athletes.event', [
        'athlete' => $athlete,
        'event' => $event,
    ]));
});

Breadcrumbs::for('teams.index', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push(trans_choice('app.teams', 2), route('teams.index'));
});

Breadcrumbs::for('teams.show', function (BreadcrumbTrail $trail, Team $team) {
    $trail->parent('teams.index');
    $trail->push($team->name, route('teams.show', $team));
});

Breadcrumbs::for('teams.event', function (BreadcrumbTrail $trail, Team $team, $event, $gender) {
    $gender = Gender::coerce(ucfirst($gender));
    $event = Event::where('slug', $event)->first();

    $trail->parent('teams.show', $team);
    $trail->push($event->name, route('teams.event', compact('team', 'event', 'gender')));
});

Breadcrumbs::for('login', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push(__('app.auth.login'), route('login'));
});

Breadcrumbs::for('register', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push(__('app.auth.register'), route('register'));
});

Breadcrumbs::for('password.request', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push(__('app.auth.forgot_password'), route('password.request'));
});

Breadcrumbs::for('password.reset', function (BreadcrumbTrail $trail, $token) {
    $trail->parent('home');
    $trail->push(__('app.auth.reset_password'), route('password.reset', ['token' => $token]));
});

Breadcrumbs::for('password.confirm', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push(__('app.auth.confirm_password'), route('password.confirm'));
});

Breadcrumbs::for('verification.notice', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push(__('app.auth.reset_password'), route('verification.notice'));
});
