<?php

namespace App\Filament\Resources;

use App\Enums\CompetitionStatus;
use App\Enums\TimekeepingMethod;
use App\Filament\Resources\CompetitionResource\Pages;
use App\Filament\Resources\CompetitionResource\RelationManagers\CategoriesRelationManager;
use App\Filament\Resources\CompetitionResource\RelationManagers\ResultsRelationManager;
use App\Models\Competition;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Illuminate\Database\Eloquent\Builder;

class CompetitionResource extends Resource
{
    protected static ?string $model = Competition::class;

    protected static ?string $navigationIcon = 'heroicon-o-collection';

    protected static ?string $recordTitleAttribute = 'name';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')->required(),
                Forms\Components\TextInput::make('slug')->required(),
                Forms\Components\BelongsToManyMultiSelect::make('venues')
                    ->relationship('venues', 'name'),
                Forms\Components\Toggle::make('ils_sanctioned')->label('ILS sanctioned')
                    ->inline(false)
                    ->onIcon('heroicon-s-badge-check')
                    ->offIcon('heroicon-s-x-circle'),
                Forms\Components\DatePicker::make('start_date')->required(),
                Forms\Components\DatePicker::make('end_date')->after('start_date'),
                Forms\Components\Radio::make('timekeeping')->options(TimekeepingMethod::asSelectArray()),
                Forms\Components\Radio::make('status')->options(CompetitionStatus::asSelectArray()),
                Forms\Components\Textarea::make('comment')->columnSpan(2),
                Forms\Components\SpatieMediaLibraryFileUpload::make('files')
                    ->collection('files')
                    ->preserveFilenames(true),
                Forms\Components\Repeater::make('videos')
                    ->schema([
                        Forms\Components\TextInput::make('title')->required(),
                        Forms\Components\TextInput::make('url')->url()->required(),
                    ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name'),
                Tables\Columns\TextColumn::make('status_name')->label('Status'),
                Tables\Columns\TextColumn::make('View')
                    ->default('View')
                    ->url(fn(Competition $record): string => route('competitions.show', ['competition' => $record]))
                    ->openUrlInNewTab()
            ]);
    }

    public static function getRelations(): array
    {
        return [
            ResultsRelationManager::class,
            CategoriesRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCompetitions::route('/'),
            'create' => Pages\CreateCompetition::route('/create'),
            'edit' => Pages\EditCompetition::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()->withoutGlobalScopes();
    }
}
