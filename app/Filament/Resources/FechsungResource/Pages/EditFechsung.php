<?php

namespace App\Filament\Resources\FechsungResource\Pages;

use App\Filament\Resources\FechsungResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditFechsung extends EditRecord
{
    protected static string $resource = FechsungResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
