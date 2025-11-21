<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class MemberContact extends Model
{
    protected $fillable = [
        'member_id',
        'rank_abbreviation',
        'member_name',
        'member_title_details',
        'real_name',
        'profession',
        'birth_date',
        'address',
        'phone_home',
        'phone_cell',
        'phone_fax',
        'email',
        'category',
        'sort_order',
    ];

    protected $casts = [
        'birth_date' => 'date',
    ];

    public function member(): BelongsTo
    {
        return $this->belongsTo(Member::class);
    }
}
