<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static WDR()
 * @method static static DSQ()
 * @method static static DNS()
 * @method static static DNF()
 */
final class ResultStatus extends Enum
{
    const WDR = 0; // Withdrawn
    const DSQ = 1; // Disqualified
    const DNS = 2; // Did not start
    const DNF = 3; // Did not finish
}
