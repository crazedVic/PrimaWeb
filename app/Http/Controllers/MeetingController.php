<?php

namespace App\Http\Controllers;

use App\Models\Meeting;
use Illuminate\Http\Request;

class MeetingController extends Controller
{
    public function index()
    {
        $meetings = Meeting::orderBy('date', 'desc')->get();
        
        return view('meetings.index', compact('meetings'));
    }
}
