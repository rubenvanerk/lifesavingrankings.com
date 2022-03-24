<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AthleteResource\Pages;
use App\Filament\Resources\AthleteResource\RelationManagers;
use App\Models\Athlete;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Illuminate\Database\Eloquent\Model;

class AthleteResource extends Resource
{
    protected static ?string $model = Athlete::class;

    protected static ?string $navigationIcon = 'heroicon-o-users';

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
            Forms\Components\TextInput::make('name')->required(),
            Forms\Components\TextInput::make('slug')
                ->required()
                ->unique(ignorable: fn (?Model $record): ?Model => $record),
            Forms\Components\MultiSelect::make('country_codes')->options(
                $countryOptions->toArray(),
            ),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table->columns([Tables\Columns\TextColumn::make('name')]);
    }

    public static function getRelations(): array
    {
        return [
                //
            ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAthletes::route('/'),
            'create' => Pages\CreateAthlete::route('/create'),
            'edit' => Pages\EditAthlete::route('/{record}/edit'),
        ];
    }
}
