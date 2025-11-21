<?php

namespace App\Filament\Resources\KrystallinenResource\Pages;

use App\Filament\Resources\KrystallinenResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListKrystallinens extends ListRecords
{
    protected static string $resource = KrystallinenResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
