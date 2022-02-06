<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SponsorResource\Pages;
use App\Models\Sponsor;
use Filament\Forms;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class SponsorResource extends Resource
{
    protected static ?string $model = Sponsor::class;

    protected static ?string $navigationIcon = 'heroicon-o-currency-dollar';

    protected static ?string $recordTitleAttribute = 'name';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')->columnSpan(2),
                Forms\Components\DatePicker::make('valid_from')->withoutTime(),
                Forms\Components\DatePicker::make('valid_until')->withoutTime(),
                Forms\Components\Toggle::make('enabled'),
                Forms\Components\SpatieMediaLibraryFileUpload::make('logo')
//                    ->image()
//                    ->acceptedFileTypes(['.svg'])
//                    ->minFiles(1)
//                    ->maxFiles(1)
                    ->collection('logo'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->sortable(),
                Tables\Columns\TextColumn::make('valid_from')->date()->sortable(),
                Tables\Columns\TextColumn::make('valid_until')->date()->sortable(),
                Tables\Columns\BooleanColumn::make('enabled')->sortable(),
                Tables\Columns\BooleanColumn::make('visible'),
            ])
            ->filters([
                Tables\Filters\Filter::make('visible')
                    ->query(fn (Builder $query) => $query->visible()), // @phpstan-ignore-line
            ])
            ->prependActions([
                Tables\Actions\LinkAction::make('toggle_enabled')
                    ->action(fn (Sponsor $record) => $record->update(['enabled' => !$record->enabled])),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSponsors::route('/'),
            'create' => Pages\CreateSponsor::route('/create'),
            'edit' => Pages\EditSponsor::route('/{record}/edit'),
        ];
    }
}
