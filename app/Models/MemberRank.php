<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class MemberRank extends Model
{
    protected $fillable = [
        'name',
        'slug',
        'sort_order',
        'description',
    ];

    public function members(): HasMany
    {
        return $this->hasMany(Member::class);
    }
}
