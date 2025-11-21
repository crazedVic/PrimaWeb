<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Fechsung extends Model
{
    protected $table = 'fechsungen';
    
    protected $fillable = [
        'title',
        'description',
        'author',
        'author_meeting_number',
        'meeting_reference',
        'image',
        'pdf_file',
        'sort_order',
    ];
}
