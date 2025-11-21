<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class Meeting extends Model
{
    protected $fillable = [
        'date',
        'meeting_number',
        'theme',
        'month_name',
        'event_type',
        'notes',
        'is_cancelled',
        'cancellation_reason',
        'sort_order',
    ];

    protected $casts = [
        'date' => 'date',
        'is_cancelled' => 'boolean',
    ];

    protected function eventType(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value ?? 'regular',
        );
    }
}
