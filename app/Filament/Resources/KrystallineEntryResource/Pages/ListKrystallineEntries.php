<?php

namespace App\Filament\Resources\KrystallineEntryResource\Pages;

use App\Filament\Resources\KrystallineEntryResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListKrystallineEntries extends ListRecords
{
    protected static string $resource = KrystallineEntryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
