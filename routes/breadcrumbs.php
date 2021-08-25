<?php

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
