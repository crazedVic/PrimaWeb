<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class KrystallineEntry extends Model
{
    protected $table = 'krystalline_entries';
    
    protected $fillable = [
        'krystallinen_id',
        'date',
        'description',
        'time',
        'lageplan_file',
        'sort_order',
        'is_active',
    ];
    
    protected $casts = [
        'date' => 'date',
        'is_active' => 'boolean',
    ];
    
    public function krystallinen(): BelongsTo
    {
        return $this->belongsTo(Krystallinen::class);
    }
}
