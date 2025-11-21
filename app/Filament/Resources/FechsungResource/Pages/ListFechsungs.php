<?php

namespace App\Filament\Resources\FechsungResource\Pages;

use App\Filament\Resources\FechsungResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListFechsungs extends ListRecords
{
    protected static string $resource = FechsungResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
