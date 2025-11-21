<?php

namespace App\Filament\Resources;

use App\Filament\Resources\FechsungResource\Pages;
use App\Filament\Resources\FechsungResource\RelationManagers;
use App\Models\Fechsung;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class FechsungResource extends Resource
{
    protected static ?string $model = Fechsung::class;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $navigationLabel = 'Fechsungen';
    protected static ?string $modelLabel = 'Fechsung';
    protected static ?string $pluralModelLabel = 'Fechsungen';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('title')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Textarea::make('description')
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('author')
                    ->maxLength(255)
                    ->placeholder('e.g., Rt. DaDa-Lust (110)'),
                Forms\Components\TextInput::make('author_meeting_number')
                    ->label('Author Meeting Number')
                    ->numeric()
                    ->placeholder('e.g., 110'),
                Forms\Components\TextInput::make('meeting_reference')
                    ->label('Meeting Reference')
                    ->maxLength(255)
                    ->placeholder('e.g., zur Luega-Sippung a.U. 146'),
                Forms\Components\FileUpload::make('image')
                    ->label('Thumbnail Image')
                    ->image()
                    ->directory('fechsungen')
                    ->visibility('public')
                    ->imageEditor()
                    ->helperText('Thumbnail image displayed on the fechsungen page'),
                Forms\Components\FileUpload::make('pdf_file')
                    ->label('PDF File')
                    ->acceptedFileTypes(['application/pdf'])
                    ->directory('fechsungen/pdf')
                    ->visibility('public')
                    ->helperText('PDF file that will be linked from the thumbnail'),
                Forms\Components\TextInput::make('sort_order')
                    ->numeric()
                    ->default(0),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('image')
                    ->label('Preview')
                    ->circular(),
                Tables\Columns\TextColumn::make('title')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('author')
                    ->searchable(),
                Tables\Columns\TextColumn::make('meeting_reference')
                    ->limit(30),
                Tables\Columns\IconColumn::make('pdf_file')
                    ->label('PDF')
                    ->boolean()
                    ->getStateUsing(fn ($record) => !empty($record->pdf_file)),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
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
            'index' => Pages\ListFechsungs::route('/'),
            'create' => Pages\CreateFechsung::route('/create'),
            'edit' => Pages\EditFechsung::route('/{record}/edit'),
        ];
    }
}
