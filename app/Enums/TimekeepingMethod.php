<?php

namespace App\Enums;

use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum;

/**
 * @method static static Unknown()
 * @method static static ByHand()
 * @method static static Electronic()
 */
final class TimekeepingMethod extends Enum implements LocalizedEnum
{
    public const Unknown = 0;
    public const ByHand = 1;
    public const Electronic = 2;
}
