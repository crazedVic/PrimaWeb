<?php

namespace App\Filament\Resources;

use App\Filament\Resources\KrystallinenResource\Pages;
use App\Filament\Resources\KrystallinenResource\RelationManagers;
use App\Models\Krystallinen;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class KrystallinenResource extends Resource
{
    protected static ?string $model = Krystallinen::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Reiche';
    protected static ?string $modelLabel = 'Reich';
    protected static ?string $pluralModelLabel = 'Reiche';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('header')
                    ->label('Header')
                    ->maxLength(255),
                Forms\Components\Textarea::make('intro_text')
                    ->label('Intro Text')
                    ->rows(3)
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('section_name')
                    ->label('Section Name')
                    ->maxLength(255),
                Forms\Components\TextInput::make('sort_order')
                    ->label('Sort Order')
                    ->numeric()
                    ->default(0)
                    ->required(),
                Forms\Components\Toggle::make('is_active')
                    ->label('Active')
                    ->default(true),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('header')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('section_name')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('entries_count')
                    ->counts('entries')
                    ->label('Entries'),
                Tables\Columns\TextColumn::make('sort_order')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->boolean(),
            ])
            ->filters([
                Tables\Filters\TernaryFilter::make('is_active')
                    ->label('Active'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->defaultSort('sort_order');
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
            'index' => Pages\ListKrystallinens::route('/'),
            'create' => Pages\CreateKrystallinen::route('/create'),
            'edit' => Pages\EditKrystallinen::route('/{record}/edit'),
        ];
    }
}
