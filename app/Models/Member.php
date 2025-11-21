<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Member extends Model
{
    protected $fillable = [
        'member_rank_id',
        'name',
        'title',
        'rank_abbreviation',
        'shield_image',
        'shield_thumbnail',
        'meeting_number',
        'is_active',
        'sort_order',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];

    public function rank(): BelongsTo
    {
        return $this->belongsTo(MemberRank::class, 'member_rank_id');
    }
}
