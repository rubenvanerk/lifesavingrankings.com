<?php

namespace App\Support;

use Illuminate\Support\Facades\Facade;

class ParserFacade extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return 'parser';
    }
}
