<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static Unknown()
 * @method static static ByHand()
 * @method static static Electronic()
 */
final class TimekeepingMethod extends Enum
{
    public const Unknown = 0;
    public const ByHand = 1;
    public const Electronic = 2;
}
