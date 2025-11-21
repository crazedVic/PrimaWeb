<?php

namespace App\Http\Controllers;

use App\Models\Meeting;
use App\Models\MemberContact;
use App\Models\Page;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function show($slug = null)
    {
        // Handle /privat/sassenschaft route
        if (request()->is('privat/sassenschaft')) {
            $page = Page::where('slug', 'sassenschaft')->where('is_published', true)->firstOrFail();
            $contacts = MemberContact::orderBy('category')->orderBy('sort_order')->get()->groupBy('category');
            return view('pages.sassenschaft', compact('page', 'contacts'));
        }
        
        // Handle sippungsfolge route (can be called with or without slug parameter)
        if (request()->is('sippungsfolge') || $slug === 'sippungsfolge') {
            $page = Page::where('slug', 'sippungsfolge')->where('is_published', true)->firstOrFail();
            $meetings = Meeting::orderBy('date', 'desc')->get();
            return view('pages.sippungsfolge', compact('page', 'meetings'));
        }
        
        // Handle unserestadt - show gallery by categories
        if (request()->is('unserestadt') || $slug === 'unserestadt') {
            $page = Page::where('slug', 'unserestadt')->where('is_published', true)->firstOrFail();
            // Get all categories that have gallery images (excluding fechsung)
            $categories = \App\Models\Category::where('slug', '!=', 'fechsung')
                ->where('is_active', true)
                ->whereHas('galleryImages')
                ->with(['galleryImages' => function($query) {
                    $query->orderBy('sort_order');
                }])
                ->orderBy('name')
                ->get();
            
            return view('pages.unserestadt', compact('page', 'categories'));
        }
        
        // Handle krystallinen - show database-driven content
        if (request()->is('krystallinen') || $slug === 'krystallinen') {
            $page = Page::where('slug', 'krystallinen')->where('is_published', true)->firstOrFail();
            $krystallinen = \App\Models\Krystallinen::where('is_active', true)
                ->with(['activeEntries'])
                ->orderBy('sort_order')
                ->get();
            
            return view('pages.krystallinen', compact('page', 'krystallinen'));
        }
        
        // Regular page - need slug parameter
        if (!$slug) {
            abort(404);
        }
        
        $page = Page::where('slug', $slug)->where('is_published', true)->firstOrFail();
        
        return view('pages.show', compact('page'));
    }
}
