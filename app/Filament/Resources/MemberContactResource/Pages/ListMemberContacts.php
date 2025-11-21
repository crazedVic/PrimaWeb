<?php

namespace App\Filament\Resources\MemberContactResource\Pages;

use App\Filament\Resources\MemberContactResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListMemberContacts extends ListRecords
{
    protected static string $resource = MemberContactResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
