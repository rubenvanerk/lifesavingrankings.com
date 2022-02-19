<?php

namespace App\Enums;

enum FilterFieldType: string
{
    case Date = 'date';
    case Number = 'number';
    case Select = 'select';
}
