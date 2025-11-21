<?php

namespace App\Http\Controllers;

use App\Models\Fechsung;
use Illuminate\Http\Request;

class FechsungController extends Controller
{
    public function index()
    {
        $fechsungen = Fechsung::orderBy('sort_order')->get();
        
        return view('fechsungen.index', compact('fechsungen'));
    }
}
