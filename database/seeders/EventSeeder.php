<?php

namespace Database\Seeders;

use App\Enums\EventType;
use App\Models\Event;
use App\Models\RelaySegment;
use Arr;
use Illuminate\Database\Seeder;

class EventSeeder extends Seeder
{
    public function run(): void
    {
        $this->seedIndividualPoolEvents();
        $this->seedIndividualOceanEvents();
        $this->seedRelayPoolEvents();
        $this->seedRelayOceanEvents();
    }

    private function seedIndividualPoolEvents(): void
    {
        $events = [
            [
                'name' => '200m obstacle swim',
                'type' => EventType::IndividualPool,
                'sort_order' => 1,
            ],
            [
                'name' => '50m manikin carry',
                'type' => EventType::IndividualPool,
                'sort_order' => 2,
            ],
            [
                'name' => '100m rescue medley',
                'type' => EventType::IndividualPool,
                'sort_order' => 3,
            ],
            [
                'name' => '100m manikin carry with fins',
                'type' => EventType::IndividualPool,
                'sort_order' => 4,
            ],
            [
                'name' => '100m manikin tow with fins',
                'type' => EventType::IndividualPool,
                'sort_order' => 5,
            ],
            [
                'name' => '200m super lifesaver',
                'type' => EventType::IndividualPool,
                'sort_order' => 6,
            ],
            [
                'name' => '100m obstacle swim',
                'type' => EventType::IndividualPool,
                'sort_order' => 7,
            ],
        ];

        foreach ($events as $event) {
            Event::create($event);
        }
    }

    private function seedIndividualOceanEvents(): void
    {
        $events = [
            [
                'name' => 'Surf race',
                'type' => EventType::IndividualOcean,
                'sort_order' => 1,
            ],
            [
                'name' => 'Rescue tube race',
                'type' => EventType::IndividualOcean,
                'sort_order' => 2,
            ],
            [
                'name' => 'Run-swim-run',
                'type' => EventType::IndividualOcean,
                'sort_order' => 3,
            ],
            [
                'name' => 'Beach flags',
                'type' => EventType::IndividualOcean,
                'sort_order' => 4,
            ],
            [
                'name' => 'Beach sprint',
                'type' => EventType::IndividualOcean,
                'sort_order' => 5,
            ],
            [
                'name' => '1km beach run',
                'type' => EventType::IndividualOcean,
                'sort_order' => 6,
            ],
            [
                'name' => '2km beach run',
                'type' => EventType::IndividualOcean,
                'sort_order' => 7,
            ],
            [
                'name' => 'Surf ski race',
                'type' => EventType::IndividualOcean,
                'sort_order' => 8,
            ],
            [
                'name' => 'Board race',
                'type' => EventType::IndividualOcean,
                'sort_order' => 9,
            ],
            [
                'name' => 'Oceanman/oceanwoman',
                'type' => EventType::IndividualOcean,
                'sort_order' => 10,
            ],
            [
                'name' => 'Ocean M',
                'type' => EventType::IndividualOcean,
                'sort_order' => 11,
            ],
            [
                'name' => 'Oceanman/oceanwoman eliminator',
                'type' => EventType::IndividualOcean,
                'sort_order' => 12,
            ],
        ];

        foreach ($events as $event) {
            Event::create($event);
        }
    }

    private function seedRelayPoolEvents(): void
    {
        $events = [
            [
                'name' => '12.5m line throw',
                'type' => EventType::RelayPool,
                'sort_order' => 8,
                'segments' => [
                    1 => [
                        'name' => 'Throw',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 1,
                    ],
                    2 => [
                        'name' => 'Swim',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 2,
                    ],
                ],
            ],
            [
                'name' => '4×25m manikin relay',
                'type' => EventType::RelayPool,
                'sort_order' => 9,
                'segments' => [
                    1 => [
                        'name' => '25m manikin carry',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 3,
                    ],
                    2 => [
                        'name' => '25m manikin carry',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 3,
                    ],
                    3 => [
                        'name' => '25m manikin carry',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 3,
                    ],
                    4 => [
                        'name' => '25m manikin carry',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 3,
                    ],
                ],
            ],
            [
                'name' => '4×50m obstacle relay',
                'type' => EventType::RelayPool,
                'sort_order' => 10,
                'segments' => [
                    1 => [
                        'name' => '50m obstacle swim',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 4,
                    ],
                    2 => [
                        'name' => '50m obstacle swim',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 4,
                    ],
                    3 => [
                        'name' => '50m obstacle swim',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 4,
                    ],
                    4 => [
                        'name' => '50m obstacle swim',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 4,
                    ],
                ],
            ],
            [
                'name' => '4×50m medley relay',
                'type' => EventType::RelayPool,
                'sort_order' => 11,
                'segments' => [
                    1 => [
                        'name' => '50m freestyle',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 5,
                    ],
                    2 => [
                        'name' => '50m freestyle with fins',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 6,
                    ],
                    3 => [
                        'name' => '50m freestyle with rescue tube',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 7,
                    ],
                    4 => [
                        'name' => '50m person tow',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 8,
                    ],
                ],
            ],
            [
                'name' => '4×50m pool lifesaver relay',
                'type' => EventType::RelayPool,
                'sort_order' => 12,
                'segments' => [
                    1 => [
                        'name' => '50m freestyle',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 5,
                    ],
                    2 => [
                        'name' => '50m freestyle with fins',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 6,
                    ],
                    3 => [
                        'name' => '50m manikin carry',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 9,
                    ],
                    4 => [
                        'name' => '50m manikin carry with fins',
                        'type' => EventType::RelaySegmentPool,
                        'sort_order' => 10,
                    ],
                ],
            ],
        ];

        foreach ($events as $event) {
            $relay = Event::create(Arr::except($event, 'segments'));
            foreach ($event['segments'] as $order => $segment) {
                $segmentEvent = Event::firstOrCreate($segment);
                RelaySegment::create([
                    'event_id' => $relay->id,
                    'segment_id' => $segmentEvent->id,
                    'order' => $order,
                ]);
            }
        }
    }

