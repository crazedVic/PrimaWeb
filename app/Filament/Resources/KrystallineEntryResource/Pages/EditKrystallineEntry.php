<?php

namespace App\Filament\Resources\KrystallineEntryResource\Pages;

use App\Filament\Resources\KrystallineEntryResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditKrystallineEntry extends EditRecord
{
    protected static string $resource = KrystallineEntryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
