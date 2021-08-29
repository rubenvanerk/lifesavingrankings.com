<?php

use App\Enums\Gender;
use App\Models\Athlete;
use App\Models\Competition;
use Diglactic\Breadcrumbs\Breadcrumbs;
use Diglactic\Breadcrumbs\Generator as BreadcrumbTrail;

Breadcrumbs::for('home', function (BreadcrumbTrail $trail) {
    $trail->push('Home', route('home'));
});

Breadcrumbs::for('competitions.index', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push(trans_choice('app.competitions', 2), route('competitions.index'));
});

Breadcrumbs::for('competitions.show', function (BreadcrumbTrail $trail, Competition $competition) {
    $trail->parent('competitions.index');
    $trail->push($competition->name, route('competitions.show', $competition));
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
