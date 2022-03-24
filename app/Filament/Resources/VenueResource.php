<?php

namespace App\Filament\Resources;

use App\Enums\VenueType;
use App\Filament\Resources\VenueResource\Pages;
use App\Models\Venue;
use Closure;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class VenueResource extends Resource
{
    protected static ?string $model = Venue::class;

    protected static ?string $navigationIcon = 'heroicon-o-location-marker';

    protected static ?string $recordTitleAttribute = 'name';

    public static function form(Form $form): Form
    {
        $countryOptions = collect(countries())->pluck(
            'name',
            'iso_3166_1_alpha2',
        );
        $countryOptions = $countryOptions->mapWithKeys(
            fn($countryName, $countryCode) => [
                strtolower((string) $countryCode) => $countryName,
            ],
        );

        return $form->schema([
            Forms\Components\TextInput::make('name')
                ->required()
                ->reactive()
                ->afterStateUpdated(fn (Closure $set, $state) => $set('slug', Str::slug($state))),
            Forms\Components\TextInput::make('slug')
                ->required()
                ->maxLength(255)
                ->unique(ignorable: fn (?Model $record): ?Model => $record),
            Forms\Components\TextInput::make('city')
                ->required()
                ->maxLength(255),
            Forms\Components\Select::make('country_code')
                ->options($countryOptions)
                ->required(),
            Forms\Components\Radio::make('type')
                ->options(VenueType::asSelectArray())
                ->required(),
            Forms\Components\Radio::make('pool_size')->options([
                null => 'N/A',
                25 => '25m',
                50 => '50m',
            ]),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table->columns([
            Tables\Columns\TextColumn::make('name'),
            Tables\Columns\TextColumn::make('city'),
            Tables\Columns\TextColumn::make('type_name'),
            Tables\Columns\TextColumn::make('pool_size_label'),
        ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListVenues::route('/'),
            'create' => Pages\CreateVenue::route('/create'),
            'edit' => Pages\EditVenue::route('/{record}/edit'),
        ];
    }
}
