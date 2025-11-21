<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\MemberRank;
use Illuminate\Http\Request;

class MemberController extends Controller
{
    public function index()
    {
        $ranks = MemberRank::with(['members' => function($query) {
            $query->orderBy('sort_order');
        }])->orderBy('sort_order')->get();
        
        return view('members.index', compact('ranks'));
    }
}
