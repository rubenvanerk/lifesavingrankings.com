<?php

namespace App\Filament\Resources\CompetitionResource\RelationManagers;

use App\Models\Result;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\RelationManagers\HasManyRelationManager;
use Filament\Resources\Table;
use Filament\Tables;

class ResultsRelationManager extends HasManyRelationManager
{
    protected static string $relationship = 'results';

    protected static ?string $recordTitleAttribute = 'id';

//    public static function form(Form $form): Form
//    {
//        return $form
//            ->schema([
//                //
//            ]);
//    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('entrant.name'),
                Tables\Columns\TextColumn::make('event.name'),
                Tables\Columns\TextColumn::make('time')
            ]);
    }
}
