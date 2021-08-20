<?php

namespace App\Enums;

use BenSampo\Enum\Enum;
use BenSampo\Enum\FlaggedEnum;

/**
 * @method static static Individual()
 * @method static static Relay()
 * @method static static Pool()
 * @method static static Ocean()
 * @method static static IndividualPool()
 * @method static static IndividualOcean()
 * @method static static RelayPool()
 * @method static static RelayOcean()
 */
final class EventType extends FlaggedEnum
{
    const Individual = 1 << 0;
    const Relay = 1 << 1;
    const Pool = 1 << 2;
    const Ocean = 1 << 3;

    const IndividualPool = self::Individual | self::Pool;
    const IndividualOcean = self::Individual | self::Ocean;
    const RelayPool = self::Relay | self::Pool;
    const RelayOcean = self::Relay | self::Ocean;
    const RelaySegmentPool = self::Relay | self::Individual | self::Pool;
    const RelaySegmentOcean = self::Relay | self::Individual | self::Ocean;
}
