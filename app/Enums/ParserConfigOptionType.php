<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static String()
 * @method static static Regex()
 */
final class ParserConfigOptionType extends Enum
{
    const String = 0;
    const Regex = 1;
}
