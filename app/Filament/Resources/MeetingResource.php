<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MeetingResource\Pages;
use App\Filament\Resources\MeetingResource\RelationManagers;
use App\Models\Meeting;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class MeetingResource extends Resource
{
    protected static ?string $model = Meeting::class;

    protected static ?string $navigationIcon = 'heroicon-o-calendar';
    protected static ?string $navigationLabel = 'Sippungen';
    protected static ?string $modelLabel = 'Meeting';
    protected static ?string $pluralModelLabel = 'Sippungen';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\DatePicker::make('date')
                    ->required()
                    ->native(false),
                Forms\Components\TextInput::make('meeting_number')
                    ->label('Meeting Number')
                    ->numeric()
                    ->placeholder('e.g., 1912, 1913'),
                Forms\Components\TextInput::make('month_name')
                    ->label('Month Name (Subcategory)')
                    ->maxLength(255)
                    ->placeholder('e.g., Lethemond, Windmond, Christmond')
                    ->helperText('Type to create a new subcategory or use an existing one'),
                Forms\Components\TextInput::make('theme')
                    ->maxLength(255)
                    ->placeholder('e.g., Schwarzer Humor, Pilgerabend'),
                Forms\Components\Select::make('event_type')
                    ->options([
                        'regular' => 'Regular',
                        'schlaraffiade' => 'Schlaraffiade',
                        'special' => 'Special',
                        'cancelled' => 'Cancelled',
                    ])
                    ->default('regular'),
                Forms\Components\Textarea::make('notes')
                    ->columnSpanFull(),
                Forms\Components\Toggle::make('is_cancelled')
                    ->label('Cancelled')
                    ->default(false),
                Forms\Components\Textarea::make('cancellation_reason')
                    ->label('Cancellation Reason')
                    ->columnSpanFull()
                    ->visible(fn ($get) => $get('is_cancelled')),
                Forms\Components\TextInput::make('sort_order')
                    ->numeric()
                    ->default(0),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('date')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('meeting_number')
                    ->sortable(),
                Tables\Columns\TextColumn::make('month_name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('theme')
                    ->searchable()
                    ->limit(30),
                Tables\Columns\BadgeColumn::make('event_type')
                    ->colors([
                        'primary' => 'regular',
                        'success' => 'schlaraffiade',
                        'warning' => 'special',
                        'danger' => 'cancelled',
                    ]),
                Tables\Columns\IconColumn::make('is_cancelled')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('month_name')
                    ->label('Month Name (Subcategory)')
                    ->options(function () {
                        // Dynamically load month names from existing meetings
                        return \App\Models\Meeting::query()
                            ->whereNotNull('month_name')
                            ->where('month_name', '!=', '')
                            ->distinct()
                            ->orderBy('month_name')
                            ->pluck('month_name', 'month_name')
                            ->toArray();
                    }),
                Tables\Filters\SelectFilter::make('event_type')
                    ->options([
                        'regular' => 'Regular',
                        'schlaraffiade' => 'Schlaraffiade',
                        'special' => 'Special',
                        'cancelled' => 'Cancelled',
                    ]),
                Tables\Filters\TernaryFilter::make('is_cancelled')
                    ->label('Cancelled'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->defaultSort('date', 'desc');
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
            'index' => Pages\ListMeetings::route('/'),
            'create' => Pages\CreateMeeting::route('/create'),
            'edit' => Pages\EditMeeting::route('/{record}/edit'),
        ];
    }
}