    private function seedRelayOceanEvents(): void
    {
        $events = [
            [
                'name' => 'Surf teams race',
                'type' => EventType::RelayOcean,
                'sort_order' => 1,
            ],
            [
                'name' => 'Rescue tube rescue',
                'type' => EventType::RelayOcean,
                'sort_order' => 2,
                'segments' => [
                    1 => [
                        'name' => 'Victim',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 1,
                    ],
                    2 => [
                        'name' => 'Rescue tube swimmer',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 2,
                    ],
                    3 => [
                        'name' => 'Rescuer',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 3,
                    ],
                ],
            ],
            [
                'name' => '3×1km beach run relay',
                'type' => EventType::RelayOcean,
                'sort_order' => 3,
                'segments' => [
                    1 => [
                        'name' => '1km run',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 4,
                    ],
                    2 => [
                        'name' => '1km run',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 4,
                    ],
                    3 => [
                        'name' => '1km run',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 4,
                    ],
                ],
            ],
            [
                'name' => 'Beach relay',
                'type' => EventType::RelayOcean,
                'sort_order' => 4,
                'segments' => [
                    1 => [
                        'name' => '90m run',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 5,
                    ],
                    2 => [
                        'name' => '90m run',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 5,
                    ],
                    3 => [
                        'name' => '90m run',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 5,
                    ],
                    4 => [
                        'name' => '90m run',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 5,
                    ],
                ],
            ],
            [
                'name' => 'Surf ski relay',
                'type' => EventType::RelayOcean,
                'sort_order' => 5,
            ],
            [
                'name' => 'Board relay',
                'type' => EventType::RelayOcean,
                'sort_order' => 6,
            ],
            [
                'name' => 'Board rescue',
                'type' => EventType::RelayOcean,
                'sort_order' => 7,
                'segments' => [
                    1 => [
                        'name' => 'Swimmer',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 6,
                    ],
                    2 => [
                        'name' => 'Boarder',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 7,
                    ],
                ],
            ],
            [
                'name' => 'Oceanman/oceanwoman relay',
                'type' => EventType::RelayOcean,
                'sort_order' => 8,
                'segments' => [
                    1 => [
                        'name' => 'Swim',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 6,
                    ],
                    2 => [
                        'name' => 'Board',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 7,
                    ],
                    3 => [
                        'name' => 'Ski',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 8,
                    ],
                    4 => [
                        'name' => 'Run',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 9,
                    ],
                ],
            ],
            [
                'name' => 'Ocean M lifesaver relay',
                'type' => EventType::RelayOcean,
                'sort_order' => 9,
                'segments' => [
                    1 => [
                        'name' => 'Swim',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 6,
                    ],
                    2 => [
                        'name' => 'Board',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 7,
                    ],
                    3 => [
                        'name' => 'Ski',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 8,
                    ],
                    4 => [
                        'name' => 'Run',
                        'type' => EventType::RelaySegmentOcean,
                        'sort_order' => 9,
                    ],
                ],
            ],
        ];

        foreach ($events as $event) {
            if (isset($event['segments'])) {
                $relay = Event::create(Arr::except($event, 'segments'));
            } else {
                $relay = Event::create($event);
            }
            foreach ($event['segments'] ?? [] as $order => $segment) {
                $segmentEvent = Event::firstOrCreate($segment);
                RelaySegment::create([
                    'event_id' => $relay->id,
                    'segment_id' => $segmentEvent->id,
                    'order' => $order,
                ]);
            }
        }
    }
}
