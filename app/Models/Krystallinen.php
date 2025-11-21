<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Krystallinen extends Model
{
    protected $table = 'krystallinen';
    
    protected $fillable = [
        'header',
        'intro_text',
        'section_name',
        'sort_order',
        'is_active',
    ];
    
    protected $casts = [
        'is_active' => 'boolean',
    ];
    
    public function entries(): HasMany
    {
        return $this->hasMany(KrystallineEntry::class)->orderBy('sort_order');
    }
    
    public function activeEntries(): HasMany
    {
        return $this->hasMany(KrystallineEntry::class)->where('is_active', true)->orderBy('sort_order');
    }
}
