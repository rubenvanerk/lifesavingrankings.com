<?php

namespace App\Enums;

use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum;

/**
 * @method static static Men()
 * @method static static Women()
 */
final class Gender extends Enum implements LocalizedEnum
{
    const Men = 1;
    const Women = 2;
}
