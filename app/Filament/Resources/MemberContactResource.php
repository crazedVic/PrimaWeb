<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MemberContactResource\Pages;
use App\Filament\Resources\MemberContactResource\RelationManagers;
use App\Models\MemberContact;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class MemberContactResource extends Resource
{
    protected static ?string $model = MemberContact::class;

    protected static ?string $navigationIcon = 'heroicon-o-identification';
    protected static ?string $navigationLabel = 'Sassen';
    protected static ?string $modelLabel = 'Sass';
    protected static ?string $pluralModelLabel = 'Sassen';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Member Information')
                    ->schema([
                        Forms\Components\Select::make('member_id')
                            ->label('Linked Member')
                            ->relationship('member', 'name')
                            ->searchable()
                            ->preload(),
                        Forms\Components\TextInput::make('member_name')
                            ->label('Member Name')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('rank_abbreviation')
                            ->label('Rank Abbreviation')
                            ->maxLength(10),
                        Forms\Components\Textarea::make('member_title_details')
                            ->label('Title Details')
                            ->columnSpanFull(),
                        Forms\Components\TextInput::make('category')
                            ->label('Category')
                            ->maxLength(255)
                            ->placeholder('Enter category name')
                            ->helperText('Type to create a new category or use an existing one'),
                    ])
                    ->columns(2),
                Forms\Components\Section::make('Contact Information')
                    ->schema([
                        Forms\Components\TextInput::make('real_name')
                            ->label('Real Name')
                            ->maxLength(255),
                        Forms\Components\TextInput::make('profession')
                            ->maxLength(255),
                        Forms\Components\DatePicker::make('birth_date')
                            ->label('Birth Date')
                            ->native(false),
                        Forms\Components\Textarea::make('address')
                            ->columnSpanFull(),
                        Forms\Components\TextInput::make('phone_home')
                            ->label('Phone (Home)')
                            ->tel()
                            ->maxLength(20),
                        Forms\Components\TextInput::make('phone_cell')
                            ->label('Phone (Cell)')
                            ->tel()
                            ->maxLength(20),
                        Forms\Components\TextInput::make('phone_fax')
                            ->label('Phone (Fax)')
                            ->tel()
                            ->maxLength(20),
                        Forms\Components\TextInput::make('email')
                            ->email()
                            ->maxLength(255),
                    ])
                    ->columns(2),
                Forms\Components\TextInput::make('sort_order')
                    ->numeric()
                    ->default(0),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('rank_abbreviation')
                    ->label('Rank')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('member_name')
                    ->label('Member Name')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('real_name')
                    ->label('Real Name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('profession')
                    ->searchable(),
                Tables\Columns\TextColumn::make('category')
                    ->badge()
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('phone_home')
                    ->label('Phone')
                    ->searchable(),
                Tables\Columns\TextColumn::make('email')
                    ->searchable()
                    ->copyable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('category')
                    ->options(function () {
                        // Dynamically load categories from existing member contacts
                        return \App\Models\MemberContact::query()
                            ->whereNotNull('category')
                            ->where('category', '!=', '')
                            ->distinct()
                            ->orderBy('category')
                            ->pluck('category', 'category')
                            ->toArray();
                    }),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->defaultSort('category')
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
            'index' => Pages\ListMemberContacts::route('/'),
            'create' => Pages\CreateMemberContact::route('/create'),
            'edit' => Pages\EditMemberContact::route('/{record}/edit'),
        ];
    }
}
