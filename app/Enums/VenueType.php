<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static Pool()
 * @method static static Beach()
 */
final class VenueType extends Enum
{
    public const Pool = 0;
    public const Beach = 1;
}
