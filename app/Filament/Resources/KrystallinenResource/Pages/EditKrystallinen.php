<?php

namespace App\Filament\Resources\KrystallinenResource\Pages;

use App\Filament\Resources\KrystallinenResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditKrystallinen extends EditRecord
{
    protected static string $resource = KrystallinenResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
