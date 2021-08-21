<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static OptionOne()
 * @method static static OptionTwo()
 * @method static static OptionThree()
 */
final class ResultStatus extends Enum
{
    const WDR = 0; // Withdrawn
    const DSQ = 1; // Disqualified
    const DNS = 2; // Did not start
    const DNF = 3; // Did not finish
}
