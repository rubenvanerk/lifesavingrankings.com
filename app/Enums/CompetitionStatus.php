<?php

namespace App\Enums;

use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum;

/**
 * @method static static New()
 * @method static static Wanted()
 * @method static static ScheduledForImport()
 * @method static static UnableToImport()
 * @method static static Published()
 */
final class CompetitionStatus extends Enum implements LocalizedEnum
{
    public const New = 0;
    public const Wanted = 1;
    public const ScheduledForImport = 2;
    public const UnableToImport = 3;
    public const Published = 4;
}
