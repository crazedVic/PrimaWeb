<?php

namespace App\Filament\Resources;

use App\Filament\Resources\KrystallineEntryResource\Pages;
use App\Filament\Resources\KrystallineEntryResource\RelationManagers;
use App\Models\KrystallineEntry;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class KrystallineEntryResource extends Resource
{
    protected static ?string $model = KrystallineEntry::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('krystallinen_id')
                    ->label('Krystallinen Section')
                    ->relationship('krystallinen', 'section_name')
                    ->required()
                    ->searchable()
                    ->preload(),
                Forms\Components\DatePicker::make('date')
                    ->label('Date')
                    ->displayFormat('d.m.Y'),
                Forms\Components\Textarea::make('description')
                    ->label('Description')
                    ->rows(2)
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('time')
                    ->label('Time')
                    ->maxLength(255),
                Forms\Components\FileUpload::make('lageplan_file')
                    ->label('Lageplan (Image or PDF)')
                    ->directory('krystallinen/lageplan')
                    ->acceptedFileTypes(['image/*', 'application/pdf'])
                    ->maxSize(10240)
                    ->downloadable()
                    ->previewable(),
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
                Tables\Columns\TextColumn::make('krystallinen.section_name')
                    ->label('Section')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('date')
                    ->label('Date')
                    ->date('d.m.Y')
                    ->sortable(),
                Tables\Columns\TextColumn::make('description')
                    ->label('Description')
                    ->limit(50)
                    ->searchable(),
                Tables\Columns\TextColumn::make('time')
                    ->label('Time')
                    ->searchable(),
                Tables\Columns\IconColumn::make('lageplan_file')
                    ->label('Lageplan')
                    ->boolean()
                    ->getStateUsing(fn ($record) => !empty($record->lageplan_file)),
                Tables\Columns\TextColumn::make('sort_order')
                    ->label('Sort Order')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_active')
                    ->label('Active')
                    ->boolean(),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('krystallinen_id')
                    ->label('Section')
                    ->relationship('krystallinen', 'section_name'),
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
            'index' => Pages\ListKrystallineEntries::route('/'),
            'create' => Pages\CreateKrystallineEntry::route('/create'),
            'edit' => Pages\EditKrystallineEntry::route('/{record}/edit'),
        ];
    }
}
